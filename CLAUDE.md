# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repo contains two complementary Claude Code skills:

1. **blueprint** - Planning phase (concept to executable plan)
2. **dev-cycle** - Development loop (plan to working code)

## Repo Structure

```
idea-to-mvp/
├── deploy.sh                   # Deploy both skills and commands
├── sync-from-user.sh           # Sync changes from deployed skills
├── commands/                   # Global commands (deployed by both skills)
│   ├── verify-doc.md          # Document verification
│   ├── dev-overview.md        # Create high-level design
│   ├── dev-plan.md            # Plan implementation steps
│   ├── dev-execute.md         # Execute step-by-step
│   └── small-win-check.md     # Project health check
├── blueprint/                  # Planning skill
│   ├── SKILL.md               # Main skill definition
│   ├── assets/templates/      # Templates (north-star, design, poc-plan)
│   └── references/            # Stage guides (1-4)
└── dev-cycle/                 # Development skill
    ├── SKILL.md               # Main skill definition
    ├── assets/templates/      # Templates (overview, implementation, results, PROJECT_STATE)
    ├── references/            # Stage guides (1-3)
    └── docs/                  # Design docs for this skill
```

## Development Workflow

### Making Changes

1. **Edit files in this repo** (not in `~/.claude/skills/`)
2. **Test locally** if needed
3. **Deploy**:
   ```bash
   ./deploy.sh
   ```
4. **Commit and push**: Standard git workflow

### Sync from Deployed Skills

If you made changes in `~/.claude/skills/blueprint/`, `~/.claude/skills/dev-cycle/`, or `~/.claude/commands/`:

```bash
./sync-from-user.sh
git status  # Review changes
```

## Key Commands

```bash
# Deploy both skills and all commands
./deploy.sh

# Sync changes back from deployed skills and commands
./sync-from-user.sh

# Check git status
git status
```

## File Naming Conventions

**blueprint creates:**
- `north-star.md` - Vision and goals (one per project)
- `[idea]-design.md` - Architecture (e.g., `core-design.md`)
- `[idea]-poc-plan.md` - Work items to implement (e.g., `core-poc-plan.md`)

**dev-cycle creates:**
- `PROJECT_STATE.md` - Work item tracking
- `docs/[name]-overview.md` - Feature/bug design analysis
- `docs/[name]-implementation.md` - Implementation guide (evergreen)
- `docs/[name]-results.md` - Progress tracking (live status)
- `tests/test_[name]_*.py` - Tests grouped by work item

## Templates

**blueprint** (`blueprint/assets/templates/`):
- `north-star.md` - Stage 1 output
- `design.md` - Stage 2 output
- `poc-plan.md` - Stage 4 output

**dev-cycle** (`dev-cycle/assets/templates/`):
- `overview.md` - Stage 1 output
- `implementation-plan.md` - Stage 2 output (implementation guide)
- `implementation-results.md` - Stage 2 output (progress tracking)
- `PROJECT_STATE.md` - Project tracking

## Reference Guides

**blueprint** (`blueprint/references/`):
- `1-concept-guide.md` through `4-poc-planning-guide.md`

**dev-cycle** (`dev-cycle/references/`):
- `1-overview-guide.md` through `3-execution-guide.md`

## Slash Commands

**All commands** (`commands/`):
- `verify-doc.md` - Document verification
- `dev-overview.md` - Create high-level design
- `dev-plan.md` - Plan implementation steps
- `dev-execute.md` - Execute step-by-step
- `small-win-check.md` - Project health check

Commands are global and deployed by both skills to `~/.claude/commands/`

## Deployment

Single `deploy.sh` script at root deploys everything:
- `blueprint/` → `~/.claude/skills/blueprint/`
- `dev-cycle/` → `~/.claude/skills/dev-cycle/`
- `commands/` → `~/.claude/commands/`

Single `sync-from-user.sh` script syncs everything back

## Git Workflow

```bash
# Standard workflow
git add .
git commit -m "Description"
git push
```

**Remote**: `git@github-creational:creational-ai/idea-to-mvp.git`

## Contributing Guidelines

- Keep each skill's SKILL.md as the source of truth
- Templates should be generic (no project-specific content)
- References provide detailed stage guidance
- Test slash commands after changes
- Deploy before pushing to verify changes work
- blueprint is pure planning (NO CODE)
- dev-cycle allows code (Stage 1 is design-only, Stages 2-3 allow code)
