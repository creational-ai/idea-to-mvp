# Idea-to-MVP Skill

Structured workflow for taking ideas from concept to working product.

## Stage Overview

| Stage | Code Allowed? | Output |
|-------|---------------|--------|
| 1. Concept | ❌ NO | North Star doc |
| 2. Design | ❌ NO | Design doc, architecture |
| 3. Research | ❌ NO | Market analysis, validation |
| 4. PoC Planning | ❌ NO | PoC plan, dependency map |
| 4b. PoC Implementation Planning | ✅ YES | Per-PoC implementation plan (ONE at a time) |
| 5. PoC Execution | ✅ YES | Working code + tests |
| 6. MVP | ✅ YES | Working product |

---

## ⛔ CRITICAL: NO-CODE STAGES (1-4)

**Stages 1, 2, 3, and 4 are strictly NO-CODE zones.**

(Stage 4b is where code becomes allowed — see below)

### What IS allowed in Stages 1-4:
- High-level architecture diagrams
- Data flow descriptions
- Workflow descriptions
- Concept explanations
- Pseudocode for complex logic (sparingly)
- API contract descriptions (endpoints, payloads)
- Technology stack decisions with rationale

### What is NOT allowed in Stages 1-4:
- Python/JavaScript/any implementation code
- Function definitions
- Class implementations
- Code snippets that could be copy-pasted
- "Here's how you'd implement this..." with actual code

### Why This Matters:
- Preserves token space for what matters: thinking and design
- Prevents premature implementation decisions
- Forces clear conceptual understanding before coding

### If Asked to Write Code in Stages 1-4:
Respond: "We're in the [Concept/Design/Research/PoC Planning] stage — let's keep focus on [architecture/design/validation/planning]. Code comes in Stage 4b (Implementation Planning) and Stage 5 (Execution). For now, let me describe how this would work at a high level..."

---

## ✅ CODE ALLOWED: Stages 4b, 5, 6

**Stage 4b (PoC Implementation Planning)**: Code snippets, configs, commands — the specific "how"
**Stage 5 (PoC Execution)**: Full implementation with tests
**Stage 6 (MVP)**: Integration and completion

---

## Stage 1: Concept

**Goal**: Refine the idea into a clear, feasible concept

**Input**: Idea (verbal, notes, rough sketch)

**Template**: `assets/templates/north-star.md`

**Process**:
1. Understand the core problem being solved
2. Define how it would work (high-level)
3. Identify key components and their relationships
4. Surface assumptions and unknowns

**Output**: `docs/north-star.md`

### Stage 1 Complete Checklist
- [ ] `docs/north-star.md` created using template
- [ ] Problem clearly stated
- [ ] Solution approach makes sense
- [ ] Technical feasibility seems reasonable
- [ ] No obvious blockers identified

**Next**: → Stage 2: Design

---

## Stage 2: Design

**Goal**: Create technical architecture and integration plan

**Input**: Concept doc (`docs/north-star.md`)

**Template**: `assets/templates/design.md`

**Process**:
1. Define system architecture
2. Identify technology stack
3. Map data flows
4. Design component interactions
5. Identify integration points

**Output**: `docs/design.md`

### Stage 2 Complete Checklist
- [ ] `docs/design.md` created using template
- [ ] Architecture diagram complete
- [ ] Tech stack justified
- [ ] Data flows documented
- [ ] Integration points identified
- [ ] No code written (only diagrams and descriptions)
- [ ] Run `/verify-doc docs/design.md`

**Next**: → Stage 3: Research

---

## Stage 3: Research

**Goal**: Validate market fit and competitive landscape

**Input**: Design doc (`docs/design.md`)

**Process**:
1. Research competitors
2. Identify market gaps
3. Validate pricing assumptions
4. Assess technical differentiation
5. Multiple research passes to fine-tune

**Output**: Updates to concept + design docs, market analysis

### Fast-Track Option

If research already exists (from prior sessions, reference docs, or external sources):
1. Review existing research docs for coverage
2. Verify all checklist items are addressed
3. Note source: "Research validated via [reference docs]"
4. Proceed to Stage 4

### Stage 3 Complete Checklist
- [ ] Competitors identified with strengths/weaknesses
- [ ] Market gap clearly articulated
- [ ] Differentiation strategy defined
- [ ] Pricing validated against market (if applicable)
- [ ] Go/no-go decision supported by evidence

**Next**: → Stage 4: PoC Planning

---

## Stage 4: PoC Planning

**Goal**: Define what needs to be proven and in what order — with PRODUCTION-GRADE thin slices

**Input**: Validated design docs (copied to `docs/` folder)

**Template**: `assets/templates/poc-plan.md`

**Process**:
1. Refine design with implementation perspective
2. Identify atomic things to prove (PoCs)
3. Map dependencies between PoCs
4. Create PoC diagram
5. Define success criteria for each PoC
6. Create initial PROJECT_STATE.md

**Output**:
- `docs/poc-plan.md`
- `PROJECT_STATE.md` (initial creation)

### Stage 4 Complete Checklist
- [ ] `docs/poc-plan.md` created using template
- [ ] Each PoC proves one specific thing
- [ ] Dependencies mapped (which PoCs unlock others)
- [ ] Success criteria measurable
- [ ] Order of execution clear
- [ ] `PROJECT_STATE.md` created with initial state
- [ ] Run `/verify-doc docs/poc-plan.md`

**Next**: → Stage 4b: PoC Implementation Planning (per PoC)

---

## Stage 4b: PoC Implementation Planning

**Goal**: Break the NEXT PoC into bite-sized, production-grade implementation steps

**Template**: `assets/templates/poc-implementation.md`

⚠️ **ONE PoC AT A TIME**

Only generate implementation plan for:
- The next logical PoC (based on dependency graph), OR
- The PoC you explicitly choose

**Why one at a time?**
- Learnings from one PoC often change subsequent PoCs
- Keeps planning nimble and agile
- Avoids wasted effort on plans that become obsolete

---

✅ **CODE IS ALLOWED IN STAGE 4b**

Unlike Stages 1-4, implementation planning gets into specifics:
- Concrete code snippets for each step
- Specific function signatures
- Exact commands to run
- Configuration examples
- Test code structure

This is the bridge between "what we want to build" and "actually building it."

---

⚠️ **CRITICAL: Production-Grade Thin Slices**

A PoC is NOT:
- Mock data that simulates behavior
- Hardcoded responses
- Toy examples that don't reflect real usage
- Code that "works" but can't evolve into production

A PoC IS:
- A thin vertical slice of production architecture
- Real integrations (actual Supabase, actual AWS, actual APIs)
- Code that could ship (with more features added)
- Patterns that scale to full implementation

**Input**: Single PoC from poc-plan.md (the next one or user-selected)

**Process**:
1. List all prerequisites (setup Supabase, configure AWS, API keys, etc.)
2. Break implementation into bite-sized steps (max 30 min each)
3. Define verification for EACH step (not just end result)
4. Include specific code snippets, commands, configs
5. Identify what makes this "production-grade" vs "demo"

**Output**: `docs/pocN-implementation.md` using template

### Stage 4b Complete Checklist
- [ ] Prerequisites explicitly listed with setup instructions
- [ ] Each step is small enough to verify independently
- [ ] Each step has clear verification criteria (with code)
- [ ] No step relies on mock data where real data is needed
- [ ] Implementation would work in production context

**Next**: → Stage 5: PoC Execution (for this PoC)

**After PoC Complete**: → Return to Stage 4b for next PoC

---

## Stage 5: PoC Execution

**Goal**: Implement the current PoC one step at a time

⚠️ **ONE STEP AT A TIME**

This stage executes the implementation plan from Stage 4b:
- Work on Step 1, verify, then Step 2, verify, etc.
- Each step is bite-sized (~30 min max)
- Steps can break into sub-steps: 3a, 3b, 3c
- Every step has pytest verification
- Document results as you go

---

### Step Naming Convention

| Pattern | Description |
|---------|-------------|
| `step1_[description].py` | First step |
| `step2_[description].py` | Second step |
| `step2_validate_[x].py` | Verification for step 2 |
| `step3a_[description].py` | Sub-step 3a |
| `step3b_[description].py` | Sub-step 3b |
| `step4_1_[alternative].py` | Alternative approach to step 4 |

---

### Per-Step Workflow

| Phase | Action | Output |
|-------|--------|--------|
| **1. Implement** | Write the step script | `PoC/stepN_[description].py` |
| **2. Write Tests** | Cover critical paths + edge cases | `tests/test_stepN_[description].py` |
| **3. Verify** | Run pytest | `uv run pytest tests/test_stepN_*.py -v` |
| **4. Document** | Write results | `docs/[poc-name]-stepN-results.md` |
| **5. Update State** | Update PROJECT_STATE.md | Run `/small-win-check` if needed |

**Implementation Guidelines:**
- Clear docstring with usage example
- Self-contained, runnable script
- Production-grade (real data, real integrations)

**Test Guidelines:**
- Cover critical paths
- Test edge cases
- Verify outputs match expectations

**Documentation Guidelines:**
- Use `assets/templates/step-results.md` template
- Include: status, metrics, bug fixes, test coverage, commands

---

### Input
- Implementation plan from Stage 4b (`docs/pocN-implementation.md`)
- Current step to work on

### Output (per step)
- `PoC/stepN_[description].py` — Implementation
- `tests/test_stepN_[description].py` — Tests
- `docs/[poc-name]-stepN-results.md` — Results (use template)

### Output (when PoC complete)
- `docs/pocN-results.md` — Overall PoC results

---

### Verification Checkpoints

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

---

**Next after PoC complete**: → Return to Stage 4b for next PoC

---

## Stage 6: MVP

**Goal**: Combine proven PoCs into working product

**Input**: All completed PoCs

**Process**:
1. MVP often emerges naturally from PoCs
2. Integrate proven components
3. Add remaining glue code
4. Comprehensive testing

**Output**: Working MVP

### Stage 6 Complete Checklist
- [ ] Core functionality works end-to-end
- [ ] Tests pass
- [ ] Matches north star vision

---

## Small Win Check Protocol

Run `/small-win-check` anytime:
- After completing a PoC milestone
- Mid-PoC when taking a break
- When wrapping up for the day
- When feeling uncertain about direction

**Reads**:
- `docs/north-star.md`
- `docs/poc-plan.md`
- `docs/design.md`
- `docs/poc*-results.md`
- `PROJECT_STATE.md`

**Assesses**:
1. Alignment with North Star vision
2. Production integration readiness
3. Gap analysis (missing tests, edge cases)
4. Scope guard (drift from original intent)
5. Test coverage verification

**Output**: Structured report with status, progress, gaps, recommendations

**After small-win-check**: Update PROJECT_STATE.md with findings
