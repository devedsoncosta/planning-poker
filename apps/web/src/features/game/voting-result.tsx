import CardFlip from "@/components/ui/cardflip.tsx";
import { localState, participantsState, state } from "@/store.ts";
import { AnimatePresence, LayoutGroup, motion } from "framer-motion";
import mean from "lodash.mean";
import { useSnapshot } from "valtio";

export const VotingResult = () => {
  const snap = useSnapshot(state);
  const participants = useSnapshot(participantsState);
  const { decryptedIssues } = useSnapshot(localState);

  const numericVotes = snap.votes
    .map((vote) => {
      if (vote.vote === "?" || vote.vote === "☕") {
        return null;
      }
      return typeof vote.vote === "string" ? Number(vote.vote) : vote.vote;
    })
    .filter((vote) => vote !== null && !isNaN(vote));

  const averageStoryPoints = mean(numericVotes);

  const groupedVotes: Record<number | string, number> = snap.votes.reduce<
    Record<number | string, number>
  >((acc, vote) => {
    acc[vote.vote] = (acc[vote.vote] || 0) + 1;
    return acc;
  }, {});

  const decryptedIssueTitle = decryptedIssues.find(
    (decryptedIssue) => decryptedIssue.id === snap.currentVotingIssue?.id,
  )?.title;

  return (
    <div className="flex flex-col w-full gap-2 mx-auto max-w-[800px]">
      <h1 className="text-scale-[18px]/[26px] h-20 self-center mt-[80px]">
        {decryptedIssueTitle && <span>{decryptedIssueTitle}</span>}
      </h1>
      <div className="flex w-full gap-2">
        <AnimatePresence mode="wait">
          <LayoutGroup>
            <div
              className={
                "flex gap-4 justify-center items-center flex-wrap w-full"
              }
            >
              {participants.map((participant) => {
                const participantVote = snap.votes.find(
                  (vote) => vote.votedBy.id === participant.id,
                );

                const canShowVote = snap.revealCards;

                return (
                  <motion.div
                    layoutId={participant.id}
                    key={participant.id}
                    className="flex flex-col items-center gap-2 will-change-transform"
                    exit={{ opacity: 0, scale: 0.5 }}
                    initial={{ opacity: 0, scale: 0.5 }}
                    animate={{ opacity: 1, scale: 1 }}
                  >
                    <div className={"p-4 rounded-lg"}>
                      {participantVote?.vote ? (
                        <CardFlip
                          value={participantVote?.vote}
                          canShowVote={canShowVote}
                        />
                      ) : (
                        <div className=" w-[75px] bg-secondary/20 h-[100px] border border-border border-dashed  rounded-[8px] " />
                      )}
                    </div>

                    <p>{participant.name}</p>
                  </motion.div>
                );
              })}
            </div>
          </LayoutGroup>
        </AnimatePresence>
      </div>

      {snap.revealCards && (
        <div className="absolute flex gap-6 transform -translate-x-1/2 bottom-6 left-1/2">
          {Object.entries(groupedVotes).map(([vote, count]) => {
            const percentage = (count / Object.keys(groupedVotes).length) * 100;

            return (
              <div key={vote} className="flex flex-col items-center gap-2">
                <div className="flex items-end w-3 h-20 rounded-lg bg-secondary">
                  <motion.div
                    initial={{ height: 0 }}
                    animate={{ height: `${percentage}%` }}
                    className="w-3 h-20 rounded-lg bg-primary max-h-[80px]"
                    transition={{ duration: 0.5 }}
                  >
                    <span className="sr-only">Meter</span>
                  </motion.div>
                </div>
                <div className="px-4 border border-border rounded-sm py-4 text-[18px] font-bold text-primary">
                  {vote}
                </div>
                <span>
                  {count} {count === 1 ? "voto" : "votos"}
                </span>
              </div>
            );
          })}

          <div className="flex flex-col items-center gap-2">
            <p>Média:</p>
            <span>{averageStoryPoints}</span>
          </div>
        </div>
      )}
    </div>
  );
};
