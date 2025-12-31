# /dev-execute

Execute the implementation plan step by step with tests.

## What This Does

Stage 3 of dev-cycle: Implement one step at a time with pytest verification.

## Resources

**Read these for guidance**:
- `~/.claude/skills/dev-cycle/SKILL.md` - See "Stage 3: Execution" section
- `~/.claude/skills/dev-cycle/references/3-execution-guide.md` - Detailed process
- `docs/[name]-implementation.md` - The plan to execute
- `docs/[name]-results.md` - Track progress here

## Input

**First argument (required):**
- File path to implementation plan (e.g., `docs/poc6-implementation.md`)
- Work item name (e.g., `poc6`, `feature-x`) → Will look for `docs/[name]-implementation.md`

**Second argument (optional):**
- Step number or identifier (e.g., `3`, `step-3`, `Step 3`)
- If provided: Execute only this specific step
- If omitted: Execute all steps in sequence

**User notes (optional):**
```
{{notes}}
```

**Examples:**
```bash
# Execute all steps in sequence
/dev-execute docs/poc6-implementation.md

# Execute specific step
/dev-execute docs/poc6-implementation.md 3 --notes "Skip database migration for now"

# Using work item name
/dev-execute poc6 step-5
```

**Required files:**
- `docs/[name]-implementation.md` - The plan to execute
- `docs/[name]-results.md` - Will be created if doesn't exist, then updated with progress after each step

## Key Requirements

⚠️ **ONE STEP AT A TIME** - Implement, test, verify, document before moving to next

⚠️ **TESTS REQUIRED** - Every step needs passing pytest tests

📝 **DOCUMENT AS YOU GO** - Update results.md after each step with lessons learned

🏗️ **PRODUCTION-GRADE** - OOP, Pydantic, type hints, real data, error handling

## Process

Follow the guidance in `3-execution-guide.md`:

**First time setup**: If `docs/[name]-results.md` doesn't exist, create it using the template (`assets/templates/implementation-results.md`). Fill in Summary, Goal, Success Criteria (from implementation.md), and Prerequisites. Mark all steps as "Pending".

**Mode 1: Execute all steps in sequence** (no step number provided)
- Start from first incomplete step in results.md
- Execute each step one at a time
- Continue until all steps complete or error occurs

**Mode 2: Execute specific step** (step number provided)
- Jump to the specified step
- Execute only that step
- Useful for retrying failed steps or skipping ahead

**Per step execution:**
1. Write implementation code
2. Write tests (`tests/test_[name]_*.py`)
3. Run pytest verification
4. Update results.md (status + lessons learned)

**Critical:** A step is NOT complete until tests pass and results doc is updated.

## Output

Per step:
- Implementation code files
- Test files (`tests/test_[name]_*.py`)
- Updated `docs/[name]-results.md`

When all steps complete:
- Update `PROJECT_STATE.md`
- Optional: Run `/small-win-check`

## After Completion

Return to Stage 2 for next work item, or continue to next step in current work.
