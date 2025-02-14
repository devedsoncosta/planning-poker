import { getHotkeyHandler, useFocusWithin, useHotkeys } from "@mantine/hooks";
import { AnimatePresence, motion } from "framer-motion";
import { useEffect, useRef, useState } from "react";
import { useSnapshot } from "valtio";

import { z } from "zod";

import { ScrollArea } from "@/components/ui/scroll-area";
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip";

import { type Issue, issuesState, localState, state } from "@/store";

import { Button } from "@/components/ui/button";

import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog.tsx";
import { IssueDropdownMenu } from "@/components/ui/dropdown.tsx";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Kbd } from "@/components/ui/kbd.tsx";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/sheet";
import { useToast } from "@/components/ui/use-toast";
import { useDocuments } from "@/hooks/useRealtime";
import useVimNavigation from "@/hooks/useVimNavigation";
import { symmetricEncrypt } from "@/lib/crypto";
import { getSession, getSymmetricKey } from "@/lib/session";
import { cn } from "@/lib/utils.ts";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";

const createIssueSchema = z.object({
  title: z.string(),
});
type CreateIssueFormInput = z.input<typeof createIssueSchema>;
type CreateIssueFormValues = z.infer<typeof createIssueSchema>;

const CreateIssueForm = () => {
  const { issues } = useDocuments();
  const inputRef = useRef<HTMLInputElement>(null);
  useHotkeys([
    [
      "c",
      () => {
        if (inputRef.current) inputRef.current.focus();
      },
    ],
  ]);
  const form = useForm<CreateIssueFormInput, unknown, CreateIssueFormValues>({
    resolver: zodResolver(createIssueSchema),
    defaultValues: {
      title: "",
    },
  });

  const onCreateIssue = (values: CreateIssueFormValues) => {
    const userId = getSession();
    const symmetricKey = getSymmetricKey();
    const { title } = values;

    if (!userId || !symmetricKey || !title.length) return;

    issues.push([
      {
        id: Date.now().toString(),
        storyPoints: 0,
        createdAt: Date.now(),
        createdBy: userId,
        title: symmetricEncrypt(title, symmetricKey),
      },
    ]);

    form.reset({ title: "" });
  };

  return (
    <Form {...form}>
      <form
        onSubmit={form.handleSubmit(onCreateIssue)}
        className="flex flex-col gap-2"
      >
        <FormField
          control={form.control}
          name="title"
          render={({ field }) => (
            <FormItem>
              <FormControl>
                <Input
                  type="text"
                  placeholder="Titulo da tarefa"
                  data-testid="create-issue-input"
                  {...field}
                  ref={inputRef}
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
      </form>
    </Form>
  );
};

function IssueCard(props: {
  issue: Issue;
  "data-vim-position": number;
  onClick: () => void;
  onDelete: () => void;
  onDeleteAll: () => void;
}) {
  const { ref, focused } = useFocusWithin();
  const { currentVotingIssue } = useSnapshot(state);

  useHotkeys([
    ["Enter", focused ? props.onClick : () => {}, { preventDefault: false }],
  ]);

  const currentVoting = currentVotingIssue?.id === props.issue.id;

  return (
    <motion.div
      data-testid={`issue-${props.issue.title}`}
      data-vim-position={props["data-vim-position"]}
      onClick={props.onClick}
      tabIndex={0}
      ref={ref}
      style={{ overflow: "hidden" }}
      className={cn(
        "flex ring-offset-background mx-1 focus-visible:outline-none focus-visible:ring-ring/50   focus-visible:ring-offset-2 focus-visible:ring-1 flex-col  px-3 py-2 mt-2 bg-secondary/40 border rounded-md border-border transition-background ",
        {
          "bg-primary/20": currentVoting,
          "border-primary/50": currentVoting,
        },
      )}
    >
      <div className={"flex justify-between items-center"}>
        <p className={"text-sm"}>{props.issue.title}</p>
        <IssueDropdownMenu
          issue={props.issue}
          onDelete={props.onDelete}
          onCardClick={props.onClick}
          cardFocused={focused}
          index={props["data-vim-position"]}
        />
      </div>

      <div />

      <div className="flex items-center justify-between gap-2 mt-2">
        <span className="flex items-center gap-2 text-sm">
          {props.issue.storyPoints || "-"}
        </span>
      </div>
    </motion.div>
  );
}

const IssueList = () => {
  const snap = useSnapshot(state);
  const issuesSnap = useSnapshot(issuesState);
  const { decryptedIssues } = useSnapshot(localState);
  const { room, issues } = useDocuments();
  const { toast } = useToast();

  const setActiveIssue = (issue: Issue | undefined) => {
    room.set("currentVotingIssue", issue);
    room.set("revealCards", false);
    room.set("votes", []);
  };

  const onDelete = (issueId: string) => {
    if (issueId === snap.currentVotingIssue?.id) {
      toast({
        title: "Não é possível excluir um item que está sendo votado",
      });
      return;
    }

    const deletingIssueIndex = issuesSnap.findIndex(
      (issue) => issue.id === issueId,
    );

    if (issuesSnap[deletingIssueIndex].createdBy !== getSession()) {
      toast({
        title: "Não é possível excluir um item que você não criou",
      });
      return;
    }

    issues.delete(deletingIssueIndex, 1);
  };

  const onDeleteAll = () => {
    if (snap.createdBy !== getSession()) {
      toast({
        title:
          "Não é possível excluir todos as tarefas, apenas o criador da sala pode fazer isso",
      });
      return;
    }

    room.set("currentVotingIssue", undefined);
    room.set("revealCards", false);
    room.set("votes", []);
    issues.delete(0, issuesSnap.length);

    const input = document.querySelector(
      "[data-testid=create-issue-input]",
    ) as HTMLInputElement;

    if (input) {
      input.focus();
    }
  };
  const [deleteOpen, setDeleteOpen] = useState(false);

  useHotkeys([["mod+Shift+Backspace", () => setDeleteOpen(true)]]);

  return (
    <ScrollArea className="h-[85dvh] rounded-md pb-10 px-4">
      <AnimatePresence initial={false}>
        {decryptedIssues
          .slice()
          .reverse()
          .map((issue, index) => (
            <IssueCard
              key={issue.id}
              data-vim-position={index}
              onDelete={() => {
                onDelete(issue.id);
              }}
              onDeleteAll={onDeleteAll}
              issue={issue}
              onClick={() => {
                if (snap.votes.length > 0 && !snap.revealCards) {
                  toast({
                    title: "Não é possível mudar o item, revele as cartas primeiro",
                  });
                  return;
                }

                setActiveIssue(
                  issuesSnap.find(
                    (encryptedIssue) => encryptedIssue.id === issue.id,
                  ),
                );
              }}
            />
          ))}
      </AnimatePresence>

      <AlertDialog open={deleteOpen} onOpenChange={setDeleteOpen}>
        <AlertDialogContent
          onCloseAutoFocus={() => {
            const input = document.querySelector(
              "[data-testid=create-issue-input]",
            ) as HTMLInputElement;

            if (input) {
              input.focus();
            }
          }}
        >
          <AlertDialogHeader>
            <AlertDialogTitle>
              Tem certeza de que deseja excluir todos as tarefas?
            </AlertDialogTitle>
            <AlertDialogDescription>
              Você pode desfazer esta ação pressionando <Kbd>Command</Kbd> +{" "}
              <Kbd>z</Kbd>
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel
              onKeyDown={getHotkeyHandler([
                ["Enter", () => setDeleteOpen(false)],
              ])}
            >
              Cancelar
            </AlertDialogCancel>
            <AlertDialogAction
              autoFocus={deleteOpen}
              onKeyDown={getHotkeyHandler([
                [
                  "Enter",
                  () => {
                    setDeleteOpen(false);
                    onDeleteAll();
                  },
                ],
              ])}
              onClick={() => {
                setDeleteOpen(false);
                onDeleteAll();
              }}
            >
              Continuar
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </ScrollArea>
  );
};

export const Issues = () => {
  const { issuesOpen: open } = useSnapshot(localState);
  const buttonRef = useRef<HTMLButtonElement>(null);
  useVimNavigation();
  const { ref, focused } = useFocusWithin();

  const [mounted, setMounted] = useState(false);
  useHotkeys([
    [
      "Escape",
      () => {
        if (localState.issuesOpen && focused) {
          localState.issuesOpen = false;

          buttonRef.current?.focus();
        }
      },
      { preventDefault: false },
    ],
  ]);

  useHotkeys([
    [
      "i",
      () => {
        localState.issuesOpen = true;
      },
    ],
  ]);

  useEffect(() => {
    setTimeout(() => {
      setMounted(true);
    }, 500);
  });

  return (
    <Sheet
      modal={false}
      open={open}
      defaultOpen={true}
      onOpenChange={(open) => {
        localState.issuesOpen = open;
      }}
    >
      <TooltipProvider>
        <Tooltip>
          <TooltipTrigger asChild>
            <SheetTrigger asChild>
              <Button ref={buttonRef} variant="ghost" size={"icon"}>
                {open ? (
                  <svg
                    width="16"
                    height="16"
                    viewBox="0 0 16 16"
                    fill="currentColor"
                  >
                    <title>Abrir</title>
                    <path
                      fillRule="evenodd"
                      clipRule="evenodd"
                      d="M1 5.25C1 3.45508 2.45508 2 4.25 2H11.75C13.5449 2 15 3.45508 15 5.25V10.7499C15 12.5449 13.5449 13.9999 11.75 13.9999H4.25C2.45508 13.9999 1 12.5449 1 10.7499V5.25ZM4.5 12.4999C3.39543 12.4999 2.5 11.6045 2.5 10.4999V5.5C2.5 4.39543 3.39543 3.5 4.5 3.5H9V12.4999H4.5Z"
                    />
                  </svg>
                ) : (
                  <svg
                    width="16"
                    height="16"
                    viewBox="0 0 16 16"
                    fill="currentColor"
                  >
                    <title>Fechado</title>
                    <path
                      fillRule="evenodd"
                      clipRule="evenodd"
                      d="M4.25 2C2.45508 2 1 3.45508 1 5.25V10.7499C1 12.5449 2.45508 13.9999 4.25 13.9999H11.75C13.5449 13.9999 15 12.5449 15 10.7499V5.25C15 3.45508 13.5449 2 11.75 2H4.25ZM2.5 10.4999C2.5 11.6045 3.39543 12.4999 4.5 12.4999H11.75C12.7165 12.4999 13.5 11.7164 13.5 10.7499V5.25C13.5 4.28351 12.7165 3.5 11.75 3.5H4.5C3.39543 3.5 2.5 4.39543 2.5 5.5V10.4999Z"
                    />
                    <rect x="9" y="3" width="1.5" height="10" />
                  </svg>
                )}
              </Button>
            </SheetTrigger>
          </TooltipTrigger>
          <TooltipContent sideOffset={10}>
            <p>
              {localState.issuesOpen
                ? "Fechar painel de tarefas"
                : "Abrir painel de tarefas"}
            </p>
          </TooltipContent>
        </Tooltip>
      </TooltipProvider>
      <SheetContent
        ref={ref}
        className={cn(
          "m-auto top-[114px] sm:max-w-full md:max-w-full w-full lg:w-full lg:max-w-[370px]  p-0",
          {
            "data-[state=open]:slide-in-from-right": mounted,
          },
        )}
        onInteractOutside={(event) => event.preventDefault()}
      >
        <SheetHeader className={"p-4 px-4 mx-1"}>
          <SheetTitle>Tarefas</SheetTitle>
          <CreateIssueForm />
        </SheetHeader>

        <IssueList />
      </SheetContent>
    </Sheet>
  );
};
