# Katas — conventions

Public repo of repeatable, leveled practice exercises ("katas") for
dev tools Stefan is learning. This file documents the format so new
katas stay consistent without re-deriving it each time. See also the
`new-kata` skill (`.claude/skills/new-kata/`), which scaffolds new
katas following exactly this spec.

## Repo layout

- `README.md` (root) — index, links every kata with a one-line
  description. Update it whenever a kata is added.
- `LICENSE` — MIT.
- `<topic>-basics/` (or `<topic>-<followup>/` for a kata that
  continues a more basic one, e.g. `nvim-lazyvim` follows
  `nvim-basics`) — one folder per kata.

## Kata folder shape

- `README.md` — the kata itself (see format below). Required.
- `setup.sh` (optional) — builds a throwaway practice sandbox, only
  when the topic needs one to practice safely/destructively (git,
  fish globbing). Must be re-runnable any number of times, resetting
  state each run. Skip entirely if exercises can run directly and
  safely without one (nvim-basics needs no script, just a static
  `playground.txt`).
- Static playground files (`playground.txt`, `playground.py`, ...)
  when exercises operate on fixed example content rather than a full
  sandbox.

## README format (per kata)

1. Title + short intro: what it's for, prerequisite kata if any, and
   that it's meant to be repeated, not done once.
2. Level 0 — environment/sandbox setup, if needed. Skipped when not
   needed.
3. Levels 1..N — each level:
   - a compact reference table of commands/concepts,
   - a concrete **Übung** exercising them on real material.
   Difficulty increases level to level; later levels build on earlier
   ones' tools.
4. Final level — a combined exercise spanning multiple levels, ideally
   with a collapsible solution (`<details><summary>...</summary>`).
5. Closing "Wiederholen" section — how to reset and redo the kata.

Written in German, direct and beginner-friendly (Stefan is a beginner
in the topics covered so far — Nvim, Git, shell). No filler prose.

## The one non-negotiable rule: ground it in reality

Every command in a kata README must have actually been run and
verified, not written from generic tutorial memory. Where the kata
covers software Stefan has installed, check his real installed
version/config before writing anything specific to it — versions and
defaults drift (e.g. nvim-lazyvim was grounded in his actual LazyVim
plugin source + a live headless-Nvim keymap dump, because his setup
uses snacks.nvim, not the "default" Telescope most tutorials assume).
Don't ship instructions that weren't checked.

## Workflow

Routine changes (new katas, edits, README index updates) get
committed and pushed directly — no need to ask first, per Stefan's
standing preference for this repo. Only pause and ask if a change is
genuinely ambiguous or hard to reverse (not the case for normal kata
additions/edits).
