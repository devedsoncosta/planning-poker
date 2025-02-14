import { MoreHorizontal } from "lucide-react";
import * as React from "react";

import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog.tsx";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuGroup,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Kbd } from "@/components/ui/kbd.tsx";
import { type Issue, state } from "@/store.ts";
import { getHotkeyHandler } from "@mantine/hooks";
import { useHotkeys } from "@mantine/hooks";
import { useRef, useState } from "react";

export function IssueDropdownMenu({
  onDelete,
  cardFocused,
  onCardClick,
  issue,
  index,
}: {
  onDelete: () => void;
  cardFocused: boolean;
  onCardClick: () => void;
  issue: Issue;
  index: number;
}) {
  const [open, setOpen] = React.useState(false);
  const [deleteOpen, setDeleteOpen] = useState(false);
  const moreRef = useRef<HTMLButtonElement>(null);

  useHotkeys([
    [
      "Enter",
      cardFocused && !open ? onCardClick : () => {},
      { preventDefault: false },
    ],
    [
      "mod+Backspace",
      cardFocused
        ? () => {
            setDeleteOpen(true);
          }
        : () => {},
    ],
  ]);

  return (
    <AlertDialog open={deleteOpen} onOpenChange={setDeleteOpen}>
      <DropdownMenu open={open} onOpenChange={setOpen}>
        <DropdownMenuTrigger asChild>
          <Button
            aria-label={`Mais ações para o problema ${issue.title}`}
            variant={"ghost"}
            className={"w-6 h-6 p-0 bg-transparent"}
            ref={moreRef}
            onKeyDown={getHotkeyHandler([
              [
                "Enter",
                (e) => {
                  e.stopPropagation();
                  setOpen(true);
                },
              ],
            ])}
          >
            <MoreHorizontal size={14} />
          </Button>
        </DropdownMenuTrigger>
        <DropdownMenuContent align="end" className="w-[200px]">
          <DropdownMenuGroup>
            <DropdownMenuItem asChild>
              <AlertDialogTrigger
                asChild
                onClick={(e) => {
                  e.stopPropagation();
                }}
              >
                <span>Excluir</span>
              </AlertDialogTrigger>
            </DropdownMenuItem>
          </DropdownMenuGroup>
        </DropdownMenuContent>
      </DropdownMenu>

      <AlertDialogContent
        onCloseAutoFocus={(e) => {
          e.preventDefault();
          e.stopPropagation();

          const current = document.querySelector(
            `[data-vim-position="${index}"]`,
          ) as HTMLElement;

          if (current) {
            current.focus();
            return;
          }

          const prev = document.querySelector(
            `[data-vim-position="${index - 1}"]`,
          ) as HTMLElement;

          if (prev) {
            prev.focus();
            state.currentIndex = index - 1;
            return;
          }

          const next = document.querySelector(
            `[data-vim-position="${index + 1}"]`,
          ) as HTMLElement;

          if (next) {
            state.currentIndex = index + 1;
            next.focus();
            return;
          }

          // nenhum problema encontrado, focar no input
          const input = document.querySelector(
            "[data-testid=create-issue-input]",
          ) as HTMLInputElement;
          if (input) {
            input.focus();
          }
        }}
        onOpenAutoFocus={(e) => {
          e.preventDefault();
          e.stopPropagation();
          // focar em delete-issue
          const deleteIssue = document.querySelector(
            "[data-testid=delete-issue]",
          ) as HTMLButtonElement;
          if (deleteIssue) {
            deleteIssue.focus();
          }
        }}
      >
        <AlertDialogHeader>
          <AlertDialogTitle>
            Você está excluindo o problema: {issue.title}
          </AlertDialogTitle>
          <AlertDialogDescription>
            Você pode desfazer esta ação pressionando <Kbd>Command</Kbd> +{" "}
            <Kbd>z</Kbd>
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel
            onKeyDown={getHotkeyHandler([
              [
                "Enter",
                () => {
                  setDeleteOpen(false);
                },
              ],
            ])}
          >
            Cancelar
          </AlertDialogCancel>
          <AlertDialogAction
            data-testid="delete-issue"
            onKeyDown={getHotkeyHandler([["Enter", onDelete]])}
            onClick={(e) => {
              e.preventDefault();
              e.stopPropagation();
              onDelete();
            }}
          >
            Continuar
          </AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  );
}
