import { ButtonRotateBorder } from "@/components/ui/button-rotate-border";
import { toast } from "@/components/ui/use-toast.ts";
import { useDocuments } from "@/hooks/useRealtime.tsx";
import { localState, state } from "@/store.ts";
import { useHotkeys } from "@mantine/hooks";
import { useSnapshot } from "valtio";
import { getSession } from "@/lib/session";

export const VoteNext = () => {
  const snap = useSnapshot(state);
  const { decryptedIssues } = useSnapshot(localState);
  const { room } = useDocuments();
  const userId = getSession();
  const isRoomCreator = snap.createdBy === userId;

  const onVoteNext = () => {
    const currentIssueId = snap.currentVotingIssue?.id;

    if (snap.votes.length > 0 && !snap.revealCards) {
      toast({
        title: "Não é possível passar para a próxima tarefa, revele as cartas primeiro",
      });
      return;
    }

    if (!currentIssueId || !decryptedIssues) {
      return;
    }

    const nextIssue = decryptedIssues.find((issue) => issue.storyPoints === 0);

    if (nextIssue) {
      room.set("votes", []);
      room.set("revealCards", false);
      room.set("currentVotingIssue", nextIssue);
      return;
    }

    toast({
      title: "Não há mais tarefas para votar",
    });
  };

  useHotkeys([["n", onVoteNext]]);

  return (
    isRoomCreator && (
      <ButtonRotateBorder onClick={onVoteNext}>Próxima tarefa</ButtonRotateBorder>
    )
  );
};