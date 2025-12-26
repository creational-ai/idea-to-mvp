# Stage 5: PoC Execution

## Goal
Implement the current PoC one step at a time.

## Code Allowed
YES

## ⚠️ ONE STEP AT A TIME

This stage executes the implementation plan from Stage 4b:
- Work on Step 1, verify, then Step 2, verify, etc.
- Each step is bite-sized (~30 min max)
- Steps can break into sub-steps: 3a, 3b, 3c
- Document progress in results doc as you go
- Keep implementation doc clean (no status updates there)

## ⚠️ EVERY STEP REQUIRES PYTEST VERIFICATION

A step is NOT complete until:
1. Implementation code exists (in appropriate module/file)
2. Tests exist (`tests/test_poc[N]_*.py`)
3. All tests pass (`uv run pytest tests/test_poc[N]_*.py -v`)
4. Results doc updated with step status

## Input
- Implementation plan from Stage 4b (`docs/poc[N]-implementation.md`)
- Results tracking doc (`docs/poc[N]-results.md`)
- Current step to work on

## Per-Step Workflow

| Phase | Action | Output |
|-------|--------|--------|
| **1. Implement** | Write implementation code | Implementation files in appropriate modules |
| **2. Write Tests** | Cover critical paths + edge cases | `tests/test_poc[N]_*.py` |
| **3. Verify** | Run pytest | `uv run pytest tests/test_poc[N]_*.py -v` |
| **4. Document** | Update results doc | `docs/poc[N]-results.md` (update step status) |
| **5. Update State** | Update PROJECT_STATE.md | Run `/small-win-check` if needed |

## Output (per step)
- Implementation code files — In appropriate modules/directories
- Test files — `tests/test_poc[N]_*.py` (add tests for this step)
- Update results doc — Mark step complete, add test results, note issues

## Output (when PoC complete)
- All implementation and test files complete
- `docs/poc[N]-results.md` — Final status with all success criteria met

## Verification Checkpoints

**After each step:**
- [ ] Implementation code works as expected
- [ ] Tests pass (`uv run pytest tests/test_poc[N]_*.py -v`)
- [ ] `docs/poc[N]-results.md` updated with step progress
- [ ] PROJECT_STATE.md updated

**After all steps (PoC complete):**
- [ ] All PoC tests pass
- [ ] `docs/poc[N]-results.md` shows all success criteria met
- [ ] Production-grade checklist verified
- [ ] `/small-win-check` run

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
- Update `docs/poc[N]-results.md` after each step
- Include: step status (⏳ Pending / ✅ Complete), test results, issues encountered, bug fixes
- Keep implementation doc clean (no status updates there)
- Document any design decisions or learnings

## Common Pitfalls
- Skipping tests
- Not documenting as you go
- Steps that are too large
- Ignoring edge cases
- Not updating PROJECT_STATE.md

## Next Stage
→ Return to Stage 4b for next PoC (after PoC complete)
→ Stage 6: MVP (when all PoCs complete)
