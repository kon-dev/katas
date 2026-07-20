# Katas

[![License: MIT](https://img.shields.io/github/license/kon-dev/katas?color=blue)](LICENSE)
[![Last commit](https://img.shields.io/github/last-commit/kon-dev/katas)](https://github.com/kon-dev/katas/commits/main)
[![Status](https://img.shields.io/badge/status-work%20in%20progress-yellow)](#verf%C3%BCgbar)

Übungssammlung zum wiederholten Praktizieren von Entwickler-Werkzeugen —
kein einmaliges Tutorial, sondern zum Immer-wieder-Durchspielen, bis die
Handgriffe automatisch sitzen.

## Wie ein Kata funktioniert

Jedes Kata liegt in seinem eigenen Ordner und enthält:
- ein `README.md` mit Levels, die aufeinander aufbauen (leicht → schwerer),
- meist eine Übungsdatei (`playground.*`) zum Ausprobieren und Kaputtmachen.

Der Punkt ist Wiederholung: einmal durchspielen reicht nicht, es geht
darum, ein Kata mehrfach zu durchlaufen, bis die Handgriffe ohne
Nachdenken sitzen.

## Verfügbar

- [`nvim-basics/`](nvim-basics/README.md) — Nvim-Grundlagen: Modi,
  Bewegung, Löschen/Kopieren/Einfügen, Suchen, Visual Mode.
- [`nvim-lazyvim/`](nvim-lazyvim/README.md) — LazyVim-Workflows:
  Dateien finden, Projekt-Suche, LSP (Code-Intelligenz), Kommentare,
  Plugin-Verwaltung. Baut auf `nvim-basics/` auf.
- [`git-basics/`](git-basics/README.md) — Git-Grundzyklus: status,
  add, commit, push/pull, Branches, Rückgängig-Machen, Konflikte.
  Läuft in einer lokalen Sandbox, ganz ohne echtes GitHub-Konto.

Weitere Katas (Git, Shell, Regex, ...) kommen bei Bedarf dazu.

## Lizenz

[MIT](LICENSE)
