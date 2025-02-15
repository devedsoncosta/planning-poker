import { Button } from "@/components/ui/button.tsx";

import { useToast } from "@/components/ui/use-toast.ts";
import { useClipboard } from "@mantine/hooks";

export const CopyToClipboard = ({ url }: { url: string }) => {
  const { copy } = useClipboard();
  const { toast, toasts } = useToast();

  return (
    <Button
      variant={"primary"}
      onClick={() => {
        copy(url);

        if (
          toasts.some(
            (toast) =>
              toast.title === "URL do jogo copiada para a área de transferência" && toast.open,
          )
        )
          return;

        toast({
          title: "URL do jogo copiada para a área de transferência",
        });
      }}
    >
      Convidar
    </Button>
  );
};
