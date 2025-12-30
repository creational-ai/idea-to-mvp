# /dev-overview

Create a high-level design overview for a feature, bug fix, or PoC.

## What This Does

Stage 1 of dev-cycle: Analyze and plan the work without writing code.

## Resources

**Read these for guidance**:
- `~/.claude/skills/dev-cycle/SKILL.md` - See "Stage 1: Overview" section
- `~/.claude/skills/dev-cycle/references/1-overview-guide.md` - Detailed process
- `~/.claude/skills/dev-cycle/assets/templates/overview.md` - Output template

## User Notes

```
{{notes}}
```

## Key Requirements

⛔ **NO CODE** - This is design only (architecture, flows, diagrams)

🔒 **Self-Contained** - Break work into items that work independently

## Process

Follow the guidance in `1-overview-guide.md`:
1. Document current architecture
2. Define target architecture
3. Identify what needs to change
4. Break into self-contained work items
5. Evaluate approaches
6. Document decisions
7. Update [idea]-poc-plan.md (if applicable)

## Output

Create `docs/[name]-overview.md` using the template.

## After Completion

User will run `/verify-doc` on the overview, fix issues, then request Stage 2 (Planning).
