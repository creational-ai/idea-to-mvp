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

## User Notes

```
{{notes}}
```

## Key Requirements

⚠️ **ONE STEP AT A TIME** - Implement, test, verify, document before moving to next

⚠️ **TESTS REQUIRED** - Every step needs passing pytest tests

📝 **DOCUMENT AS YOU GO** - Update results.md after each step with lessons learned

🏗️ **PRODUCTION-GRADE** - OOP, Pydantic, type hints, real data, error handling

## Process

Follow the guidance in `3-execution-guide.md`:

Per step:
1. Write implementation code
2. Write tests (`tests/test_[name]_*.py`)
3. Run pytest verification
4. Update results.md (status + lessons learned)

A step is NOT complete until tests pass and results doc is updated.

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
