# Blueprint Skill

Structured workflow for taking ideas from concept to executable PoC plan.

**Philosophy**: blueprint handles the **planning phase** (0 to 1). Once you have a PoC plan, hand off to the **dev-cycle skill** for the **development loop** (1 to N).

## Stage Overview

| Stage | Output |
|-------|--------|
| 1. Concept | `north-star.md` |
| 2. Design | `[idea]-design.md` |
| 3. Research | Market analysis, validation |
| 4. PoC Planning | `[idea]-poc-plan.md` |

**Next**: → Hand off to `dev-cycle` skill for implementation

---

## ⛔ CRITICAL: NO-CODE SKILL

**All stages (1-4) are strictly NO-CODE zones.**

### What IS allowed:
- High-level architecture diagrams
- Data flow descriptions
- Workflow descriptions
- Concept explanations
- Pseudocode for complex logic (sparingly)
- API contract descriptions (endpoints, payloads)
- Technology stack decisions with rationale

### What is NOT allowed:
- Python/JavaScript/any implementation code
- Function definitions
- Class implementations
- Code snippets that could be copy-pasted
- "Here's how you'd implement this..." with actual code

### Why This Matters:
- Preserves token space for what matters: thinking and design
- Prevents premature implementation decisions
- Forces clear conceptual understanding before coding

### If Asked to Write Code:
Respond: "We're in the [Concept/Design/Research/PoC Planning] stage — let's keep focus on [architecture/design/validation/planning]. Code comes later in the dev-cycle skill. For now, let me describe how this would work at a high level..."

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

**Output**: `north-star.md` (in project root or docs/)

### Stage 1 Complete Checklist
- [ ] `north-star.md` created using template
- [ ] Problem clearly stated
- [ ] Solution approach makes sense
- [ ] Technical feasibility seems reasonable
- [ ] No obvious blockers identified

**Next**: → Stage 2: Design

---

## Stage 2: Design

**Goal**: Create technical architecture and integration plan

**Input**: Concept doc (`north-star.md`)

**Template**: `assets/templates/design.md`

**Naming**: `[idea]-design.md` where `[idea]` is the idea/track name from your mission control

**Process**:
1. Define system architecture
2. Identify technology stack
3. Map data flows
4. Design component interactions
5. Identify integration points

**Output**: `[idea]-design.md` (e.g., `core-design.md`, `mobile-design.md`)

### Stage 2 Complete Checklist
- [ ] `[idea]-design.md` created using template
- [ ] Architecture diagram complete
- [ ] Tech stack justified
- [ ] Data flows documented
- [ ] Integration points identified
- [ ] No code written (only diagrams and descriptions)
- [ ] Run `/verify-doc [idea]-design.md`

**Next**: → Stage 3: Research

---

## Stage 3: Research

**Goal**: Validate market fit and competitive landscape

**Input**: Design doc (`[idea]-design.md`)

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

**Input**: Validated design doc (`[idea]-design.md`)

**Template**: `assets/templates/poc-plan.md`

**Naming**: `[idea]-poc-plan.md` where `[idea]` matches your design doc prefix

**Process**:
1. Refine design with implementation perspective
2. Identify atomic things to prove (PoCs)
3. Map dependencies between PoCs
4. Create PoC diagram
5. Define success criteria for each PoC

**PoC Requirements**:

Each PoC must be:
- **Atomic**: Proves one specific thing
- **Measurable**: Clear success criteria
- **🔒 Self-contained**: Works independently; doesn't break existing functionality and existing tests

**Output**: `[idea]-poc-plan.md` (e.g., `core-poc-plan.md`, `mobile-poc-plan.md`)

### Stage 4 Complete Checklist
- [ ] `[idea]-poc-plan.md` created using template
- [ ] Each PoC proves one specific thing
- [ ] Dependencies mapped (which PoCs unlock others)
- [ ] Success criteria measurable
- [ ] Order of execution clear
- [ ] Run `/verify-doc [idea]-poc-plan.md`

**Next**: → Hand off to **dev-cycle skill** for implementation

---

## Development with dev-cycle Skill

Once you have `[idea]-poc-plan.md` completed, hand off to the **dev-cycle** skill for the development loop.

### The dev-cycle Loop

**dev-cycle** handles all implementation work through a 3-stage repeating cycle:

**1. Stage 1: Overview** (`/dev-overview`)
- **When**: New features/bugs/issues emerge during development
- **What**: Analyze and design how to address them
- **Output**: `docs/[name]-overview.md`, updated `[idea]-poc-plan.md`

**2. Stage 2: Implementation Plan** (`/dev-plan`)
- **When**: Ready to work on next item from `[idea]-poc-plan.md`
- **What**: Break work item into bite-sized implementation steps
- **Output**: `docs/[name]-implementation.md`, `docs/[name]-results.md`

**3. Stage 3: Execution** (`/dev-execute`)
- **When**: Implementation plan is ready
- **What**: Implement step by step with tests
- **Output**: Code, tests, updated `PROJECT_STATE.md`

**Repeat**: Pick next work item → Plan → Execute → Repeat forever

### Key Principles

- **Self-contained work items**: Each item works independently, doesn't break existing functionality/tests
- **Production-grade code**: OOP, Pydantic models, type hints, real data
- **Test-driven**: Every step requires passing tests
- **Document as you go**: Update results docs with lessons learned after each step

### Commands

```bash
/dev-overview <notes>    # Analyze new features/issues (Stage 1)
/dev-plan <notes>        # Plan next work item (Stage 2)
/dev-execute <notes>     # Execute implementation plan (Stage 3)
/small-win-check         # Health check (optional, after work completion)
```

### Integration Flow

**blueprint creates**:
- `north-star.md` - Vision and goals (one per project)
- `[idea]-design.md` - Architecture (one per idea/track)
- `[idea]-poc-plan.md` - Work items to implement

**dev-cycle reads**:
- `[idea]-poc-plan.md` - What to work on
- `[idea]-design.md` - Architecture context
- `north-star.md` - Vision alignment

**dev-cycle creates**:
- `PROJECT_STATE.md` - Work item tracking (first time only)
- `docs/[name]-implementation.md` - How to implement (evergreen)
- `docs/[name]-results.md` - Progress tracking (live status)
- Test files - `tests/test_[name]_*.py`
- Implementation code

**dev-cycle updates**:
- `[idea]-poc-plan.md` - Add new work items as they emerge
- `PROJECT_STATE.md` - Track progress after each work item

### Workflow Example

```
1. blueprint: Create north-star.md, core-design.md, core-poc-plan.md
2. /dev-plan: Plan first PoC from core-poc-plan.md
3. /dev-execute: Implement first PoC step by step
4. /dev-plan: Plan second PoC
5. /dev-execute: Implement second PoC
6. /dev-overview: New issue discovered, add to core-poc-plan.md
7. /dev-plan: Plan the new work item
8. /dev-execute: Implement it
9. Repeat...
```

---

## Reference Guides

For detailed guidance on each stage, see:
- `references/1-concept-guide.md` - Stage 1 process
- `references/2-design-guide.md` - Stage 2 process
- `references/3-research-guide.md` - Stage 3 process
- `references/4-poc-planning-guide.md` - Stage 4 process

For dev-cycle guidance, see:
- `~/.claude/skills/dev-cycle/SKILL.md` - Full dev-cycle workflow
- `~/.claude/skills/dev-cycle/references/1-overview-guide.md` - Stage 1 process
- `~/.claude/skills/dev-cycle/references/2-planning-guide.md` - Stage 2 process
- `~/.claude/skills/dev-cycle/references/3-execution-guide.md` - Stage 3 process
