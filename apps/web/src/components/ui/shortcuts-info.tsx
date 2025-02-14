import { Kbd } from "@/components/ui/kbd.tsx";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";
import { useHotkeys, useOs } from "@mantine/hooks";
import { CheckCircle } from "lucide-react";
import { useState } from "react";

export function ShortcutsInfo({ children }: { children: React.ReactNode }) {
  const [open, setOpen] = useState(false);

  useHotkeys([["Shift+?", () => setOpen((o) => !o)]]);

  const isMac = useOs() === "macos";

  const os = isMac ? "Cmd" : "Ctrl";

  const features = [
    "Interface intuitiva e responsiva",
    "Suporte a múltiplas salas de planejamento",
    "Cartas personalizadas para diferentes métodos de estimativa",
    "Atualizações em tempo real para maior dinamismo",
    "Backend eficiente para garantir escalabilidade e performance",
  ];

  return (
    <Popover modal={false} open={open} onOpenChange={setOpen}>
      <PopoverTrigger asChild>{children}</PopoverTrigger>
      <PopoverContent
        className="max-w-[95vw]  lg:max-w-[740px] w-full p-6 rounded-xl lg:ml-5"
        sideOffset={10}
        data-label={"help-dialog"}
      >
        <div className="grid gap-4 lg:grid-cols-[1.5fr_1fr] grid-cols-1">
          <div className={"flex gap-4 flex-col"}>
            <h3 className="font-semibold text-md ">Sobre</h3>

            <p className="mb-4">
            A ferramenta de <strong>Planning Poker</strong> desenvolvida por <strong className="text-primary"><a href="https://edsoncosta.online">Edson Costa</a></strong> é uma
            solução moderna e intuitiva para facilitar a estimativa de esforço em times ágeis.
            Construída com <strong>React</strong>, utilizando a biblioteca de componentes <strong>shadcn/ui</strong>,
            e um backend robusto em <strong>Node.js</strong>, a plataforma proporciona uma experiência fluida e colaborativa
            para squads que desejam aprimorar seu processo de planejamento.
          </p>
          <ul className="space-y-2">
            {features.map((feature, index) => (
              <li key={index} className="flex items-center space-x-2">
                <CheckCircle className="text-green-500" size={18} />
                <span>{feature}</span>
              </li>
            ))}
          </ul>
          <p className="mt-4 font-semibold">
            🚀 Agilize seu planejamento e tome decisões mais assertivas!
          </p>
          </div>
          <div>
            <h3 className="mb-2 font-semibold text-md">Atalhos</h3>
            <div className="grid gap-2">
              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>
                  Abrir painel de issues
                </span>
                <Kbd>i</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>
                  Fechar painel de issues
                </span>
                <Kbd>Escape</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>
                  Criar issue / Focar input
                </span>
                <Kbd>c</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>Deletar issue</span>
                <Kbd>{os} + Backspace</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>
                  Deletar todas as issues
                </span>
                <Kbd>{os} + Shift + Backspace</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>Desfazer</span>
                <Kbd>{os} + Z</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>Refazer</span>
                <Kbd>{os} + Shift + Z</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>Próxima tarefa</span>
                <Kbd>n</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>Revelar carta</span>
                <Kbd>r</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>Voltar tarefa</span>
                <Kbd>v</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>Opção de votação</span>
                <Kbd>1,2,3,4,5,6,7,8,9,0</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>
                  Focar próxima issue
                </span>
                <Kbd>J / seta para baixo</Kbd>
              </div>

              <div className="flex items-center justify-between gap-2">
                <span className={"text-sm font-semibold"}>
                  Focar issue anterior
                </span>
                <Kbd>K / seta para cima</Kbd>
              </div>
            </div>
          </div>
        </div>
      </PopoverContent>
    </Popover>
  );
}
