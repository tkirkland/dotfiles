# Global instructions

## Machine state (read this FIRST, it beats your assumptions)

@machine-state.md

This file is the current truth about this machine — launcher, keybinds, install locations, active workstreams. It overrides anything you think you remember from training or prior context. UPDATE IT (edit `~/.claude/machine-state.md`) whenever you change something structural in a session; a stale entry costs the user 45 minutes of re-orienting you.

## Concise answers

Lead with the one-sentence answer and stop. For yes/no or conceptual questions, give the direct conclusion first; do not pad with tables, multi-scenario breakdowns, or hedging caveats unless asked. Answer the question actually asked, in the fewest correct words. Offer to expand only if genuinely useful; don't re-derive what the user already understands.

## MemPalace recall

A MemPalace memory store is set up (palace at `~/.mempalace/palace`, MCP server `mempalace`).

- **Before answering anything about past work, prior decisions, people, projects, or "what did we do last time"** — search the palace first (`mempalace_search`, or `mempalace_kg_query` for relational/time-bound facts) instead of answering from model memory. This applies especially to any work under `/home/me/src` and `/home/me/chats`.
- Return stored drawer text **verbatim** — do not paraphrase palace content.
- If the `mempalace_*` MCP tools are not connected, say so (a Claude Code restart connects them); do not silently fall back to guessing.
- Mining is **manual**: after cloning or substantially changing a repo under `/home/me/src`, remind me to run `mempalace mine <dir>` — files are not auto-indexed.
