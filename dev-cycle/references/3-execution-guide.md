# Execution Guide (Stage 3)

## Goal
Implement the current work item one step at a time.

## Code Allowed
YES

## ⚠️ ONE STEP AT A TIME

This stage executes the implementation plan from Stage 2 (Planning):
- Work on Step 1, verify, then Step 2, verify, etc.
- Each step is bite-sized (~30 min max)
- Steps can break into sub-steps: 3a, 3b, 3c
- Document progress in results doc as you go
- Keep implementation doc clean (no status updates there)

## ⚠️ EVERY STEP REQUIRES PYTEST VERIFICATION

A step is NOT complete until:
1. Implementation code exists (in appropriate module/file)
2. Tests exist (`tests/test_[name]_*.py`)
3. All tests pass (`uv run pytest tests/test_[name]_*.py -v`)
4. Results doc updated with step status

## Input
- Implementation plan from Stage 2 (Planning) (`docs/[name]-implementation.md`)
- Results tracking doc (`docs/[name]-results.md`)
- Current step to work on

## Per-Step Workflow

| Phase | Action | Output |
|-------|--------|--------|
| **1. Implement** | Write implementation code | Implementation files in appropriate modules |
| **2. Write Tests** | Cover critical paths + edge cases | `tests/test_[name]_*.py` |
| **3. Verify** | Run pytest | `uv run pytest tests/test_[name]_*.py -v` |
| **4. Document** | Update results doc | `docs/[name]-results.md` (step status + lessons learned) |

## Output (per step)
- Implementation code files — In appropriate modules/directories
- Test files — `tests/test_[name]_*.py` (add tests for this step)
- Update results doc — Mark step complete, add test results, note issues

## Output (when work complete)
- All implementation and test files complete
- `docs/[name]-results.md` — Final status with all success criteria met

## Verification Checkpoints

**After each step:**
- [ ] Implementation code works as expected
- [ ] Tests pass (`uv run pytest tests/test_[name]_*.py -v`)
- [ ] `docs/[name]-results.md` updated with step progress and lessons learned

**After all steps (work complete):**
- [ ] All tests pass
- [ ] `docs/[name]-results.md` shows all success criteria met
- [ ] Production-grade checklist verified

## Implementation Guidelines
- Clear docstrings with usage examples
- Production-grade (real data, real integrations)
- Proper module structure and organization
- Type hints on public methods/functions

## Test Guidelines
- Cover critical paths
- Test edge cases
- Verify outputs match expectations
- Use descriptive test names

## Documentation Guidelines
- Update `docs/[name]-results.md` after each step
- Include: step status (⏳ Pending / ✅ Complete), test results, issues encountered, bug fixes
- **Add "Lessons Learned" section** for each step documenting key insights, patterns, and gotchas
- Keep implementation doc clean (no status updates there)
- Document any design decisions or learnings

## Common Pitfalls
- Skipping tests
- Not documenting as you go (especially lessons learned)
- Steps that are too large
- Ignoring edge cases
- Forgetting to document what you learned from issues/bugs

## Next Stage
→ Return to Stage 2 for next work item (after work complete)
→ MVP complete (when all work items complete)
