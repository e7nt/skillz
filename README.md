# skillz

Author a skill once, use it in every coding agent: **Claude Code**, **Codex**, and
**omp**.

Website and skill list: <https://skillz.e7nt.com>

## Install

```bash
curl -fsSL https://skillz.e7nt.com/install.sh | bash
```

Installs to `~/.skillz/`, adds `skillz` to your PATH (`~/.local/bin`), and links
installed skills into all agents. Works on Linux and macOS — bash only, no other
dependencies.

## Commands

| Command | What it does |
|---|---|
| `skillz list` (`ls`) | Show skills in the catalog. `✓` = installed, `·` = available, `~` = local-only (authored with `new`, not in the catalog). |
| `skillz add <name>` | Install a skill from the catalog into `~/.skillz/skills/<name>/`, then link it into every agent. |
| `skillz remove <name>` (`rm`) | Uninstall a skill and unlink it from every agent. |
| `skillz new <name>` | Scaffold a local skill (`SKILL.md` template) and link it in. Edit the file to make it yours. |
| `skillz sync` | (Re)link every installed skill into all agents. Run after manual changes or link repair. |
| `skillz update` | Update `skillz` itself, refresh the catalog, and pull the latest files of every installed catalog skill. |
| `skillz help` | Show usage. |

## How it works

Installed skills live in `~/.skillz/skills/<name>/SKILL.md`. `skillz sync` symlinks
each skill directory into every agent's user-level skills folder:

- `~/.claude/skills/<name>` — Claude Code
- `~/.codex/skills/<name>` — Codex
- `~/.agents/skills/<name>` — portable cross-tool standard
- `~/.agent/skills/<name>` — omp

Edit a skill in one place (`~/.skillz/skills/<name>/`) and every agent sees the same
content. Agents load skills when a session starts, so restart them to pick up changes.

## Adding a skill to the catalog (for repo contributors)

1. Create `skills/<name>/SKILL.md` (and any extra files) in this repo.
2. Add one line to `catalog.json`:

```json
{"name": "<name>", "description": "One-line description", "files": ["SKILL.md"]}
```

3. Push to GitHub. The site and `skillz update` pick it up automatically.

Catalog rules: one object per line; descriptions and filenames contain no double
quotes; filenames contain no spaces.

## Examples

```
$ skillz list
available skills (✓ installed):
  ·  journal        Daily notes, standups, quick thoughts
  ·  commit-style   Conventional commit message format

$ skillz add journal
  fetching SKILL.md
installed 'journal' - syncing to agents
synced 1 skill(s) into 4 agent locations

$ skillz list
available skills (✓ installed):
  ✓  journal        Daily notes, standups, quick thoughts
```
