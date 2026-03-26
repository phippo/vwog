# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**WVOG** (Webseite Vor-Ort-Gestalten) — a Hugo-based community website for transparent local politics in Althegnenberg & Hörbach.

## Development Commands

```bash
hugo server --buildDrafts   # dev server on http://localhost:1313
hugo                        # build to /workspace/public
hugo version                # verify Hugo Extended is available
```

## Development Environment

VS Code Dev Container (Node.js 20, Hugo Extended v0.159.0, non-root `node` user). Both Hugo and Claude Code are installed in the Dockerfile — they survive rebuilds.

## Directory Layout

| Path | Description |
|---|---|
| `/workspace` | Project workspace (Hugo site root) |
| `/workspace/project-data` | Project data from OneDrive (read-write) |
| `/workspace/knowledge-base` | Obsidian vault (read-only) |
| `/workspace/knowledge-base/05-Produkte/wvog` | WVOG product docs (writable) |
| `/workspace/knowledge-base/04-System/Claude-Workspace` | Claude exchange area (writable) |

## Persistent Volumes

These survive container rebuilds — never manually reinstall what lives here:

- `wvog-claude-config` → `/home/node/.claude` — Claude API keys & preferences
- `wvog-bash-history` → `/commandhistory` — shell history
- `wvog-npm-cache` → `/home/node/.npm` — npm cache
- Host `~/.ssh` and `~/.gitconfig` are bind-mounted — SSH and Git auth work out of the box

## Architecture Principles

- **Dockerfile is the source of truth** — if a tool is needed persistently, add it to the Dockerfile, not manually in the container
- **Knowledge base is read-only** — only the two explicitly writable subdirs (`05-Produkte/wvog`, `04-System/Claude-Workspace`) can be written
- The website framework is **Hugo** (static site generator); port 1313 is the Hugo dev server port
- Deployment target: Netlify (free tier) with custom domain `vor-ort-gestalten.de`

## Hugo Content Architecture

- **Content types:** `themen`, `aktuelles`, `team`, `pages`
- **Taxonomies:** `status` (offen / in-arbeit / beschlossen)
- **Layout:** Custom (no external theme)
- **CSS:** SCSS via Hugo Pipes
- **JS:** None (static site, no framework)
