# idea-to-mvp

![Claude Skill](https://img.shields.io/badge/Claude-Skill-blue)
![Claude Code](https://img.shields.io/badge/Claude-Code-green)
![Claude AI](https://img.shields.io/badge/Claude-AI-purple)

A structured workflow for taking ideas from concept to working product through 6 stages.

## Installation

```bash
git clone git@github-creational:creational-ai/idea-to-mvp.git
cd idea-to-mvp
./deploy.sh
```

This deploys to:
- `~/.claude/skills/idea-to-mvp/` - Skill files
- `~/.claude/commands/` - Global slash commands

## Stage Workflow

| Stage | Environment | Code Allowed | Purpose |
|-------|-------------|--------------|---------|
| 1. Concept | Claude Desktop | NO | Refine idea into clear concept |
| 2. Design | Claude Desktop | NO | Technical architecture |
| 3. Research | Claude Desktop | NO | Market validation |
| 4. PoC Planning | Claude Code | NO | Define what to prove and in what order |
| 4b. PoC Implementation | Claude Code | YES | Break PoC into bite-sized steps |
| 5. PoC Execution | Claude Code | YES | Implement one step at a time |
| 6. MVP | Claude Code | YES | Combine proven PoCs |

## Key Principles

- **Stages 1-4 are NO-CODE zones** - Focus on thinking, not implementation
- **One PoC at a time** - Learnings often change subsequent plans
- **One step at a time** - Verify after each implementation step
- **Production-grade PoCs** - Real integrations, not mocks

## Commands

- `/small-win-check` - Run after completing PoC milestones to assess alignment with North Star vision

## File Structure

```
~/.claude/skills/idea-to-mvp/
├── SKILL.md                 # Main skill definition
├── assets/templates/        # Document templates
│   ├── north-star.md
│   ├── design.md
│   ├── poc-plan.md
│   ├── poc-implementation.md
│   ├── poc-results.md
│   ├── step-results.md
│   └── PROJECT_STATE.md
└── references/              # Stage reference docs
    ├── stage-1-concept.md
    ├── stage-2-design.md
    ├── stage-3-research.md
    ├── stage-4-poc-planning.md
    ├── stage-4b-poc-implementation.md
    ├── stage-5-poc-execution.md
    └── stage-6-mvp.md
```

## License

MIT
