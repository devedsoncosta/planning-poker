import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuGroup,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { clearSession } from "@/lib/session";
import { useMediaQuery } from "@mantine/hooks";
import * as React from "react";
import { useNavigate } from "react-router-dom";
import { GameSettingsModal } from "../features/game/game-settings-modal";
import { Button } from "./ui/button";
import { Dialog, DialogTrigger } from "./ui/dialog";
import { Drawer, DrawerTrigger } from "./ui/drawer";

export function PreferencesDropdownMenu({
  children,
  roomId,
}: {
  children: React.ReactNode;
  roomId?: string;
}) {
  const [open, setOpen] = React.useState(false);
  const navigation = useNavigate();
  const [settingOpen, setSettingsOpen] = React.useState(false);
  const isDesktop = useMediaQuery("(min-width: 768px)");
  const dropDownRef = React.useRef<HTMLButtonElement>(null);

  const closeModal = () => {
    setSettingsOpen(false);
    dropDownRef.current?.focus();
  };

  const Wrapper = isDesktop ? Dialog : Drawer;
  const Trigger = isDesktop ? DialogTrigger : DrawerTrigger;

  return (
    <Wrapper
      open={settingOpen}
      onOpenChange={(value) => {
        setSettingsOpen(value);
      }}
    >
      <DropdownMenu open={open} onOpenChange={setOpen}>
        <DropdownMenuTrigger asChild ref={dropDownRef} id={"game-settings"}>
          <Button variant={"secondary"}>{children}</Button>
        </DropdownMenuTrigger>
        <DropdownMenuContent
          align="start"
          className="w-[200px]"
          sideOffset={10}
        >
          <DropdownMenuGroup>
            <DropdownMenuItem asChild>
              <Trigger>
                <span>Configurações do jogo</span>
              </Trigger>
            </DropdownMenuItem>

            {roomId ? (
              <DropdownMenuItem
                onClick={() => {
                  navigation(`/${roomId}/history`);
                }}
              >
                <span>Histórico de votação</span>
              </DropdownMenuItem>
            ) : null}

            <DropdownMenuSeparator />

            <DropdownMenuItem
              onClick={() => {
                clearSession();

                // Can't use react-router-dom's navigate here because it doesn't
                // trigger a full page reload. State is not cleared properly.
                window.location.replace("/");
              }}
            >
              <span>Logout</span>
            </DropdownMenuItem>
          </DropdownMenuGroup>
        </DropdownMenuContent>
      </DropdownMenu>
      <GameSettingsModal closeModal={closeModal} />
    </Wrapper>
  );
}
