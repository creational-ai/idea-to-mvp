# Stage 4b: PoC Implementation Planning

## Goal
Break the NEXT PoC into bite-sized, production-grade implementation steps.

## Environment
Claude Code (✅ CODE ALLOWED)

## ⚠️ ONE PoC AT A TIME

Only generate implementation plan for:
- The next logical PoC (based on dependency graph), OR
- The PoC you explicitly choose

**Why one at a time?**
- Learnings from one PoC often change subsequent PoCs
- Keeps planning nimble and agile
- Avoids wasted effort on plans that become obsolete

## Input
- Single PoC from `docs/poc-plan.md`

## Process
1. List all prerequisites (setup Supabase, configure AWS, API keys, etc.)
2. Break implementation into bite-sized steps (max 30 min each)
3. Define verification for EACH step (not just end result)
4. Include specific code snippets, commands, configs
5. Identify what makes this "production-grade" vs "demo"

## Output
`docs/pocN-implementation.md` using `assets/templates/poc-implementation.md`

## Verification Checklist
- [ ] Prerequisites explicitly listed with setup instructions
- [ ] Each step is small enough to verify independently
- [ ] Each step has clear verification criteria (with code)
- [ ] No step relies on mock data where real data is needed
- [ ] Implementation would work in production context

## What CODE IS Allowed

Unlike Stages 1-4, implementation planning gets into specifics:
- Concrete code snippets for each step
- Specific function signatures
- Exact commands to run
- Configuration examples
- Test code structure

## Step Size Guidelines

Each step should be:
- **Completable in ~30 minutes or less**
- **Independently verifiable** (you can prove it works)
- **Self-contained** (doesn't require other steps to test)

If a step is too big, break it into sub-steps (3a, 3b, 3c).

## Production-Grade Checklist

For each step, ensure:
- [ ] No mock data where real data is needed
- [ ] Real integrations, not stubs
- [ ] Error handling included
- [ ] Would work at 10x scale
- [ ] Tests can be written

## Common Pitfalls
- Steps that are too large
- Missing prerequisites
- No verification criteria
- Mock data that hides real complexity
- Skipping error handling

## Next Stage
→ Stage 5: PoC Execution (for this PoC)

## After PoC Complete
→ Return to Stage 4b for next PoC
