# Small Win Check Protocol

## When to Run

Run `/small-win-check` anytime:
- After completing a PoC milestone
- Mid-PoC when taking a break
- When wrapping up for the day
- When feeling uncertain about direction

## What It Reads

- `docs/*-north-star.md`
- `docs/*-poc-plan.md`
- `docs/*-design.md`
- `docs/poc*-results.md`
- `PROJECT_STATE.md`

## What It Assesses

### 1. North Star Alignment
- Are we still building toward the original vision?
- Have we drifted from the core problem?
- Do recent decisions support the end goal?

### 2. Production Integration Readiness
- Is the code production-grade?
- Are we using real integrations (not mocks)?
- Would this scale?

### 3. Gap Analysis
- Missing tests?
- Unhandled edge cases?
- Documentation gaps?
- Technical debt accumulating?

### 4. Scope Guard
- Have we added unplanned features?
- Are we over-engineering?
- Is complexity justified?

### 5. Test Coverage Verification
- Do tests exist for completed steps?
- Are tests passing?
- Are critical paths covered?

## Output Format

```markdown
## Small Win Check Report

**Date**: [Date]
**Current Stage**: [Stage]
**Current PoC**: [PoC name]
**Current Step**: [Step]

### ✅ Wins
- [What's going well]
- [Progress made]

### ⚠️ Concerns
- [Potential issues]
- [Drift detected]

### 🔍 Gaps
- [Missing tests]
- [Undocumented decisions]

### 📋 Recommendations
1. [Action item]
2. [Action item]

### 🎯 North Star Check
[Still aligned? / Drifting? / Need to revisit?]
```

## After Small-Win-Check

Update `PROJECT_STATE.md` with:
- Findings from the check
- Any decisions made
- Updated "What's Next"

## Frequency Guidelines

| Situation | Frequency |
|-----------|-----------|
| Active development | Every 2-3 steps |
| End of session | Always |
| Feeling uncertain | Immediately |
| After major decision | Always |
| Completing a PoC | Always |
