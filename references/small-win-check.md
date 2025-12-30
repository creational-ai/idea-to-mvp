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

## Process

### Step 1: Analyze
Review all documents against the 5 assessment criteria above.

### Step 2: Update PROJECT_STATE.md
**Before generating the report**, update `PROJECT_STATE.md` with findings:

1. Add a new entry under "Health Checks" or "Small Win Checks" section
2. Include date, summary of findings, and key recommendations
3. Update "Current Status" if alignment issues or gaps were found
4. Document any decisions made based on the check

**Example update:**
```markdown
## Health Checks

### [Date] - Small Win Check
**Status**: ✅ On Track / ⚠️ Minor Concerns / ❌ Needs Attention

**Findings**:
- [Summary of alignment, gaps, concerns]

**Actions Taken**:
- [Any immediate actions or decisions]

**Next**: [What to focus on next]
```

### Step 3: Generate Final Report

After updating PROJECT_STATE.md, provide this structured report:

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

## Frequency Guidelines

| Situation | Frequency |
|-----------|-----------|
| Active development | Every 2-3 steps |
| End of session | Always |
| Feeling uncertain | Immediately |
| After major decision | Always |
| Completing a PoC | Always |
