import { HeaderLeft } from "@/components/header-left.tsx";
import { Button } from "@/components/ui/button.tsx";
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import useExportToCsv from "@/hooks/useExportToCSV.ts";
import { HocusPocusProvider } from "@/hooks/useHocuspocus.tsx";
import { RealtimeProvider } from "@/hooks/useRealtime.tsx";
import { type VotingHistory, localState, state } from "@/store.ts";
import { ydoc } from "@/yjsDoc.ts";
import type { FC } from "react";
import { useParams } from "react-router-dom";
import { useSnapshot } from "valtio";
import { useNavigate } from "react-router-dom";

/* prepare data to be exported, join the votes into a string */
const prepareData = (data: VotingHistory[]) => {
  return data.map((row) => {
    return {
      Id: row.id,
      "Título da tarefa": row.issueTitle,
      "Votado por": row.votes.map((vote) => vote.votedBy.name).join(", "),
      Voto: row.votes.map((vote) => vote.vote).join(", "),
      Acordo: row.agreement,
    };
  });
};

const DataTable = () => {
  const { votingHistory } = useSnapshot(state);
  const { decryptedIssues } = useSnapshot(localState);

  const currentVotingHistory = votingHistory.map((row) => {
    const issue = decryptedIssues.find(
      (decryptedIssue) => decryptedIssue.id === row.issueId,
    );
    return {
      ...row,
      issueTitle: issue?.title,
    };
  });

  const exportToCsv = useExportToCsv(
    `${new Date().toLocaleDateString()}_historico_de_votacao.csv`,
  );

  return (
    <>
      <Button
        className={"w-fit self-end"}
        // @ts-expect-error mismatch of types, readonly needs fixing
        onClick={() => exportToCsv(prepareData(currentVotingHistory))}
      >
        Exportar para CSV
      </Button>
      <Table>
        <TableCaption>Uma lista dos seus votos recentes.</TableCaption>
        <TableHeader>
          <TableRow>
            <TableHead className="w-[100px]">ID</TableHead>
            <TableHead className="">Título da tarefa</TableHead>
            <TableHead className="text-right">Votado por</TableHead>
            <TableHead className="text-right">Voto</TableHead>
            <TableHead className="text-right">Acordo</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {currentVotingHistory.map((row) => (
            <TableRow key={row.id}>
              <TableCell className="font-medium">{row.id}</TableCell>
              <TableCell>{row.issueTitle}</TableCell>
              <TableCell className="text-right">
                {row.votes.map((vote) => vote.votedBy.name).join(", ")}
              </TableCell>
              <TableCell className="text-right">
                {row.votes.map((vote) => vote.vote).join(", ")}
              </TableCell>
              <TableCell className="text-right">{row.agreement}</TableCell>
            </TableRow>
          ))}
        </TableBody>
        <TableFooter>
          <TableRow>
            <TableCell colSpan={2}>Total</TableCell>
            <TableCell className="text-right">
              {currentVotingHistory.length} rodadas
            </TableCell>
            <TableCell className="text-right">
              {currentVotingHistory.reduce(
                (acc, row) => acc + row.agreement,
                0,
              )}{" "}
              pontos
            </TableCell>
            <TableCell />
          </TableRow>
        </TableFooter>
      </Table>
    </>
  );
};

const HistoryTable: FC<{ roomId: string }> = ({ roomId }) => {
  const navigate = useNavigate();
  if (!ydoc.getMap(`game-state-${roomId}`)) {
    // needs sync
    return <div />;
  }

  return (
    <div className="flex flex-col min-h-[100dvh]">
      <nav className="flex items-center justify-between gap-4 px-4 py-2 border-b bg-background border-border h-[56px]">
        <HeaderLeft roomId={roomId} isAuthenticated />
        <Button onClick={() => navigate(`/${roomId}`)}>Voltar para Sala de Jogo</Button>
      </nav>
      <div
        className={
          "max-w-[1200px] w-full mt-10 px-4 flex flex-col gap-4 my-0 mx-auto"
        }
      >
        <DataTable />
      </div>
    </div>
  );
};

export const Component = () => {
  const roomId = useParams().id;

  if (!roomId) {
    return <div>O ID da sala é obrigatório</div>;
  }

  return (
    <HocusPocusProvider roomId={roomId} ydoc={ydoc}>
      <RealtimeProvider>
        <HistoryTable roomId={roomId} />
      </RealtimeProvider>
    </HocusPocusProvider>
  );
};
Component.displayName = "HistoryTable";
