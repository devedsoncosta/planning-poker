import { ButtonRotateBorder } from "@/components/ui/button-rotate-border";
import { useDocuments } from "@/hooks/useRealtime.tsx";
import { issuesState, state, participantsState } from "@/store.ts";
import { useHotkeys } from "@mantine/hooks";
import mean from "lodash.mean";
import { useSnapshot } from "valtio";
import { getSession } from "@/lib/session";

export const RevealCards = () => {
  const snap = useSnapshot(state);
  const issuesSnap = useSnapshot(issuesState);
  const participantsSnap = useSnapshot(participantsState);
  const { room, issues } = useDocuments();
  const userId = getSession();
  const isRoomCreator = snap.createdBy === userId;

  const onRevealCards = () => {
    if (snap.votes?.map((vote) => vote.vote).length === 0) return;

    const currentIssues = issuesSnap;

    const index =
      currentIssues?.findIndex((issue) => {
        return issue.id === snap.currentVotingIssue?.id;
      }) ?? -1;

    if (index !== -1) {
      const numericVotes = snap.votes
          .map((vote) => {
            if (vote.vote === "?" || vote.vote === "☕") {
              return null;
            }
            return typeof vote.vote === "string" ? Number(vote.vote) : vote.vote;
          })
          .filter((vote) => vote !== null && !isNaN(vote));

        const averageStoryPoints = Math.round(mean(numericVotes));

      const updatedIssue = {
        ...currentIssues[index],
        storyPoints: averageStoryPoints,
      };

      if (index >= 0 && index < issues.length) {
        // TODO: update this when YJS has an update method
        // FIXME: run this in a transaction. Valtio é não reativo a esta transação, precisa corrigir
        issues.delete(index, 1);
        issues.insert(index, [updatedIssue]);
      }

      room.set("votingHistory", [
        ...snap.votingHistory,
        {
          id: snap.currentVotingIssue?.id,
          votes: [...snap.votes],
          issueTitle: snap.currentVotingIssue?.title,
          issueId: snap.currentVotingIssue?.id,
          agreement: averageStoryPoints,
        },
      ]);
    }

    room.set("revealCards", true);
  };

  useHotkeys([["r", onRevealCards]]);

  const allVoted = participantsSnap.length > 0 && participantsSnap.every(participant =>
    snap.votes.some(vote => vote.votedBy.id === participant.id && snap.currentVotingIssue?.id)
  );

  return (
    (allVoted || isRoomCreator) && (
      <ButtonRotateBorder onClick={onRevealCards}>
        Revelar carta
      </ButtonRotateBorder>
    )
  );
};