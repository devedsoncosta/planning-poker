import { Avatar } from "@/components/ui/avatar";
import { useSnapshot } from "valtio";
import { participantsState, state } from "@/store";
import { getSession } from "@/lib/session"; // Certifique-se de importar getSession
import type { FC } from "react";

export const ParticipantsList: FC = () => {
    const participantsSnap = useSnapshot(participantsState);
    const stateSnap = useSnapshot(state);
    const userId = getSession();

    // Ordena os participantes colocando o usuário conectado em primeiro
    const sortedParticipants = [...participantsSnap].sort((a, b) => {
        if (a.id === userId) return -1;
        if (b.id === userId) return 1;
        return 0;
    });

    return (
        <div className="flex flex-col items-start p-4">
            {sortedParticipants.map((participant) => (
                <div
                    key={participant.id}
                    className={`flex items-center gap-2 mb-2 ${participant.id === userId ? 'text-green-600' : ''}`}
                >
                    <Avatar name={participant.name} />
                    <span>{participant.name}</span>
                    {participant.id === userId && <span>(Você)</span>}
                    {stateSnap.createdBy === participant.id ? (
                        <span>👑</span>
                    ) : (
                        stateSnap.createdBy === userId && (
                            <button>Remover</button>
                        )
                    )}
                </div>
            ))}
        </div>
    );
};