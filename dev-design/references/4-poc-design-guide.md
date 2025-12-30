# Stage 4: PoC Design

## Goal
Define what needs to be proven and in what order — with PRODUCTION-GRADE thin slices.

## Code Allowed
NO

## Input
- Validated architecture doc (`[name]-architecture.md`)

## Process
1. Refine architecture with implementation perspective
2. Identify atomic things to prove (PoCs)
3. Map dependencies between PoCs
4. Create PoC diagram
5. Define success criteria for each PoC

## Output
`[name]-poc-design.md` using `assets/templates/poc-design.md`

Example: `core-poc-design.md`, `mobile-poc-design.md`

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

## PoC Requirements

Each PoC must be:
- **Atomic**: Proves one specific thing
- **Measurable**: Clear success criteria
- **Self-contained**: Works independently; doesn't break existing functionality and existing tests

**Why self-contained matters:**
- Each PoC is complete within its scope (doesn't need non-dependent PoCs to work)
- System remains functional between PoCs (no breaking changes to existing functionality/tests)
- Prevents cascading failures
- Clearly shows what it proves and what capabilities it opens up for dependent PoCs
- Safe to pause work at any PoC boundary

## PoC Dependency Mapping

Create a diagram showing:
- Which PoCs can run in parallel (no dependencies)
- Which PoCs depend on others
- The critical path to MVP

**Format**: Use boxes for each PoC with clear names. No status indicators (this is a plan, not status tracking).

Example:
```
┌──────────────────────┐              ┌──────────────────────┐
│  PoC 1: Database     │              │  PoC 2: API Server   │
│  Schema              │              │  Basic               │
└──────────┬───────────┘              └──────────┬───────────┘
           │                                     │
           └─────────────────┬───────────────────┘
                             │
                             ▼
                  ┌──────────────────────┐
                  │  PoC 3: CRUD         │
                  │  Operations          │
                  └──────────┬───────────┘
                             │
                 ┌───────────┴───────────┐
                 │                       │
                 ▼                       ▼
      ┌──────────────────────┐   ┌──────────────────────┐
      │  PoC 4: Analytics    │   │  PoC 5: Reports      │
      └──────────┬───────────┘   └──────────┬───────────┘
                 │                           │
                 └───────────┬───────────────┘
                             │
                             ▼
                  ┌──────────────────────┐
                  │  PoC 6: E2E          │
                  │  Integration         │
                  └──────────────────────┘
```

**Key Points**:
- Each PoC gets a box with its name and brief description
- Use vertical flow (top to bottom) for main dependency path
- Show parallel PoCs side by side at the same level
- Use arrows (│ ▼ ─ └ ┌) to show dependencies
- Keep it clean - NO status indicators (✅ ⬜) in the plan diagram


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
