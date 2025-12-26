# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repo contains the "idea-to-mvp" Claude Code skill - a structured workflow for taking ideas from concept to MVP through 6 stages.

## Repo Structure

```
idea-to-mvp/
├── SKILL.md                    # Main skill definition
├── README.md                   # Public documentation
├── LICENSE                     # MIT License
├── deploy.sh                   # Deploy skill to ~/.claude/skills/
├── sync-from-user.sh           # Pull changes from deployed skill
├── assets/templates/           # Document templates for users
├── references/                 # Stage reference docs
├── commands/                   # Slash commands (small-win-check, verify-doc)
└── deployed-skill/             # Symlink to ~/.claude/skills/idea-to-mvp
```

## Development Workflow

### Making Changes

1. **Edit files in this repo** (not in `~/.claude/skills/`)
2. **Test locally** if needed
3. **Deploy**: `./deploy.sh`
4. **Commit and push**: Standard git workflow

### Sync from Deployed Skill

If you made changes in `~/.claude/skills/idea-to-mvp/`:

```bash
./sync-from-user.sh
git status  # Review changes
```

## Key Commands

```bash
# Deploy to ~/.claude/skills/ and ~/.claude/commands/
./deploy.sh

# Sync changes back from deployed skill
./sync-from-user.sh

# Check git status
git status
```

## File Naming Conventions

**Documents users create:**
- `docs/north-star.md` - Vision and goals
- `docs/design.md` - Architecture
- `docs/poc-plan.md` - PoC planning
- `docs/poc[N]-implementation.md` - Per-PoC implementation guide
- `docs/poc[N]-results.md` - Per-PoC results tracking
- `PROJECT_STATE.md` - Current status

**Tests:**
- `tests/test_poc[N]_*.py` - Tests grouped by PoC

## Templates

Located in `assets/templates/`:
- `north-star.md` - Stage 1 output
- `design.md` - Stage 2 output
- `poc-plan.md` - Stage 4 output
- `poc-implementation.md` - Stage 4b output
- `poc-results.md` - PoC completion summary
- `PROJECT_STATE.md` - Project tracking

## Stage References

Located in `references/`:
- `stage-1-concept.md` through `stage-6-mvp.md`
- `small-win-check.md` - Guidance for health checks

## Slash Commands

Located in `commands/`:
- `small-win-check.md` - Project health check
- `verify-doc.md` - Document verification

## Deployment

The `deploy.sh` script copies files to:
- `~/.claude/skills/idea-to-mvp/` - Skill files
- `~/.claude/commands/` - Global commands

## Git Workflow

```bash
# Standard workflow
git add .
git commit -m "Description"
git push
```

**Remote**: `git@github-creational:creational-ai/idea-to-mvp.git`

## Contributing Guidelines

- Keep SKILL.md as the source of truth
- Templates should be generic (no project-specific content)
- References provide detailed stage guidance
- Test slash commands after changes
- Deploy before pushing to verify changes work
