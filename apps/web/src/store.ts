import { proxy } from "valtio";
import { devtools } from "valtio/utils";

export type Issue = {
  id: string;
  storyPoints?: number;
  createdAt: number;
  createdBy: string;
  title: string;
};

type Vote = {
  votedBy: User;
  vote: number | string;
};

export type VotingHistory = {
  id?: string;
  votes: Vote[];
  issueTitle?: string;
  issueId?: string;
  agreement: number; // average of votes
  duration?: number; // start - end time in ms
};

export type User = {
  id: string;
  name: string;
};

export const participantsState = proxy<User[]>([]);
export const issuesState = proxy<Issue[]>([]);
export const encryptedSymmetricKeysState = proxy<Record<string, string>>({});

export type GameState = {
  votes: Vote[];
  currentVotingIssue?: Issue;
  revealCards: boolean;
  votingSystem?: string;
  name?: string;
  counterStartedAt?: number;
  counterEndsAt?: number;
  currentCount?: number;
  createdBy?: string;
  publicKeys: Record<string, string>;
  hasDecryptedSymmetricKey: Record<string, boolean>;
  votingHistory: VotingHistory[];
  globalSequentialId: number;
  currentIndex: number;
};

type LocalGameState = {
  issuesOpen: boolean;
  decryptedIssues: Issue[];
};

export const state = proxy<GameState>({
  votes: [],
  revealCards: false,
  publicKeys: {},
  hasDecryptedSymmetricKey: {},
  votingHistory: [],
  globalSequentialId: 1,
  currentIndex: 0,
});

export const localState = proxy<LocalGameState>({
  decryptedIssues: [],
  issuesOpen: true,
});

devtools(state, {
  name: "state",
  enabled: process.env.NODE_ENV === "development",
});
