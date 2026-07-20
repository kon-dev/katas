# Nvim-Kata für Einsteiger

Ein "Kata" ist eine Übung, die du wiederholt durchgehst, bis die Bewegungen
in die Finger übergehen — wie beim Kampfsport. Es geht nicht darum, es
einmal "geschafft" zu haben, sondern es so oft zu wiederholen, bis du
nicht mehr nachdenken musst.

## So benutzt du dieses Kata

1. Öffne die Übungsdatei im Terminal:
   ```
   nvim playground.txt
   ```
2. Arbeite die Level der Reihe nach durch (unten in dieser Datei).
3. Nutze für jedes Level **nur** die Tasten, die dort eingeführt werden.
   Keine Pfeiltasten, keine Maus.
4. Wenn du `playground.txt` "kaputt" gespielt hast: einfach beenden ohne
   zu speichern (`:q!`) und neu öffnen. Die Datei ist zum Kaputtmachen da.
5. Wiederhole das ganze Kata an einem anderen Tag noch mal von vorne.

---

## Level 0: Nvim wieder verlassen (zuerst lernen!)

| Tasten | Bedeutung |
|---|---|
| `:w` <Enter> | speichern |
| `:q` <Enter> | beenden (nur wenn nichts geändert wurde) |
| `:q!` <Enter> | beenden **ohne** zu speichern, Änderungen verwerfen |
| `:wq` <Enter> | speichern **und** beenden |
| `ZZ` | speichern und beenden (Kurzform, kein `:` nötig) |

**Übung:** Öffne `playground.txt`, tippe irgendetwas Unsinniges, und
beende dann mit `:q!` OHNE zu speichern. Öffne die Datei erneut — deine
Änderung sollte weg sein.

---

## Level 1: Die Modi

Nvim hat verschiedene Modi. Der wichtigste Unterschied zu normalen
Editoren: du tippst nicht einfach drauflos, sondern wechselst bewusst
in den Modus, in dem du gerade sein willst.

| Taste | Wechselt in... |
|---|---|
| `i` | Insert-Modus, **vor** dem Cursor |
| `a` | Insert-Modus, **nach** dem Cursor |
| `I` | Insert-Modus, am **Zeilenanfang** |
| `A` | Insert-Modus, am **Zeilenende** |
| `o` | neue Zeile **unter** der aktuellen, Insert-Modus |
| `O` | neue Zeile **über** der aktuellen, Insert-Modus |
| `Esc` | zurück in den Normal-Modus (das "Zuhause") |

**Merksatz:** Nach jeder Eingabe drückst du `Esc`, um wieder ins
"Normal" zu kommen. Das wird zur Gewohnheit.

**Übung (in `playground.txt`, Abschnitt LEVEL 1):**
1. Gehe mit dem Cursor auf die Zeile `Hier steht ein Satz.`
2. Drücke `A`, tippe ` Und noch einer.`, dann `Esc`.
3. Drücke `o`, tippe `Eine neue Zeile darunter.`, dann `Esc`.
4. Drücke `O`, tippe `Eine neue Zeile darüber.`, dann `Esc`.
5. Speichere NICHT — verlasse mit `:q!`.

---

## Level 2: Bewegen (Movement)

Ab jetzt: **keine Pfeiltasten mehr benutzen.**

| Taste | Bewegung |
|---|---|
| `h` | ein Zeichen nach links |
| `j` | eine Zeile nach unten |
| `k` | eine Zeile nach oben |
| `l` | ein Zeichen nach rechts |
| `w` | zum Anfang des nächsten Worts |
| `b` | zum Anfang des vorherigen Worts |
| `e` | zum Ende des (nächsten) Worts |
| `0` | zum Zeilenanfang |
| `$` | zum Zeilenende |
| `gg` | zum Anfang der Datei |
| `G` | zum Ende der Datei |
| `5G` | springe zu Zeile 5 (Zahl + `G`) |

**Übung (Abschnitt LEVEL 2 in `playground.txt`):**
Es gibt dort Marker `>>> ZIEL 1 <<<`, `>>> ZIEL 2 <<<` usw.
Navigiere **nur** mit den Tasten oben von Ziel zu Ziel, in Reihenfolge.
Wenn du am Ziel bist, drücke `x` einmal (löscht ein Zeichen — siehe
Level 3), damit du siehst, dass du wirklich angekommen bist.

---

## Level 3: Löschen, Kopieren, Einfügen, Rückgängig

| Taste | Wirkung |
|---|---|
| `x` | ein Zeichen löschen |
| `dd` | ganze Zeile löschen (und merken) |
| `dw` | ein Wort löschen |
| `yy` | ganze Zeile kopieren ("yank") |
| `p` | nach dem Cursor einfügen |
| `P` | vor dem Cursor einfügen |
| `u` | letzte Aktion rückgängig machen |
| `Strg-r` | rückgängig gemachte Aktion wiederherstellen (Redo) |

**Muster dahinter:** Viele Befehle sind `Aktion` + `Bewegung`, z.B.
`d` (delete) + `w` (word) = `dw`. Das gilt auch für `d$` (bis Zeilenende
löschen) oder `d0` (bis Zeilenanfang löschen). Das ist der Kern von
Vim — sobald das "klick" macht, wird alles leichter.

**Übung (Abschnitt LEVEL 3 in `playground.txt`):**
1. Lösche die komplette Zeile, die mit `LÖSCHEN:` beginnt (`dd`).
2. Kopiere die Zeile `KOPIEREN: diese Zeile zweimal einfügen` (`yy`),
   und füge sie zweimal darunter ein (`p` zweimal).
3. Mach mit `u` alles rückgängig, bis der Ursprungszustand wieder da
   ist. Stelle dann mit `Strg-r` alles wieder her.

---

## Level 4: Suchen

| Taste | Wirkung |
|---|---|
| `/wort` + Enter | vorwärts nach "wort" suchen |
| `?wort` + Enter | rückwärts nach "wort" suchen |
| `n` | zum nächsten Treffer springen |
| `N` | zum vorherigen Treffer springen |

**Übung (Abschnitt LEVEL 4 in `playground.txt`):**
Suche nach `TODO` (`/TODO` + Enter). Springe mit `n` durch alle
Treffer, bis du wieder beim ersten bist.

---

## Level 5: Visual Mode (Markieren)

| Taste | Wirkung |
|---|---|
| `v` | Visual-Modus, zeichenweise markieren |
| `V` | Visual-Modus, zeilenweise markieren |
| `Strg-v` | Visual-Modus, blockweise markieren |
| danach `d` | Markiertes löschen |
| danach `y` | Markiertes kopieren |

**Übung (Abschnitt LEVEL 5 in `playground.txt`):**
1. Gehe auf die erste Zeile des Absatzes `MARKIEREN-BLOCK`.
2. Drücke `V`, dann `j` `j` (markiert 3 Zeilen), dann `d` (löscht sie).
3. Mach mit `u` rückgängig.

---

## Level 6: Alles zusammen

Im Abschnitt LEVEL 6 von `playground.txt` steht eine kleine
Kombi-Aufgabe, die Bewegung, Löschen/Kopieren und Suchen kombiniert.
Löse sie **ohne** in dieser README nachzuschauen.

---

## Wenn du dieses Kata wiederholst

Beim zweiten oder dritten Durchlauf: versuche, jedes Level schneller
und ohne Nachdenken durchzugehen. Wenn ein Level sich noch nicht
"automatisch" anfühlt, wiederhole nur dieses Level 2–3 Mal, bevor du
weitermachst.
