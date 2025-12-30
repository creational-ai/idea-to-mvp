# /dev-plan

Create a detailed implementation plan for a single work item.

## What This Does

Stage 2 of dev-cycle: Break down one work item into bite-sized, production-grade steps.

## Resources

**Read these for guidance**:
- `~/.claude/skills/dev-cycle/SKILL.md` - See "Stage 2: Implementation Plan" section
- `~/.claude/skills/dev-cycle/references/2-planning-guide.md` - Detailed process
- `~/.claude/skills/dev-cycle/assets/templates/implementation-plan.md` - Implementation template
- `~/.claude/skills/dev-cycle/assets/templates/implementation-results.md` - Results template

## User Notes

```
{{notes}}
```

## Key Requirements

✅ **CODE ALLOWED** - Use concrete code snippets, configs, commands

⚠️ **ONE WORK ITEM AT A TIME** - Only plan the next logical item

🏗️ **PRODUCTION-GRADE** - OOP, Pydantic models, type hints, real data

🔒 **SELF-CONTAINED** - Add alongside, don't replace; works independently

## Process

Follow the guidance in `2-planning-guide.md`:
1. List prerequisites
2. Break into ~30 min steps
3. Define verification for each step
4. Include specific code snippets
5. Ensure production-grade (OOP, Pydantic, typing)
6. Ensure self-contained

## Output

Create two documents:
- `docs/[name]-implementation.md` - Evergreen "how to" guide (NO status)
- `docs/[name]-results.md` - Live progress tracking

## After Completion

User will run `/verify-doc` on the plan, fix issues, then request Stage 3 (Execution).
