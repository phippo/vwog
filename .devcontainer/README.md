# WVOG Website - Minimal Container Setup

**WVOG** = **W**ebseite **V**or-**O**rt-**G**estalten

## 🎯 Zweck

Minimaler Dev-Container für die WVOG-Website mit Claude Code.
Der Container startet mit dem Nötigsten - alle weiteren Tools (Hugo, etc.) werden mit Hilfe von Claude Code installiert.

## 📦 Was ist drin?

- **Node.js 20** (für Claude Code)
- **Claude Code CLI** (Terminal-Integration)
- **Git** (Version Control)
- **vim/nano** (Editoren)
- **curl/wget** (Downloads)
- **non-root user** (Security)

## 💾 Persistente Volumes

Der Container nutzt persistente Volumes für Rebuild-Sicherheit:

### CRITICAL (vom Host gemountet)
- **`~/.ssh`** → SSH Keys für GitHub (keine Neu-Einrichtung nach Rebuild)
- **`~/.gitconfig`** → Git User Settings (Name, Email, Aliases)

### PERSISTENCE (Docker Volumes)
- **`wvog-bash-history`** → Command History (Produktivität & Audit)
- **`wvog-claude-config`** → Claude API Keys & Preferences
- **`wvog-npm-cache`** → NPM Package Cache (schnellere Builds)

**Vorteil:** Nach jedem Rebuild sind alle Settings sofort wieder da!

## 🚀 Quick Start

### 1. Files in neues Verzeichnis kopieren

```bash
# Neues Projekt-Verzeichnis erstellen
mkdir ~/wvog-website
cd ~/wvog-website

# Files kopieren
cp /workspace/tmp/Dockerfile .
mkdir .devcontainer
cp /workspace/tmp/devcontainer.json .devcontainer/
cp /workspace/tmp/README.md .
```

### 2. In VS Code öffnen

```bash
code .
```

### 3. Container starten

- VS Code zeigt Popup: "Reopen in Container"
- Oder: `Cmd/Ctrl+Shift+P` → "Dev Containers: Reopen in Container"

### 4. Mit Claude Code arbeiten

Erste Schritte mit Claude:

```
👉 "Hilf mir, Hugo Extended v0.139.0 zu installieren"
👉 "Erstelle ein neues Hugo-Projekt für die WVOG-Website"
👉 "Zeige mir geeignete Hugo-Themes für lokale Informations-Seiten"
```

## 🛠️ Nächste Schritte (mit Claude)

1. **Hugo installieren** (Extended Version für SCSS)
2. **Hugo-Projekt initialisieren** (`hugo new site`)
3. **Theme auswählen** (PaperMod, Ananke, oder Custom)
4. **Content-Struktur** aufbauen (Blog, Termine, Dokumente)
5. **Deployment** einrichten (GitHub Pages, Netlify, etc.)

## 📋 Container erweitern

Wenn du später mehr Tools brauchst, frag einfach Claude:

```
👉 "Füge Zsh mit Oh-My-Zsh zum Dockerfile hinzu"
👉 "Installiere Python für Build-Scripts"
👉 "Richte GitHub CLI ein"
```

## 🔒 Security

- Container läuft als **non-root user** (`node`)
- Basiert auf offizieller Node.js-Image
- Minimale Attack Surface (nur essenzielle Tools)

## 📚 Ressourcen

- [Hugo Docs](https://gohugo.io/documentation/)
- [Claude Code Docs](https://code.claude.com/docs)
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)

---

**Viel Erfolg mit deinem WVOG-Projekt!** 🏛️
