# Git-Basics-Kata

Übung für den Grundzyklus von Git: status → add → commit → push/pull,
plus Branches und Rückgängig-Machen. Setzt keine Vorkenntnisse voraus,
außer der Erklärung, die du schon bekommen hast (Repo, Staging-Area,
Commit, Remote, `origin`, `main`).

Alle Übungen laufen in einer **Sandbox**, die nichts mit deinen echten
Repos (`dotfiles`, `katas`) zu tun hat — du kannst hier nichts kaputt
machen.

---

## Level 0: Sandbox aufbauen

```bash
bash ~/code_projects/katas/git-basics/setup.sh
cd ~/git-kata-sandbox/arbeitskopie
```

Das Skript baut dir zwei Dinge:
- `~/git-kata-sandbox/remote.git` — ein **bare Repo**, das die Rolle
  von GitHub spielt (komplett lokal, kein Internet nötig).
- `~/git-kata-sandbox/arbeitskopie` — deine Arbeitskopie davon, so als
  hättest du gerade `git clone` von GitHub gemacht.

Du kannst das Skript jederzeit erneut ausführen, um wieder bei null
anzufangen — es räumt vorher komplett auf.

---

## Level 1: Der Grundzyklus (status, add, commit)

| Befehl | Wirkung |
|---|---|
| `git status` | zeigt, was geändert/neu/gestaged ist |
| `git add <datei>` | Änderung in die Staging-Area legen |
| `git add -A` | alle Änderungen auf einmal stagen |
| `git commit -m "Nachricht"` | Staging-Area als Snapshot in die Historie |

**Übung:**
1. `git status` — sollte "nothing to commit" zeigen (frisch aus Level 0).
2. Öffne `readme.txt`, füge eine Zeile hinzu, speichere.
3. `git status` — jetzt zeigt es die Änderung als "not staged" an.
4. `git add readme.txt`, dann `git status` erneut — jetzt "staged".
5. `git commit -m "Zeile zu readme hinzugefügt"`.
6. Lege eine neue Datei `notizen.txt` an, `git add -A`, committen.

---

## Level 2: Historie ansehen (log, diff)

| Befehl | Wirkung |
|---|---|
| `git log` | Commit-Historie ansehen |
| `git log --oneline` | kompakte Ein-Zeilen-Ansicht |
| `git diff` | Änderungen, die noch **nicht** gestaged sind |
| `git diff --staged` | Änderungen, die **schon** gestaged sind |

**Übung:**
1. `git log --oneline` — du solltest jetzt 3 Commits sehen.
2. Ändere `readme.txt` wieder, aber committe noch nicht.
3. `git diff` — zeigt dir genau, was sich geändert hat (rot/grün).
4. `git add readme.txt`, dann `git diff` (jetzt leer) und
   `git diff --staged` (jetzt zeigt es die Änderung).
5. Committen.

---

## Level 3: Mit dem Remote arbeiten (push, clone, pull)

| Befehl | Wirkung |
|---|---|
| `git push` | eigene Commits zum Remote hochladen |
| `git clone <pfad/url>` | ein Repo komplett neu herunterladen |
| `git pull` | neue Commits vom Remote herunterladen |

**Übung:**
1. In `arbeitskopie`: `git push` — deine bisherigen Commits landen im
   Fake-Remote.
2. Simuliere jetzt einen **zweiten Rechner** (z.B. einen Kollegen):
   ```bash
   cd ~/git-kata-sandbox
   git clone remote.git kollege
   cd kollege
   git config user.name "Kollege"
   git config user.email "kollege@example.com"
   ```
3. Ändere in `kollege/readme.txt` etwas, committe, `git push`.
4. Wechsle zurück: `cd ~/git-kata-sandbox/arbeitskopie`.
5. `git pull` — die Änderung deines "Kollegen" landet jetzt auch bei
   dir, ohne dass du sie manuell abtippen musstest.

---

## Level 4: Branches (erstellen, wechseln, mergen)

| Befehl | Wirkung |
|---|---|
| `git branch` | zeigt alle lokalen Branches |
| `git switch -c feature-x` | neuen Branch erstellen und wechseln |
| `git switch main` | zurück zu `main` wechseln |
| `git merge feature-x` | Branch `feature-x` in den aktuellen Branch einfügen |

**Übung (in `arbeitskopie`):**
1. `git switch -c feature-farbe`.
2. Füge in `readme.txt` eine Zeile hinzu (z.B. "Lieblingsfarbe: Blau"),
   committen.
3. `git switch main` — beachte: die Zeile ist in `readme.txt` jetzt
   wieder weg! (Sie existiert nur im Branch `feature-farbe`.)
4. `git merge feature-farbe` — jetzt ist sie auch in `main`.
5. `git push` — der gemergte Stand geht zum Remote.

---

## Level 5: Rückgängig machen

⚠️ Diese Befehle können Änderungen **endgültig** löschen — deshalb
erst hier in der Sandbox üben, nicht live an echten Repos ausprobieren.

| Befehl | Wirkung |
|---|---|
| `git restore <datei>` | noch nicht gestagte Änderung an einer Datei verwerfen |
| `git restore --staged <datei>` | aus der Staging-Area nehmen (Änderung bleibt erhalten) |
| `git reset --soft HEAD~1` | letzten Commit rückgängig machen, Änderungen bleiben erhalten |
| `git revert <commit>` | macht einen Commit rückgängig, indem ein **neuer** Gegenkommit erstellt wird |

**Übung:**
1. Ändere `readme.txt`, aber committe nicht — `git restore readme.txt`
   macht die Änderung komplett weg.
2. Ändere `readme.txt`, `git add`, aber committe nicht —
   `git restore --staged readme.txt` nimmt sie aus der Staging-Area
   (die Änderung selbst bleibt in der Datei erhalten).
3. Committe irgendeine kleine Änderung, dann
   `git reset --soft HEAD~1` — der Commit ist weg, aber die Änderung
   liegt wieder unstaged in deinem Arbeitsverzeichnis.
4. Committe sie erneut, dann `git revert HEAD` — merke den
   Unterschied: es entsteht ein **neuer** Commit, der die alte Änderung
   aufhebt, die Historie bleibt vollständig sichtbar (das ist der
   sichere Weg, wenn der Commit schon gepusht wurde).

---

## Level 6: Kombi-Übung — ein echter Konflikt

Ein Konflikt entsteht, wenn zwei Leute dieselbe Zeile geändert haben,
bevor gemerged wird. So provozierst du absichtlich einen:

1. In `arbeitskopie`: ändere Zeile 1 von `readme.txt`, committe, `git push`.
2. In `kollege` (ohne vorher zu pullen!): ändere **dieselbe** Zeile 1
   zu etwas anderem, committe.
3. In `kollege`: `git push` — das schlägt fehl, weil dein Remote schon
   neuer ist.
4. `git pull` in `kollege` — Git meldet einen **Merge-Konflikt** direkt
   in `readme.txt` (erkennbar an `<<<<<<<`, `=======`, `>>>>>>>`).
5. Öffne die Datei, entscheide dich für eine Version (oder kombiniere
   beide), lösche die Konflikt-Markierungen.
6. `git add readme.txt`, `git commit` (ohne `-m`, Git schlägt eine
   Merge-Nachricht vor — einfach speichern und schließen).
7. `git push` — jetzt klappt's.

Konflikte sehen beim ersten Mal beängstigend aus, sind aber einfach
nur Textstellen, die Git nicht automatisch entscheiden konnte.

---

## Wiederholen

Zum erneuten Üben einfach `bash setup.sh` erneut ausführen — die
Sandbox wird komplett zurückgesetzt.
