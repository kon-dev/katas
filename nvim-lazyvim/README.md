# LazyVim-Kata (Fortsetzung des Nvim-Basics-Kata)

Setzt voraus, dass die Grundbewegungen aus `../Nvim/README.md` sitzen
(hjkl, i/a/o, dd/yy/p, Suche, Visual Mode). Hier geht es nicht mehr um
reine Text-Bewegung, sondern um die Plugin-Workflows, die LazyVim
obendrauf packt: Dateien finden, Projekt durchsuchen, Code-Intelligenz
(LSP), Kommentare, Plugin-Verwaltung.

Alle Tastenkombinationen unten wurden direkt aus deiner echten LazyVim-
Installation ausgelesen (Stand: heute) — keine generischen Tutorial-
Kombos, die bei dir vielleicht anders liegen.

**Leader-Taste bei dir: `Space`** (die Leertaste). Wenn im Folgenden
`<leader>` steht, ist damit die Leertaste gemeint.

---

## Level 0: Which-Key — dein eingebauter Spickzettel

Bevor du irgendwas auswendig lernst: drücke `Space` und **warte** kurz
(nicht sofort weitertippen). Es öffnet sich ein Menü, das dir alle
möglichen nächsten Tasten zeigt, gruppiert nach Kategorie (`f` = file/find,
`s` = search, `g` = git, `c` = code, `x` = diagnostics/quickfix, `u` = ui).

**Übung:** Drücke `Space` in einer beliebigen Datei, schau dir das Menü
an, drücke dann `f` — es öffnet sich ein Untermenü nur mit
file/find-Befehlen. Drücke `Esc`, um das Menü zu schließen, ohne etwas
auszulösen.

Dieses Which-Key-Fenster ist dein Rettungsanker für den Rest des
Katas — wenn du eine Kombination vergisst, tippe die ersten Zeichen
und schau, was das Menü anbietet.

---

## Level 1: Dateien finden & wechseln

| Taste | Wirkung |
|---|---|
| `<leader><space>` oder `<leader>ff` | Dateien im Projekt fuzzy suchen (Find Files) |
| `<leader>fr` | zuletzt geöffnete Dateien (Recent) |
| `<leader>fb` oder `<leader>,` | zwischen offenen Buffern wechseln |
| `H` | vorheriger Buffer |
| `L` | nächster Buffer |
| `<leader>e` | Datei-Explorer (Baumansicht) ein-/ausschalten |

**Übung:**
1. Öffne ein beliebiges Verzeichnis mit `nvim .` im Terminal.
2. `<leader>e` — Explorer öffnen, mit `j`/`k` navigieren, mit `Enter`
   eine Datei öffnen.
3. `<leader><space>` — tippe ein paar Buchstaben eines Dateinamens,
   `Enter` zum Öffnen.
4. Öffne so 2–3 Dateien, wechsle dann nur mit `H`/`L` zwischen ihnen.

---

## Level 2: Im Projekt suchen (nicht nur in einer Datei)

| Taste | Wirkung |
|---|---|
| `<leader>/` oder `<leader>sg` | Volltextsuche über alle Dateien im Projekt (Live Grep) |
| `<leader>sw` | Wort unter dem Cursor im ganzen Projekt suchen |

Das ist der große Unterschied zu `/suchbegriff` aus dem Basics-Kata:
`/` sucht nur **in der aktuellen Datei**, `<leader>/` durchsucht **alle
Dateien im Projekt gleichzeitig**.

**Übung:** Nutze `<leader>/`, tippe `TODO` und Enter — springe durch
die Treffer im Ergebnis-Fenster (Pfeiltasten oder `Ctrl-j`/`Ctrl-k`,
je nach Anzeige), öffne einen Treffer mit `Enter`.

---

## Level 3: Code-Intelligenz (LSP) — braucht eine echte Code-Datei!

Diese Kombinationen funktionieren **nur**, wenn Nvim für die geöffnete
Datei einen Language Server gestartet hat (also z.B. eine `.py`-Datei,
nicht eine leere oder reine `.txt`-Datei). Nutze dafür die Datei
`playground.py` in diesem Ordner — dafür ist bei dir bereits `pyright`
über Mason installiert.

| Taste | Wirkung |
|---|---|
| `gd` | Springe zur Definition des Symbols unter dem Cursor |
| `gr` | Zeige alle Referenzen/Verwendungen |
| `K` | Dokumentation/Typ-Info einblenden (Hover) |
| `<leader>ca` | Code Action (z.B. Auto-Fix, Import hinzufügen) |
| `<leader>cr` | Symbol umbenennen (überall im Projekt) |
| `<leader>cf` | Datei automatisch formatieren |
| `]d` / `[d` | zum nächsten/vorherigen Diagnostic (Fehler/Warnung) springen |

**Übung (`playground.py`):**
1. Öffne `nvim playground.py`.
2. Gehe mit dem Cursor auf den Funktionsnamen `berechne_summe` an einer
   Aufrufstelle, drücke `gd` — springt zur Definition.
3. Drücke `gr` auf demselben Namen — zeigt dir, wo überall die Funktion
   benutzt wird.
4. Gehe auf den Parameter `zahlen` und drücke `K` — zeigt Typ-Infos.
5. Benenne die Funktion mit `<leader>cr` um (z.B. in `summe_berechnen`)
   — beobachte, dass sich **alle** Aufrufstellen mit ändern.
6. Mach absichtlich einen Tippfehler in einer Zeile, speichere (`:w`),
   und springe mit `]d` zur roten Unterschlängelung.

---

## Level 4: Kommentare & schnelles Springen

| Taste | Wirkung |
|---|---|
| `gcc` | aktuelle Zeile aus-/einkommentieren |
| `gc` + Bewegung | Kommentar über eine Bewegung (z.B. `gcj` kommentiert 2 Zeilen) |
| im Visual Mode: `gc` | markierten Block kommentieren |
| `s` + 2 Zeichen | Flash: springe sofort zu jeder sichtbaren Stelle im Fenster |

`s` (Flash) ist besonders am Anfang ungewohnt, aber extrem schnell:
du drückst `s`, tippst zwei Zeichen, die irgendwo sichtbar auf dem
Bildschirm stehen, und Nvim markiert alle Fundstellen mit Buchstaben —
den passenden Buchstaben drücken, und der Cursor springt direkt hin.

**Übung (`playground.py`):**
1. Kommentiere eine ganze Zeile mit `gcc`, dann wieder rückgängig
   (`gcc` erneut, oder `u`).
2. Markiere 3 Zeilen im Visual Mode (`V` `j` `j`) und kommentiere sie
   alle zusammen mit `gc`.
3. Nutze `s` plus zwei Buchstaben, um irgendwo im sichtbaren Text zu
   springen, ohne `hjkl` zu benutzen.

---

## Level 5: Plugins & Werkzeuge verwalten

| Befehl | Wirkung |
|---|---|
| `<leader>l` | öffnet Lazy (Plugin-Manager) — Updates, Plugin-Status |
| `<leader>cm` | öffnet Mason (LSP-/Tool-Installer) |
| `:checkhealth` | prüft, ob alles korrekt konfiguriert ist |

**Übung:** Öffne `<leader>l`, schau dir die Liste an (nichts updaten
müssen), verlasse mit `q`. Öffne danach `<leader>cm` und schau, welche
Sprachserver installiert sind. Verlasse ebenfalls mit `q`.

---

## Level 6: Kombi-Übung

In `playground.py` gibt es eine Funktion `verarbeite_daten`, die einen
Bug enthält (division durch eine Variable, die 0 sein kann).

Aufgabe, nur mit den Tasten aus diesem Kata:
1. Finde die Datei mit `<leader>ff` (falls noch nicht offen).
2. Finde die Funktion `verarbeite_daten` mit `<leader>/` (Projekt-Suche).
3. Springe mit `gd` von einer Aufrufstelle zur Definition.
4. Lies dir mit `K` die Docstring-Info an, falls vorhanden.
5. Behebe den Bug (eigene Idee, z.B. Prüfung auf 0 einbauen).
6. Formatiere die Datei mit `<leader>cf`.
7. Kommentiere eine Testzeile mit `gcc` aus, statt sie zu löschen.

---

## Hinweis zur Wiederholung

Wie beim Basics-Kata: einmal durcharbeiten reicht nicht. Besonders
Level 1–3 (Dateien finden, Projekt-Suche, LSP-Sprünge) lohnen sich,
bis sie automatisch sitzen — das ist der Teil, der im Alltag am
meisten Zeit spart.
