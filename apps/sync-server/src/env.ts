import { z } from "zod";

const envSchema = z.object({
  PORT: z.coerce.number().positive().int().default(8080),
  DATABASE_PATH: z.string().default("db.sqlite"),
  CLIENT_ORIGIN: z.string().url().default("http://localhost:5173"),
  NODE_ENV: z
    .enum(["test", "development", "production"])
    .default("development"),
  DISCORD_WEBHOOK_URL: z.string().url().optional(),
});

export const env = envSchema.parse(process.env);
