
import { Avatar } from "@/components/ui/avatar"; // Certifique-se de ter um componente Avatar
import { useSnapshot } from "valtio";
import { participantsState } from "@/store.ts";
import type { FC } from "react";

export const ParticipantsList: FC = () => {
    const participantsSnap = useSnapshot(participantsState);

  return (
    <div className="flex flex-col items-start p-4">
      {participantsSnap.map((participant) => (
        <div key={participant.id} className="flex items-center gap-2 mb-2">
          <Avatar name={participant.name} />
          <span>{participant.name}</span>
        </div>
      ))}
    </div>
  );
};