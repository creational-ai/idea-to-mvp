# Refactor dev-cycle Overview to Design Focus

## Executive Summary

| Attribute | Value |
|-----------|-------|
| **Task** | Refactor dev-cycle Stage 1 from "Overview" to "Design" document |
| **Type** | Refactor |
| **Scope** | dev-cycle skill (templates, guides, commands) |
| **Code** | NO - This is a design document |

**Problem**: The current "overview" document doesn't reflect its true purpose. It's actually a design document that analyzes problems and proposes solutions before implementation planning begins.

**Solution**: Restructure Stage 1 into two distinct sections: (1) Problem Analysis (non-sequential) and (2) Proposed Steps (sequential), with clear separation between understanding and ordering.

---

## Current vs Target State

### Current State

Stage 1 "Overview" mixes problem analysis with step ordering in an unclear structure:
- Executive summary
- Current architecture
- Target architecture
- Scope and changes
- Success criteria
- Approaches (2-4 evaluated)
- Risks
- Design decisions

**Issues**:
- Name "overview" suggests summary, not design work
- Problem analysis and step ordering are interleaved
- No clear separation between "what are the problems" and "how do we sequence the solution"

### Target State

Stage 1 "Design" with two clearly separated sections:

**Part A: Problem Analysis** (Non-Sequential)
- Each problem/issue gets its own subsection
- Analyzed independently - no implied order
- Includes: what's wrong, why it matters, solution approach
- NO CODE - concepts and reasoning only

**Part B: Proposed Steps** (Sequential)
- Synthesizes Part A into ordered implementation steps
- Logical flow that makes sense as a whole
- Dependencies and sequencing made explicit
- Still NO CODE - just the ordering and rationale

---

## Problem Analysis

### Problem 1: Misleading Document Name

**What's Wrong**: "Overview" suggests a high-level summary or introduction. But Stage 1 is actually the core design work - analyzing problems and designing solutions.

**Why It Matters**: Users may skip or undervalue Stage 1, thinking it's optional context-setting rather than essential design work.

**Solution Approach**: Rename from "overview" to "design" throughout:
- Template: `overview.md` → `design.md`
- Output file: `*-overview.md` → `*-design.md`
- Command: `/dev-overview` → `/dev-design` (or keep for backward compat with alias)
- Guide: `1-overview-guide.md` → `1-design-guide.md`
- SKILL.md: Update Stage 1 section header and references

---

### Problem 2: Interleaved Problem/Solution Structure

**What's Wrong**: Current template mixes problem identification with step ordering. "Current Architecture" flows into "Target Architecture" flows into "Scope" - but the individual problems and their solutions are not clearly separated.

**Why It Matters**:
- Hard to verify all problems are addressed
- Hard to see which step solves which problem
- Traceability is weak

**Solution Approach**: Create two distinct sections with clear visual separation:

**Section: Problem Analysis**
- Heading for each distinct problem/issue
- Each contains: What, Why, How (approach)
- Non-sequential - can be read in any order
- Acts as a "problem registry" for the task

**Section: Proposed Steps**
- Ordered list synthesizing from Problem Analysis
- Each step references which problem(s) it addresses
- Shows logical flow and dependencies
- Provides rationale for the ordering

---

### Problem 3: Gap Between Design and Implementation Plan

**What's Wrong**: Current flow is Overview → Implementation Plan. The implementation plan has to figure out sequencing AND details at the same time.

**Why It Matters**: Implementation planning is overloaded - it does too much. Sequencing should happen in design phase.

**Solution Approach**:
- Design doc (Stage 1) ends with Proposed Steps - the sequencing is done
- Implementation Plan (Stage 2) takes Proposed Steps as input and validates/details them
- Clear handoff: "Here are the steps" → "Are these steps sound and what's the code?"

---

### Problem 4: Template Structure Needs Reorganization

**What's Wrong**: Current template sections don't support the two-part structure (Problem Analysis + Proposed Steps).

**Why It Matters**: Template drives behavior. If template doesn't have the right sections, users won't produce the right output.

**Solution Approach**: New template structure:

```markdown
# [Task Name] Design

## Executive Summary
(Brief: what task is, key problems, proposed approach)

## Context
(Current state, why this matters, constraints)

---

## Problem Analysis

### [Problem 1 Name]
**What**: Description of the issue
**Why**: Impact and importance
**Approach**: How we'll solve it (NO CODE)

### [Problem 2 Name]
...

### [Problem N Name]
...

---

## Proposed Steps

Based on the problem analysis above, here is the proposed implementation sequence:

### Step 1: [Name]
**Addresses**: Problem 1, Problem 3
**What**: What this step accomplishes
**Why Here**: Why this step comes first/at this position
**Dependencies**: What must exist before this step

### Step 2: [Name]
...

---

## Success Criteria
(How we know this task is complete)

## Risks
(What could go wrong)

## Open Questions
(Unresolved items - may block or inform steps)
```

---

### Problem 5: Guide Needs Update

**What's Wrong**: `1-overview-guide.md` explains the current structure which will change.

**Why It Matters**: Guide is the detailed process reference. Must match new template.

**Solution Approach**: Update guide to:
- Explain the two-section structure
- Emphasize non-sequential nature of Problem Analysis
- Explain how to synthesize Proposed Steps from analysis
- Clarify NO CODE rule applies to both sections
- Show examples of good problem analysis entries
- Show examples of good proposed step entries

---

### Problem 6: Command and File Naming

**What's Wrong**: `/dev-overview` and `*-overview.md` filenames don't match new "design" terminology. Also, Stage 2 uses `*-implementation.md` which is verbose.

**Why It Matters**: Consistency between concepts and artifacts.

**Solution Approach** (DECIDED):

| Stage | Current | New |
|-------|---------|-----|
| 1 | `/dev-overview` → `*-overview.md` | `/dev-design` → `*-design.md` |
| 2 | `/dev-plan` → `*-implementation.md` | No change |
| 3 | `/dev-execute` → `*-results.md` | No change |

**Renames Required** (Stage 1 only):
- Command: `commands/dev-overview.md` → `commands/dev-design.md`
- Command: `commands/agent-dev-overview.md` → `commands/agent-dev-design.md`
- Agent: `agents/dev-overview-agent.md` → `agents/dev-design-agent.md`
- Template: `assets/templates/overview.md` → `assets/templates/design.md`
- Output: `*-overview.md` → `*-design.md`
- Guide: `references/1-overview-guide.md` → `references/1-design-guide.md`

---

## Proposed Steps

Based on the problem analysis above, here is the proposed implementation sequence:

### Step 1: Create New Template Structure

**Addresses**: Problem 4 (Template Structure)
**What**: Create new `design.md` template with Problem Analysis + Proposed Steps sections.
**Why First**: Template is the foundation - drives all other changes
**Dependencies**: None

**Files**:
- Create: `assets/templates/design.md` ✅
- Delete: `assets/templates/overview.md` ✅

### Step 2: Update SKILL.md Stage 1 Section

**Addresses**: Problem 1 (Misleading Name), Problem 2 (Interleaved Structure)
**What**: Rename Stage 1 from "Overview" to "Design", update description for two-section structure (Problem Analysis + Proposed Steps)
**Why Here**: SKILL.md is source of truth, must reflect new structure before guide
**Dependencies**: Step 1 (template exists to reference)

### Step 3: Update Reference Guide

**Addresses**: Problem 5 (Guide Needs Update)
**What**: Rename `1-overview-guide.md` → `1-design-guide.md`, rewrite for new two-section structure (Problem Analysis + Proposed Steps)
**Why Here**: Guide must match SKILL.md and template
**Dependencies**: Step 1, Step 2

### Step 4: Update Command and Agent Definitions

**Addresses**: Problem 6 (Command Naming)
**What**:
- Rename `commands/dev-overview.md` → `commands/dev-design.md`
- Rename `commands/agent-dev-overview.md` → `commands/agent-dev-design.md`
- Rename `agents/dev-overview-agent.md` → `agents/dev-design-agent.md`
**Why Here**: Commands reference templates and guides, so they must exist first
**Dependencies**: Step 1, Step 2, Step 3

### Step 5: Update Cross-References

**Addresses**: All problems (consistency)
**What**: Update all remaining references to "overview" → "design" in dev-cycle skill.

**Files containing "overview" references** (17 files):
- `SKILL.md` - Stage 1 section, references throughout
- `references/verify-doc-guide.md` - doc type patterns
- `references/1-design-guide.md` - (already renamed in Step 3)
- `references/2-planning-guide.md` - input references
- `references/3-execution-guide.md` - stage flow references
- `references/diagram-guide.md` - doc references
- `references/milestone-details-guide.md` - doc references
- `assets/templates/milestone-details.md` - doc references
- `commands/dev-plan.md` - input from Stage 1
- `commands/dev-execute.md` - stage flow
- `commands/verify-doc.md` - doc patterns
- `commands/agent-dev-plan.md` - input references
- `commands/agent-verify-doc.md` - doc patterns
- `agents/dev-plan-agent.md` - input references
- `agents/dev-execute-agent.md` - stage flow
- `agents/milestone-details-agent.md` - doc references
- `agents/verify-doc-agent.md` - doc patterns
- `docs/design.md` - meta-doc for skill (update terminology)

**Why Here**: Cleanup after main structural changes
**Dependencies**: Steps 1-4

### Step 6: Update CLAUDE.md

**Addresses**: Problem 1 (consistency with project docs)
**What**: Update file naming conventions and command list in project CLAUDE.md
**Why Here**: Project-level documentation must match skill changes
**Dependencies**: Steps 1-5

### Step 7: Deploy and Verify

**Addresses**: All (validation)
**What**: Run deploy.sh, run verify.sh, confirm all files renamed correctly
**Why Last**: Validates all changes work together
**Dependencies**: Steps 1-6

---

## Success Criteria

- [ ] New template has clear Problem Analysis and Proposed Steps sections
- [ ] SKILL.md Stage 1 renamed and restructured
- [ ] Guide explains two-section structure with examples
- [ ] Command references updated
- [ ] All cross-references updated (no orphan "overview" references)
- [ ] CLAUDE.md updated
- [ ] Deploy and verify pass
- [ ] Stage 2 (Implementation Plan) clearly receives Proposed Steps as input

---

## Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Breaking existing projects using old file names | Medium | Low | Old files still work, just naming convention change |
| Confusion during transition | Low | Low | Clear changelog in commit message |
| Over-engineering the template | Medium | Medium | Keep it simple - two sections, clear headers |

---

## Open Questions

1. ~~**Command name**: Should we rename `/dev-overview` to `/dev-design-task` or keep as alias?~~ **DECIDED**: `/dev-design`
2. ~~**File suffix**: Is `-design.md` clear enough?~~ **DECIDED**: Yes, `*-design.md`
3. **Migration**: Should we provide a migration note for existing projects using old file names?

## Decisions Log

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Stage 1 command | `/dev-design` | Clear, fits `/dev-*` namespace |
| Stage 1 output | `*-design.md` | Matches command, describes purpose |
| Stage 2 & 3 | No change | Keep `*-implementation.md` and `*-results.md` |
