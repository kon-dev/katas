#!/bin/bash
# Baut eine Spielwiese für das fish-basics-Kata: ein paar Beispieldateien
# zum Üben von Globbing und String-Manipulation. Kann jederzeit erneut
# ausgeführt werden -- räumt vorher auf.
set -e

SANDBOX="$HOME/fish-kata-sandbox"

rm -rf "$SANDBOX"
mkdir -p "$SANDBOX/playground/archiv" "$SANDBOX/playground/scripts"
cd "$SANDBOX/playground"

echo "Kaufen: Milch, Brot, Eier" > einkaufsliste.txt
echo "Ein paar Notizen." > notizen.txt
echo "# Bericht Januar" > bericht_2026-01.md
echo "# Bericht Februar" > bericht_2026-02.md
echo "# Bericht März" > bericht_2026-03.md
touch bild1.png bild2.jpg
echo "alter Kram" > archiv/alt.txt
echo "noch mehr alter Kram" > archiv/alt2.txt
echo 'echo "Hallo aus einem Skript"' > scripts/hello.sh

echo "Sandbox bereit: $SANDBOX/playground"
echo "Los geht's:  cd $SANDBOX/playground"
