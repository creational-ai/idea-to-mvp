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
- Document results as you go

## ⚠️ EVERY STEP REQUIRES A PYTEST VERIFICATION SCRIPT

A step is NOT complete until:
1. Implementation code exists (`PoC/stepN_*.py`)
2. Test script exists (`tests/test_stepN_*.py`)
3. All tests pass (`uv run pytest tests/test_stepN_*.py -v`)

## Input
- Implementation plan from Stage 4b (`docs/pocN-implementation.md`)
- Current step to work on

## Per-Step Workflow

| Phase | Action | Output |
|-------|--------|--------|
| **1. Implement** | Write the step script | `PoC/stepN_[description].py` |
| **2. Write Tests** | Cover critical paths + edge cases | `tests/test_stepN_[description].py` |
| **3. Verify** | Run pytest | `uv run pytest tests/test_stepN_*.py -v` |
| **4. Document** | Write results | `docs/[poc-name]-stepN-results.md` |
| **5. Update State** | Update PROJECT_STATE.md | Run `/small-win-check` if needed |

## Step Naming Convention

| Pattern | Description |
|---------|-------------|
| `step1_[description].py` | First step |
| `step2_[description].py` | Second step |
| `step2_validate_[x].py` | Verification for step 2 |
| `step3a_[description].py` | Sub-step 3a |
| `step3b_[description].py` | Sub-step 3b |
| `step4_1_[alternative].py` | Alternative approach to step 4 |

## Output (per step)
- `PoC/stepN_[description].py` — Implementation
- `tests/test_stepN_[description].py` — Tests
- `docs/[poc-name]-stepN-results.md` — Results

## Output (when PoC complete)
- `docs/pocN-results.md` — Overall PoC results

## Verification Checkpoints

**After each step:**
- [ ] Script runs successfully
- [ ] Tests pass (`uv run pytest tests/test_stepN_*.py -v`)
- [ ] Results documented
- [ ] PROJECT_STATE.md updated

**After all steps (PoC complete):**
- [ ] All step tests pass
- [ ] `docs/pocN-results.md` written
- [ ] Production-grade checklist verified
- [ ] `/small-win-check` run

## Implementation Guidelines
- Clear docstring with usage example
- Self-contained, runnable script
- Production-grade (real data, real integrations)

## Test Guidelines
- Cover critical paths
- Test edge cases
- Verify outputs match expectations

## Documentation Guidelines
- Use `assets/templates/step-results.md` template
- Include: status, metrics, bug fixes, test coverage, commands

## Common Pitfalls
- Skipping tests
- Not documenting as you go
- Steps that are too large
- Ignoring edge cases
- Not updating PROJECT_STATE.md

## Next Stage
→ Return to Stage 4b for next PoC (after PoC complete)
→ Stage 6: MVP (when all PoCs complete)
