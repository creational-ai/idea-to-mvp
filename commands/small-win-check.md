# Small Win Check

After completing a PoC milestone or taking a break, perform a project health check.

## Files to Review

Scan the project for these artifacts (names may vary by project):

1. **North Star** - `docs/*north-star*.md` or `docs/*vision*.md` - Vision, milestones, success metrics
2. **PoC Plan** - `docs/*poc-plan*.md` or `docs/*poc*.md` - PoC definitions and success criteria
3. **Design** - `docs/*design*.md` - Architecture and end goals
4. **Project State** - `PROJECT_STATE.md` - Current status tracking
5. **PoC Results** - `docs/poc*-results.md` or `docs/*-step*-results.md` - Completed work

If files aren't found, ask the user to identify the relevant documents.

## Assessment Criteria

### 1. Alignment Check
- Are completed PoCs aligned with the North Star vision?
- Does the work support the target architecture?
- Are we on track for current milestone?

### 2. Production Integration
- How will completed PoCs be used by downstream components?
- Are interfaces production-ready or still experimental?

### 3. Gap Analysis
- Are there missing tests or edge cases?
- Are there integration points not yet validated?
- Any ambiguity that should be resolved before proceeding?

### 4. Scope Guard
- Has any work drifted from original intent?
- Are we adding complexity beyond what's needed?

### 5. Test Coverage
- Run tests to verify all pass (e.g., `uv run pytest tests/ -v` or project-specific command)
- Check test counts match expected totals

## Process

### Step 1: Analyze and Assess
Review all files above and assess against the 5 criteria.

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

After updating PROJECT_STATE.md, provide a structured report:

```
## Small Win Check Report

**Date**: [date]
**Project**: [project name]
**Current Stage**: [stage from idea-to-mvp workflow]

### Status Summary
[What's complete, what's in progress]

### Milestone Progress
[Progress toward North Star milestones]

### Alignment Assessment
[On track / Minor concerns / Major concerns]
[Details]

### Identified Gaps
1. [Gap - Priority: High/Medium/Low]
2. [Gap - Priority: High/Medium/Low]

### Recommendations
1. [Next action]
2. [Following action]
```
