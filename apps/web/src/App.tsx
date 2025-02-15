import { useNavigate } from "react-router-dom";
import { HeaderLeft } from "@/components/header-left.tsx";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export const Component = () => {
  const navigate = useNavigate();
  const createRoom = () => navigate("/new-game");

  return (
    <div className="min-h-screen">
      <nav className="flex items-center justify-between gap-4 px-4 py-2 border-b h-[56px]">
        <HeaderLeft isAuthenticated={false} />
      </nav>

      <div className="flex flex-col items-center justify-center min-h-[calc(100vh-56px)] px-4">
        <Card className="w-full max-w-md">
          <CardHeader>
            <CardTitle>Bem-vindo ao Planning Poker</CardTitle>
          </CardHeader>
          <CardContent className="flex flex-col gap-4">
            <p className="text-center text-gray-600">
              Clique no botão abaixo para começar um novo jogo.
            </p>
            <Button onClick={createRoom} className="w-full">
              Começar
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  );
};
Component.displayName = "App";
