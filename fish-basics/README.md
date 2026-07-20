# Fish-Basics-Kata

Übung für die Fish-Shell (Version 4.6 bei dir) — nicht Bash, auch wenn
vieles ähnlich aussieht. Fish hat an einigen Stellen bewusst andere,
einfachere Syntax. Alle Befehle unten wurden live in einer echten
Fish-Session getestet, nicht nur aus der Doku abgeschrieben.

---

## Level 0: Wo Fish seine Config hernimmt

| Ort | Wann geladen |
|---|---|
| `~/.config/fish/config.fish` | immer beim Start |
| `~/.config/fish/conf.d/*.fish` | immer, alphabetisch, vor `config.fish` |
| `~/.config/fish/functions/*.fish` | **lazy** — erst beim ersten Aufruf der Funktion |

Bei dir liegt der Großteil in `conf.d/99_my_setup.fish` (Aliase,
Abkürzungen, `scale`-Funktion, Starship/Zoxide-Init) und eine eigene
Funktion in `functions/dotgit-sync.fish`.

**Wichtige Besonderheit:** Ein `alias` in Fish ist eigentlich nur
Zucker für eine Funktion — es gibt keine echten "Text-Ersetzungs-Aliase"
wie in Bash. Das kannst du direkt an deinem eigenen `ll`-Alias sehen:

```fish
type ll
```

zeigt dir, dass `ll` intern als vollständige `function ll ... end`
existiert.

**Übung:** Führe `type ll`, `type scale` und `type dotgit-sync` aus und
schau dir die jeweilige Definition an.

---

## Level 1: Variablen

Fish-Variablen sind **immer Listen** (auch mit nur einem Element) und
haben einen **Scope** (Sichtbarkeit): lokal, global oder universal.

| Befehl | Wirkung |
|---|---|
| `set x wert` | Variable setzen |
| `echo $x` | Variable ausgeben |
| `set -x X wert` | **export**: auch für Unterprozesse sichtbar (wie `export` in Bash) |
| `set -U x wert` | **universal**: bleibt über alle Fish-Sitzungen und Neustarts hinweg erhalten! |
| `set -e x` | Variable löschen |
| `set -q x` | Test, ob eine Variable gesetzt ist (für `if`) |
| `set liste a b c` + `$liste[2]` | Listen-Zugriff (1-indexiert, nicht 0!) |
| `count $liste` | Anzahl Elemente |

**Übung:**
```fish
set kata_test hallo
echo $kata_test

set kata_liste apfel birne kiwi
echo $kata_liste[2]        # birne
count $kata_liste          # 3

set -q kata_test; and echo "gesetzt"; or echo "nicht gesetzt"

# Aufräumen nicht vergessen:
set -e kata_test kata_liste
```

⚠️ **Universal-Variablen (`-U`) besonders vorsichtig testen** — die
überleben einen Neustart des Terminals oder sogar des Rechners. Zum
Ausprobieren:
```fish
set -U kata_persist "ich bleibe"
```
Öffne ein neues Terminal-Tab, tippe `echo $kata_persist` — sie ist
immer noch da. Danach unbedingt aufräumen:
```fish
set -e kata_persist
```

---

## Level 2: Verketten, Bedingungen, Umleitung

Fish nutzt eigene Wörter statt der Bash-Symbole `&&` / `||` / `!`:

| Fish | Bash-Äquivalent | Bedeutung |
|---|---|---|
| `and` | `&&` | nur ausführen, wenn vorheriger Befehl erfolgreich war |
| `or` | `\|\|` | nur ausführen, wenn vorheriger Befehl fehlgeschlagen ist |
| `not cmd` | `!` | Ergebnis negieren |
| `\|` | `\|` | Pipe, wie in Bash |
| `(befehl)` | `` `befehl` `` oder `$(befehl)` | Command Substitution |

**Übung (im Sandbox-Ordner, siehe unten):**
```fish
bash ~/code_projects/katas/fish-basics/setup.sh
cd ~/fish-kata-sandbox/playground

test -d archiv; and echo "existiert"
false; or echo "abgefangen"
echo (date +%Y)              # gibt z.B. 2026 aus
ls | wc -l
```

---

## Level 3: Kontrollstrukturen

| Struktur | Fish-Syntax |
|---|---|
| Bedingung | `if ...; ...; else if ...; else; ...; end` |
| Zählschleife | `for x in liste; ...; end` |
| Bedingte Schleife | `while ...; ...; end` |
| Mehrfachauswahl | `switch $x; case a; ...; case '*'; ...; end` |

**Übung (im Playground):**
```fish
for f in *.md
    echo "Datei: $f"
end

if test -f notizen.txt
    echo "notizen.txt existiert"
else
    echo "nicht gefunden"
end
```

---

## Level 4: Eigene Funktionen schreiben

| Baustein | Bedeutung |
|---|---|
| `function name ... end` | Funktion definieren |
| `$argv` | alle übergebenen Argumente (als Liste) |
| `$argv[1]` | erstes Argument |
| `count $argv` | Anzahl Argumente |
| `return N` | Exit-Code setzen (nicht der "Rückgabewert"!) |

**Unterschied Alias / Abbreviation / Function** (du nutzt alle drei
bereits, ohne dass der Unterschied unbedingt klar sein muss):
- **`alias`** (dein `ll`, `la`, `lt`, `dotgit`) — kurze
  Befehls-Abkürzung, wird intern zu einer Funktion.
- **`abbr`** (dein `dnfi`, `dnfr`, `update-all`) — wird **beim Tippen**
  in der Kommandozeile zum vollen Befehl expandiert, bevor er
  ausgeführt wird. Deshalb steht in deiner Shell-Historie immer der
  volle Befehl, nicht die Abkürzung.
- **`function`** (dein `scale`, `dotgit-sync`) — volle Programmlogik
  mit Bedingungen, Schleifen, mehreren Argumenten.

**Übung:** Schreibe eine eigene kleine Funktion (nur für diese Session,
nicht dauerhaft gespeichert):
```fish
function kata_gruss
    echo "Hallo, $argv[1]! Du hast" (count $argv) "Argument(e) übergeben."
end

kata_gruss Stefan
kata_gruss Stefan Nvim Git
```
Mit `functions -e kata_gruss` wieder entfernen.

---

## Level 5: String-Manipulation & Globbing

| Befehl | Wirkung |
|---|---|
| `*.txt` | alle `.txt`-Dateien im aktuellen Ordner |
| `**/*.txt` | rekursiv, auch in Unterordnern |
| `string split "_" text` | an Zeichen auftrennen |
| `string match -r "regex"` | Regex-Match (gibt Treffer + Gruppen aus) |
| `string length "text"` | Länge |
| `string trim "  text  "` | Leerzeichen entfernen |

**Übung (im Playground):**
```fish
ls **/*.txt                              # findet auch archiv/alt.txt

string split "_" bericht_2026-01.md
# -> bericht
#    2026-01.md

string match -r "bericht_(.*)\.md" bericht_2026-02.md
# -> bericht_2026-02.md   (ganzer Treffer)
#    2026-02               (erste Gruppe)
```

---

## Level 6: Kombi-Übung

Aufgabe, nur mit den Werkzeugen aus diesem Kata (im Playground-Ordner):

Schreibe eine Funktion `kata_berichte`, die:
1. alle Dateien findet, die zu `bericht_*.md` passen,
2. für jede per `string match -r` das Datum (`YYYY-MM`) herausschneidet,
3. eine Zeile ausgibt wie `Bericht vom 2026-01`.

<details>
<summary>Lösungsvorschlag (erst nach eigenem Versuch aufklappen)</summary>

```fish
function kata_berichte
    for datei in bericht_*.md
        set datum (string match -r "bericht_(.*)\.md" $datei)[2]
        echo "Bericht vom $datum"
    end
end
```

</details>

Aufräumen danach: `functions -e kata_berichte`.

---

## Wiederholen

`bash setup.sh` erneut ausführen, um den Playground-Ordner
zurückzusetzen. Denk beim Wiederholen daran, testweise gesetzte
Universal-Variablen (`set -U ...`) und Funktionen wieder zu entfernen,
damit deine echte Fish-Config sauber bleibt.
