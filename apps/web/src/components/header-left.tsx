import { LogoSvg } from "@/components/logo-svg";
import { NetworkStatus } from "@/components/ui/network-status.tsx";
import { TextAnimatedGradient } from "@/components/ui/text-animated.tsx";
import { state } from "@/store.ts";
import { useSnapshot } from "valtio";
import { PreferencesDropdownMenu } from "./preferences-dropdown";
import { useNavigate } from "react-router-dom";
import { Settings2 } from "lucide-react";

export const HeaderLeft = ({
  roomId,
  isAuthenticated,
}: { roomId?: string; isAuthenticated?: boolean } = {}) => {
  const { name } = useSnapshot(state);
  const navigate = useNavigate();

  const handleLogoClick = () => {
    navigate("/");
  };

  return (
    <div className="flex items-center gap-8 w-fit">
      <div className="relative flex items-center text-primary">
        <a onClick={handleLogoClick}>
          <LogoSvg />
        </a>
        <NetworkStatus />
      </div>

      {name && isAuthenticated ? (
            <div className="flex gap-8">
            <TextAnimatedGradient>{name}</TextAnimatedGradient>
            <PreferencesDropdownMenu roomId={roomId}>
              <Settings2 size={16} strokeWidth={1.5} />
            </PreferencesDropdownMenu>
            </div>
      ) : name ? (
        <TextAnimatedGradient>{name}</TextAnimatedGradient>
      ) : null}
    </div>
  );
};
