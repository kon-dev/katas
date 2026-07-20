---
name: new-kata
description: Scaffold a new practice kata in this repo (folder, leveled README, optional sandbox setup.sh) and wire it into the top-level index. Use when Stefan asks to create/add a new kata (e.g. "erstell ein kata für X").
---

Scaffold a new kata in this repo, matching the style of the existing
ones (`nvim-basics/`, `nvim-lazyvim/`, `git-basics/`, `fish-basics/`).
See `../../CLAUDE.md` (repo root) for the full format spec — read it
before generating content if it exists.

## Steps

1. **Derive the slug.** Take the topic from the user's request (e.g.
   "docker", "regex", "tmux") and turn it into a kebab-case folder
   name, usually `<topic>-basics` unless a different suffix reads
   better (matches the existing `nvim-lazyvim` precedent for a
   non-basics follow-up kata).

2. **Ground it in reality before writing anything.** Don't write from
   generic tutorial memory. Check what's actually true on this
   machine/account first — installed version, config file locations,
   real command output — the same way the existing katas were built
   (e.g. nvim-lazyvim was grounded in the real LazyVim plugin source
   and a live headless-Nvim keymap dump; fish-basics was grounded in
   the real fish version and `conf.d` contents; git-basics used a
   throwaway local sandbox instead of assuming git behavior). If the
   topic doesn't relate to anything installed locally, generic
   correctness still needs verifying (test commands actually work
   before writing them into the README).

3. **Create `<repo-root>/<slug>/README.md`** with this shape:
   - Title + 2-3 sentence intro (what it's for, prerequisite katas if
     any, that it's meant to be repeated not just done once).
   - Level 0: environment setup if needed (sandbox script, or how to
     get into a safe practice state). Skip if the topic needs no setup.
   - Levels 1-N: each a level heading, a compact reference table of
     commands/concepts, then a concrete **Übung** (exercise) using
     those commands on real material (a playground file, a sandbox,
     or the user's real environment if read-only/safe).
   - Difficulty should increase level to level; each level should
     build on tools introduced in earlier levels.
   - Final level: a combined exercise using multiple levels' tools
     together, ideally with a hidden/collapsible solution
     (`<details><summary>...</summary>...</details>`).
   - Closing "Wiederholen" section: how to reset/redo the kata.
   - Write in German, matching the existing katas' tone: direct,
     beginner-friendly, no filler.

4. **Add a sandbox if the topic needs one to practice safely/
   destructively** (like `git-basics/setup.sh` building a throwaway
   local repo, or `fish-basics/setup.sh` building a playground
   directory). Skip if exercises can run directly and safely (like
   `nvim-basics/playground.txt`, which needs no script). Test the
   setup script actually runs cleanly before shipping it.

5. **Test every command you put in the README** by actually running
   it, the same way previous katas were verified — don't ship
   instructions that weren't checked.

6. **Update the root `README.md`** — add a bullet under `## Verfügbar`
   linking `<slug>/README.md` with a one-line description, in the
   same list style as the existing entries.

7. **Commit and push** (`git add -A && git commit -m "..." && git
   push`) — no need to ask first, this repo's workflow already treats
   that as routine.

8. Report back briefly: what levels the kata covers, and the path to
   start it.
