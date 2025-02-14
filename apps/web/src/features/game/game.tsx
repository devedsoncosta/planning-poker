import { useSnapshot } from "valtio";
import { participantsState } from "@/store.ts";
import type { FC } from "react";
import { useParams } from "react-router-dom";
import { CopyToClipboard } from "@/components/copy-to-clipboard";
import { Button } from "@/components/ui/button";
import { ShortcutsInfo } from "@/components/ui/shortcuts-info";
import { Toaster } from "@/components/ui/toaster";
import { Issues } from "@/features/game/Issues";
import { CreateUserForm } from "@/features/game/create-user-form";
import { Deck } from "@/features/game/deck";
import { RevealCards } from "@/features/game/reveal-cards";
import { VoteAgain } from "@/features/game/vote-again.tsx";
import { VoteNext } from "@/features/game/vote-next.tsx";
import { VotingResult } from "@/features/game/voting-result.tsx";
import { HocusPocusProvider } from "@/hooks/useHocuspocus.tsx";
import { RealtimeProvider, useDocuments } from "@/hooks/useRealtime.tsx";
import { getGuestName, getSession } from "@/lib/session";
import { localState, state } from "@/store.ts";
import { ydoc } from "@/yjsDoc.ts";
import { useDocumentTitle } from "@mantine/hooks";
import { motion } from "framer-motion";
import { QRCodeSVG } from "qrcode.react";
import { HeaderLeft } from "../../components/header-left";
import { ParticipantsList } from "./participant-list";

const Game: FC<{ roomId: string }> = ({ roomId }) => {
  const snap = useSnapshot(state);
  const { participants } = useDocuments();
  const { decryptedIssues } = useSnapshot(localState);
  const participantsSnap = useSnapshot(participantsState);

  const userId = getSession();
  const currentEncryptedVotingIssue = snap.currentVotingIssue;
  const decryptedIssueTitle = decryptedIssues.find(
    (decryptedIssue) => decryptedIssue.id === currentEncryptedVotingIssue?.id,
  )?.title;
  const title =
    currentEncryptedVotingIssue && decryptedIssueTitle
      ? `Votando em ${decryptedIssueTitle}`
      : "Planning Poker";

  useDocumentTitle(title);

  if (
    !ydoc.get(`game-state-${roomId}`) ||
    !ydoc.get(`participants-state-${roomId}`) ||
    !participants.toArray().length
  ) {
    // needs sync
    return <div />;
  }

  let isInParticipants = participantsSnap.some(
    (participant) => participant.id === userId,
  );

  const guestName = getGuestName();
  if (userId && guestName && !isInParticipants && snap.publicKeys[userId]) {
    participants.push([{ id: userId, name: guestName }]);
    isInParticipants = true;
  }

  if (!isInParticipants) {
    return (
      <div>
        <nav className="flex items-center justify-between gap-4 px-4 py-2 border-b bg-background border-border h-[56px]">
          <HeaderLeft isAuthenticated={false} />
        </nav>

        <CreateUserForm roomId={roomId} />
      </div>
    );
  }

  const url = `${window.location.origin}/${roomId}`;

  return (
    <div className="flex flex-col min-h-[100dvh]">
      <nav className="flex items-center justify-between gap-4 px-4 py-2 border-b bg-background border-border h-[56px]">
        <HeaderLeft isAuthenticated roomId={roomId} />

        <div className="flex items-center gap-2">
          <CopyToClipboard url={url} />
          <Issues />
        </div>
      </nav>

      <div className="flex flex-1">
        <ParticipantsList />

        <div className="min-h-full flex-1">
          <div className="relative flex flex-col h-full gap-2 p-4 mx-4 mb-4 overflow-hidden rounded-lg border-border">
            <VotingResult />

            <div className="absolute transform -translate-x-1/2 bottom-6 left-1/2">
              <Deck />
            </div>

            <motion.div
              className="absolute flex gap-2 right-3 top-6"
              initial={{
                y: snap.revealCards || snap.votes.length === 0 ? -100 : 0,
              }}
              animate={{
                y: snap.revealCards || snap.votes.length === 0 ? -100 : 0,
              }}
            >
              <RevealCards />
            </motion.div>

            <motion.div
              className="absolute flex gap-2 right-3 top-6"
              initial={{ y: snap.revealCards ? 0 : -100 }}
              animate={{
                y: snap.revealCards ? 0 : -100,
              }}
            >
              <VoteNext />
            </motion.div>

            <motion.div
              className="absolute flex gap-2 top-6"
              initial={{ y: snap.revealCards ? 0 : -100 }}
              animate={{
                y: snap.revealCards ? 0 : -100,
              }}
            >
              <VoteAgain />
            </motion.div>
          </div>
        </div>

        <ShortcutsInfo>
          <Button
            variant="outline"
            className="absolute rounded-full left-4 bottom-6"
          >
            <span className="sr-only">Perguntas</span>?
          </Button>
        </ShortcutsInfo>

        <div className="hidden flex-col items-center gap-4 xl:flex flex-auto max-w-[372px] w-full duration-150 ease-in-out mt-20 min-w-[350px]">
          <QRCodeSVG
            value={url}
            className="hidden md:block mx-auto  w-[200px] h-[200px] qr-code"
          />
        </div>
      </div>
    </div>
  );
};

export const Component = () => {
  const { id: roomId } = useParams();

  if (!roomId) {
    return <div>O ID da sala é obrigatório</div>;
  }

  return (
    <HocusPocusProvider roomId={roomId} ydoc={ydoc}>
      <RealtimeProvider>
        <Game roomId={roomId} />
      </RealtimeProvider>
      <Toaster />
    </HocusPocusProvider>
  );
};
Component.displayName = "Game";