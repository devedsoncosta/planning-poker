import React, { Suspense } from "react";
import { createBrowserRouter } from "react-router-dom";

// Usando importação dinâmica com exportação nomeada
const App = React.lazy(() => import("./App").then(module => ({ default: module.Component })));
const Game = React.lazy(() => import("./features/game/game").then(module => ({ default: module.Component })));
const HistoryTable = React.lazy(() => import("./features/history-table").then(module => ({ default: module.Component })));
const CreateGameForm = React.lazy(() => import("./features/create-game-form").then(module => ({ default: module.Component })));

export const router = createBrowserRouter([
  {
    path: "/",
    element: (
      <Suspense fallback={<div>Loading...</div>}>
        <App />
      </Suspense>
    ),
  },
  {
    path: "/:id",
    element: (
      <Suspense fallback={<div>Loading...</div>}>
        <Game />
      </Suspense>
    ),
  },
  {
    path: "/:id/history",
    element: (
      <Suspense fallback={<div>Loading...</div>}>
        <HistoryTable />
      </Suspense>
    ),
  },
  {
    path: "/new-game",
    element: (
      <Suspense fallback={<div>Loading...</div>}>
        <CreateGameForm />
      </Suspense>
    ),
  },
]);
