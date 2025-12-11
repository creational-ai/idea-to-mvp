# Stage 4: PoC Planning

## Goal
Define what needs to be proven and in what order — with PRODUCTION-GRADE thin slices.

## Environment
Claude Code (NO CODE YET - planning only)

## Input
- Validated design docs (copied to `docs/` folder)

## Process
1. Refine design with Claude Code's perspective
2. Identify atomic things to prove (PoCs)
3. Map dependencies between PoCs
4. Create PoC diagram
5. Define success criteria for each PoC

## Output
`docs/poc-plan.md` using `assets/templates/poc-plan.md`

## Verification Checklist
- [ ] Each PoC proves one specific thing
- [ ] Dependencies mapped (which PoCs unlock others)
- [ ] Success criteria measurable
- [ ] Order of execution clear

## What Makes a Good PoC

### A PoC Should:
- Prove ONE specific technical or business assumption
- Be small enough to complete in 1-3 sessions
- Have clear, measurable success criteria
- Build toward the final MVP

### A PoC Should NOT:
- Try to prove multiple things at once
- Be so large it feels like a project itself
- Have vague "it works" success criteria
- Be disconnected from the end goal

## PoC Dependency Mapping

Create a diagram showing:
- Which PoCs can run in parallel (no dependencies)
- Which PoCs depend on others
- The critical path to MVP

Example:
```
PoC 1 (Auth) ──→ PoC 3 (User Data) ──→ PoC 5 (Full Flow)
                        ↘
PoC 2 (API) ─────────────→ PoC 4 (Integration)
```

## Production-Grade Reminder

Even at planning stage, think production:
- Real databases, not mock data
- Real APIs, not stubs
- Real error handling, not happy-path only
- Patterns that scale

## Common Pitfalls
- Planning too many PoCs
- PoCs that are too large
- Missing critical dependencies
- Vague success criteria

## Next Stage
→ Stage 4b: PoC Implementation Planning (ONE PoC at a time)
