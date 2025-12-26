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

**Detailed Instructions**: See `references/stage-4b-poc-implementation.md`

**Template**: `assets/templates/poc-implementation.md`

---

### Overview

⚠️ **ONE PoC AT A TIME** - Only plan the next logical PoC to keep planning agile

✅ **CODE IS ALLOWED** - Unlike Stages 1-4, use concrete code snippets, commands, and configs

⚠️ **PRODUCTION-GRADE THIN SLICES** - Real integrations, not mocks; patterns that scale

---

### Input
- Single PoC from `docs/poc-plan.md` (next in sequence or user-selected)

### Process
See `references/stage-4b-poc-implementation.md` for detailed guidance on:
- Listing prerequisites with setup instructions
- Breaking implementation into bite-sized steps (~30 min each)
- Defining verification for each step
- Including specific code/commands/configs
- Ensuring production-grade quality

### Output

**Two documents** (see detailed rationale in reference doc):

1. **Implementation Plan**: `docs/poc[N]-implementation.md`
   - How to implement (evergreen guide)
   - NO status indicators

2. **Results Tracking**: `docs/poc[N]-results.md`
   - Progress tracking (live status)
   - Test results, issues, bug fixes

### Complete Checklist
- [ ] Both docs created (implementation + results)
- [ ] Prerequisites with setup instructions
- [ ] Steps are independently verifiable
- [ ] Production-grade (real data, real integrations)
- [ ] Implementation doc stays clean (no status)

**Next**: → Stage 5: PoC Execution (for this PoC)

**After PoC Complete**: → Return to Stage 4b for next PoC

---

## Stage 5: PoC Execution

**Goal**: Implement the current PoC one step at a time

**Detailed Instructions**: See `references/stage-5-poc-execution.md`

---

### Overview

⚠️ **ONE STEP AT A TIME** - Implement, test, verify each step before moving to the next

⚠️ **EVERY STEP REQUIRES PYTEST** - Tests must pass before marking step complete

📝 **DOCUMENT AS YOU GO** - Update results doc after each step

---

### Input
- Implementation plan (`docs/poc[N]-implementation.md`)
- Results tracking doc (`docs/poc[N]-results.md`)
- Current step to work on

### Per-Step Workflow

See `references/stage-5-poc-execution.md` for detailed guidance on:
1. Writing implementation code
2. Writing tests (`tests/test_poc[N]_*.py`)
3. Running verification (`uv run pytest`)
4. Updating results doc
5. Updating PROJECT_STATE.md

### Output

**Per step:**
- Implementation code in appropriate modules
- Tests added to `tests/test_poc[N]_*.py`
- Results doc updated with progress

**When PoC complete:**
- All implementation and tests complete
- `docs/poc[N]-results.md` shows all success criteria met

### Verification Checklist

**After each step:**
- [ ] Tests pass
- [ ] Results doc updated
- [ ] PROJECT_STATE.md updated

**After PoC complete:**
- [ ] All tests pass
- [ ] Production-grade checklist verified
- [ ] `/small-win-check` run

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
