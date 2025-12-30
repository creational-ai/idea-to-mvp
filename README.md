# idea-to-mvp

![Claude Skill](https://img.shields.io/badge/Claude-Skill-blue)

A structured workflow for taking ideas from concept to working product through two complementary skills:

1. **blueprint** - Planning phase (0 to 1)
2. **dev-cycle** - Development loop (1 to N)

## Quick Start

```bash
git clone git@github-creational:creational-ai/idea-to-mvp.git
cd idea-to-mvp

# Deploy both skills and all commands
./deploy.sh
```

## Skills Overview

### blueprint - Planning Phase

Creates the foundation before any code is written.

**Stages**:
1. Concept - Refine idea into North Star doc
2. Design - Technical architecture
3. Research - Market validation
4. PoC Planning - Define work items and dependencies

**Output**: `north-star.md`, `[idea]-design.md`, `[idea]-poc-plan.md`

**Deploy to**: `~/.claude/skills/blueprint/`

### dev-cycle - Development Loop

Implements work items through a repeating 3-stage cycle.

**Stages**:
1. Overview - Analyze features/bugs (design only)
2. Implementation Plan - Break into steps with code snippets
3. Execution - Implement with tests

**Commands**:
- `/dev-overview` - Create high-level design
- `/dev-plan` - Plan implementation steps
- `/dev-execute` - Execute step-by-step
- `/small-win-check` - Health check after work completion

**Deploy to**: `~/.claude/skills/dev-cycle/`

## Workflow

```
1. Use blueprint to create your plan
   → Outputs: north-star.md, core-design.md, core-poc-plan.md

2. Use dev-cycle to execute the plan
   → /dev-plan: Plan first work item
   → /dev-execute: Implement it
   → Repeat for each work item

3. When new issues emerge
   → /dev-overview: Analyze and add to plan
   → Continue the cycle
```

## Key Principles

- **blueprint is NO-CODE** - Pure planning and design
- **dev-cycle allows code** - Stage 1 is design-only, Stages 2-3 allow code
- **One work item at a time** - Plan and execute incrementally
- **Production-grade quality** - OOP, Pydantic, type hints, tests required
- **Self-contained work** - Each item works independently

## File Structure

```
idea-to-mvp/                    # Project repo
├── deploy.sh                   # Deploy both skills and commands
├── sync-from-user.sh           # Sync changes from deployed skills
├── commands/                   # Global commands (used by both skills)
│   ├── verify-doc.md
│   ├── dev-overview.md
│   ├── dev-plan.md
│   ├── dev-execute.md
│   └── small-win-check.md
├── blueprint/                  # Planning skill
│   ├── SKILL.md
│   ├── assets/templates/
│   └── references/
└── dev-cycle/                  # Development skill
    ├── SKILL.md
    ├── assets/templates/
    └── references/

~/.claude/skills/               # Deployed skills
├── blueprint/
└── dev-cycle/

~/.claude/commands/             # Global commands
├── verify-doc.md
├── dev-overview.md
├── dev-plan.md
├── dev-execute.md
└── small-win-check.md
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
