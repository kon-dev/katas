#!/bin/bash
# Baut eine Spielwiese für das git-basics-Kata auf: ein "Fake-Remote"
# (simuliert GitHub, aber komplett lokal) plus eine Arbeitskopie davon.
# Kann beliebig oft neu ausgeführt werden -- räumt vorher auf.
set -e

SANDBOX="$HOME/git-kata-sandbox"

rm -rf "$SANDBOX"
mkdir -p "$SANDBOX"

# "Fake-Remote": ein bare Repo, spielt die Rolle von GitHub, aber lokal
# auf der Festplatte -- kein Internet, kein Account nötig.
git init --bare -q "$SANDBOX/remote.git"

# Deine Arbeitskopie, so wie du sie nach einem "git clone" hättest.
git clone -q "$SANDBOX/remote.git" "$SANDBOX/arbeitskopie"
cd "$SANDBOX/arbeitskopie"
git config user.name "Kata Übung"
git config user.email "kata@example.com"

echo "Hallo Kata" > readme.txt
git add readme.txt
git commit -q -m "Initial commit"
git branch -M main
git push -q origin main

echo "Sandbox bereit:"
echo "  Arbeitskopie (hier übst du):  $SANDBOX/arbeitskopie"
echo "  Fake-Remote (spielt GitHub):  $SANDBOX/remote.git"
echo
echo "Los geht's:  cd $SANDBOX/arbeitskopie"
