import { env } from "./env";

export const sendMessage = async (payload: string) => {
  if (env.NODE_ENV !== "production" || !env.DISCORD_WEBHOOK_URL) {
    return;
  }

  const response = await fetch(env.DISCORD_WEBHOOK_URL, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ content: payload }),
  });

  if (!response.ok) {
    // Not throwing an error here to avoid breaking the application
    // due to Discord errors
    console.error(`Invalid Discord response ${response}`);
  }
};
