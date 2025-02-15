import { Button } from "@/components/ui/button";
import useExportToCsv from "@/hooks/useExportToCSV";
import { type VotingHistory } from "@/store";

interface ExportButtonProps {
  data: VotingHistory[];
  decryptedIssues: { id: string; title: string }[];
}

const prepareData = (data: VotingHistory[], decryptedIssues: { id: string; title: string }[]) => {
  return data.map((row) => {
    const issue = decryptedIssues.find((decryptedIssue) => decryptedIssue.id === row.issueId);
    return {
      Id: row.id,
      "Título da tarefa": issue?.title || "Título não disponível",
      "Votado por": row.votes.map((vote) => vote.votedBy.name).join(", "),
      Voto: row.votes.map((vote) => vote.vote).join(", "),
      Acordo: row.agreement,
    };
  });
};

const ExportButton: React.FC<ExportButtonProps> = ({ data, decryptedIssues }) => {
  const exportToCsv = useExportToCsv(`${new Date().toLocaleDateString()}_historico_de_votacao.csv`);

  return (
    <Button
      className={"w-fit self-end"}
      onClick={() => exportToCsv(prepareData(data, decryptedIssues))}
    >
      Exportar para CSV
    </Button>
  );
};

export default ExportButton;