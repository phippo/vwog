#!/bin/bash
set -e

# Git: container-spezifische Werte direkt in XDG-Config schreiben
# (--global wuerde ~/.gitconfig schreiben, das ist ein read-only Bind Mount)
mkdir -p ~/.config/git
git config -f ~/.config/git/config safe.directory /workspace
git config -f ~/.config/git/config user.email "philipp.rautenberg@gmail.com"

# Bash History: jeden Befehl sofort schreiben (nicht erst beim Session-Ende)
echo 'PROMPT_COMMAND="history -a"' >> ~/.bashrc

# Versionen pruefen
echo "✅ Persistent volumes ready!"
hugo version
claude --version
