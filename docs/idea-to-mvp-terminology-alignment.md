# idea-to-mvp Terminology Alignment

**Created:** January 2, 2026  
**Purpose:** Define the complete idea-to-mvp workflow for Claude Code skills

---

## Executive Summary

This document defines the idea-to-mvp workflow: a 5-stage design process split across Claude Desktop (exploration) and Claude Code (structured execution).

**Key Decisions:**
- 5 stages: North Star → Architecture → Research → Milestone Design → PoC Design
- Claude Desktop for stages 1-3 (free-form exploration)
- Claude Code for stages 3-5 (template-driven)
- **Every project has milestones** - minimum 1 (Core), add more organically
- "Milestone" for strategic grouping (10-20 PoCs each)
- "PoC" for atomic work proving one thing
- dev-cycle uses "Task" as universal work unit (PoC/feature/bug)

---

## Workflow Overview

### Environment Split

| Stage | Where | Style |
|-------|-------|-------|
| 1. North Star | **Claude Desktop** | Free-form, exploratory |
| 2. Architecture | **Claude Desktop** | Free-form, decisions |
| 3. Research | **Claude Desktop** | Free-form, validation |
| ↓ | *Bring to Claude Code* | *Refine with templates* |
| 3. Research | **Claude Code** | Optional, structured |
| 4. Milestone Design | **Claude Code** | Template-driven |
| 5. PoC Design | **Claude Code** | Template-driven |

### Why This Split?

**Claude Desktop (Stages 1-3):**
- Conversational exploration
- "What if..." discussions
- Quick iteration on ideas
- No file structure constraints
- Dream big, refine later

**Claude Code (Stages 3-5):**
- Structured templates & skills
- File creation & organization
- Specific instructions per stage
- Ready for implementation
- Precision and consistency

**Note**: Stage 3 (Research) can happen in either environment - start free-form in Desktop, optionally refine in Code.

---

## The 5 Stages

```
┌─────────────────────────────────────┐
│         Claude Desktop              │
│                                     │
│  Stage 1: North Star                │
│  → Final vision (all bells &        │
│     whistles, dream big)            │
│                                     │
│  Stage 2: Architecture              │
│  → How to build it (tech stack,     │
│     patterns, decisions)            │
│                                     │
│  Stage 3: Research                  │
│  → Validate unknowns (APIs, libs,   │
│     feasibility)                    │
│                                     │
└──────────────┬──────────────────────┘
               │
               │  Bring docs to Claude Code
               │  Refine with templates
               │
               ▼
┌─────────────────────────────────────┐
│          Claude Code                │
│           dev-design                │
│                                     │
│  Stage 3: Research (optional)       │
│  → Structured research if needed    │
│                                     │
│  Stage 4: Milestone Design (NEW)    │
│  → Every project starts with        │
│     Milestone 1: Core               │
│  → Add more milestones organically  │
│                                     │
│  Stage 5: PoC Design                │
│  → Break ONE milestone into PoCs    │
│  → Run once per milestone           │
│                                     │
└──────────────┬──────────────────────┘
               │
               │  dev-cycle for execution
               │
               ▼
```

---

## Stage Details

### Stage 1: North Star
**Where:** Claude Desktop  
**Style:** Free-form  
**Output:** `docs/north-star.md`  
**Purpose:** Define the final vision with all bells & whistles

### Stage 2: Architecture
**Where:** Claude Desktop  
**Style:** Free-form  
**Output:** `docs/[name]-architecture.md`  
**Purpose:** Technical decisions - how to build it

### Stage 3: Research
**Where:** Claude Desktop (primary), Claude Code (optional)  
**Style:** Free-form → Structured  
**Output:** `docs/[name]-research.md`  
**Purpose:** Validate unknowns, feasibility checks

### Stage 4: Milestone Design (NEW)
**Where:** Claude Code
**Style:** Template-driven
**Output:** `docs/milestones.md`
**Purpose:** Break North Star + Architecture into milestones

**Rules:**
- **Every project starts with Milestone 1: Core** (core functionality)
- **Clear path to north star**: Plan 2-3 milestones upfront if you can see the giant steps
- **Unclear path**: Start with just 1 milestone (Core) - common with small/experimental projects
- **Milestones grow organically** - add more as the path becomes clearer
- Each milestone = what it proves/achieves

### Stage 5: PoC Design
**Where:** Claude Code  
**Style:** Template-driven  
**Output:** `docs/[milestone]-poc-design.md`  
**Purpose:** Break ONE milestone into PoCs

**Rules:**
- Takes one milestone as input
- Run multiple times (once per milestone)
- Each PoC = atomic work that proves one thing

---

## Stage Outputs Summary

| Stage | Output | Example |
|-------|--------|---------|
| 1. North Star | `docs/north-star.md` | Vision document |
| 2. Architecture | `docs/[name]-architecture.md` | `core-architecture.md` |
| 3. Research | `docs/[name]-research.md` | `auth-research.md` |
| 4. Milestone Design | `docs/milestones.md` | Lists 1-3 milestones |
| 5. PoC Design | `docs/[milestone]-poc-design.md` | `core-poc-design.md` |

---

## Hierarchy & Terminology

### Strategic Planning (dev-design)

```
Project
└── Milestone 1: Core (always first)     ← Stage 4 creates
    └── PoC 1, PoC 2, PoC 3...           ← Stage 5 designs per milestone
└── Milestone 2: [Next feature]          ← Added later, run Stage 5 again
    └── PoC 1, PoC 2...
```

### Tactical Execution (dev-cycle)

```
Task (generic work unit)
├── Could be: PoC from poc-design
├── Could be: New feature discovered
├── Could be: Bug/issue found
└── Steps (bite-sized, ~30 min each)
    └── Step (1 unit test minimum)
```

**Key Insight**: dev-cycle doesn't know about milestones. It only works with "Tasks" - generic units of work that get broken into steps.

### Size Reference

| Level | Size | Example | Defined By |
|-------|------|---------|------------|
| **Project** | Multiple Milestones | "Mission Control" | Vision |
| **Milestone** | 10-20 PoCs | "Core MVP" | Stage 4 (dev-design) |
| **PoC** | ~10 steps | "CRUD Tools" | Stage 5 (dev-design) |
| **Task** | 1-10 steps | PoC/feature/bug | dev-cycle input |
| **Step** | 1 unit test | "Add validation" | dev-cycle execution |

**Note:** No time estimates. Progress = completion count.

---

## Terminology

| Term | Definition | Used By |
|------|------------|---------|
| **Project** | Top-level vision (e.g., "Mission Control") | Both |
| **Milestone** | Strategic grouping of 10-20 PoCs; always starts with "Core" | dev-design |
| **PoC** | Atomic work that proves one specific thing (~10 steps) | dev-design |
| **Task** | Generic work unit in dev-cycle (PoC/feature/bug) | dev-cycle |
| **Step** | Bite-sized work unit (1 unit test minimum, ~30 min) | dev-cycle |

**Key Clarifications:**
- dev-design outputs: Milestones and PoCs (strategic planning)
- dev-cycle inputs: Tasks (tactical execution - doesn't care if it's a PoC, feature, or bug)
- All Tasks are broken into Steps during execution

---

## Example: Mission Control

### Stage 4 Output: `docs/milestones.md`

**Initial version** (start of project):
```markdown
# Mission Control - Milestones

## Milestone 1: Core MVP (Current)
Focus: Core functionality that proves the product works
Proves: Local project management with MCP tools
Status: In Progress
```

**After Core MVP complete** (added organically):
```markdown
# Mission Control - Milestones

## Milestone 1: Core MVP ✅
Focus: Core functionality that proves the product works
Proves: Local project management with MCP tools
Status: Complete

## Milestone 2: Cloud Deployment (Current)
Focus: Scale and access
Proves: Multi-tenant SaaS with authentication
Status: Planning
```

**Key**: Milestones document grows as project evolves. Start minimal, add as needed.

### Stage 5 Outputs:

**`docs/core-poc-design.md`** (Milestone 1)
```markdown
# Core MVP

## Milestone Overview
Proves local project management works end-to-end

## Project
Mission Control

## Size
14 PoCs

## PoCs
- PoC 1: Schema + Connection
- PoC 2: MCP Server Basic
- PoC 3: CRUD Tools
- ...
```

**`docs/cloud-poc-design.md`** (Milestone 2)
```markdown
# Cloud Deployment

## Milestone Overview
Proves multi-tenant SaaS with auth works

## Project
Mission Control

## Size
8 PoCs

## PoCs
- PoC 1: HTTP Transport & API Key Auth
- PoC 2: WorkOS Integration
- ...
```

---

## Files to Modify in idea-to-mvp

### dev-design Skill (Strategic Planning)

| # | File | Action |
|---|------|--------|
| 1 | `dev-design/SKILL.md` | Add Stage 4 (Milestone Design), renumber PoC Design to Stage 5 |
| 2 | `dev-design/assets/templates/milestones.md` | **NEW** template |
| 3 | `dev-design/assets/templates/poc-design.md` | Update header to include milestone context |
| 4 | `dev-design/references/4-milestone-design-guide.md` | **NEW** guide for Stage 4 |
| 5 | `dev-design/references/4-poc-design-guide.md` → `5-poc-design-guide.md` | Rename |
| 6 | `commands/design-milestones.md` | **NEW** command for Stage 4 |
| 7 | `commands/design-poc-design.md` | Update to work per-milestone |
| 8 | All cross-references | Update stage numbers (4→5) |

### dev-cycle Skill (Tactical Execution)

**No changes needed!** dev-cycle already works with generic "work items" - we're just formalizing the term as "Task". The skill is milestone-agnostic by design.

---

## New Template: milestones.md

```markdown
# [Project Name] - Milestones

## Project
[Link to north-star.md]

## Milestones

### Milestone 1: [Name] (Core)
**Focus**: Core functionality
**Proves**: [What completing this milestone validates]
**Size**: [Expected PoC count: 10-20]

### Milestone 2: [Name]
**Focus**: [Theme]
**Proves**: [What completing this milestone validates]
**Size**: [Expected PoC count]

### Milestone 3: [Name] (if needed)
**Focus**: [Theme]
**Proves**: [What completing this milestone validates]
**Size**: [Expected PoC count]

## Milestone Order
1. [Name] - Core functionality (always first)
2. [Name] - [Why second]
3. [Name] - [Why third, if applicable]

## Notes
[Any dependencies between milestones, risks, etc.]
```

---

## Updated Template: poc-design.md

```markdown
# [Milestone Name]

## Milestone Overview
[What does completing this Milestone prove?]

## Project
[Parent project name]

## Size
[Expected number of PoCs: e.g., 10-15]

## PoC Dependency Diagram
...

## PoCs
...

## Execution Order
...
```

---

## Full Workflow

```
┌─────────────────────────────────────────────────────────────┐
│                    Claude Desktop                            │
│                                                              │
│  Stage 1: North Star (free-form)                            │
│  Stage 2: Architecture (free-form)                          │
│  Stage 3: Research (free-form)                              │
│                                                              │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           │ Bring docs to Claude Code
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                      Claude Code                             │
│                       dev-design                             │
│                                                              │
│  Refine Stages 1, 2, 3 with templates                       │
│  Stage 4: Milestone Design → docs/milestones.md             │
│  Stage 5: PoC Design → docs/[milestone]-poc-design.md       │
│                                                              │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           │ Pick first PoC
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                      Claude Code                             │
│                       dev-cycle                              │
│                                                              │
│  Input: "Task" (PoC/feature/bug - milestone-agnostic)      │
│                                                              │
│  Stage 1: Overview                                          │
│  Stage 2: Implementation Plan (~10 steps per Task)          │
│  Stage 3: Execute (step by step, unit tests)                │
│                                                              │
│  → Log bugs discovered (become new Tasks)                   │
│  → Repeat for next Task                                     │
│                                                              │
└─────────────────────────────────────────────────────────────┘

**Key**: dev-cycle receives "Tasks" (could be PoCs from dev-design, or features/bugs discovered during development). It doesn't know or care about milestones.
```

---

## Implementation Checklist

### dev-design skill

- [ ] Update `SKILL.md` with 5-stage structure
- [ ] Add environment guidance (Desktop vs Code)
- [ ] Emphasize: Every project starts with Milestone 1 (Core)
- [ ] Create `assets/templates/milestones.md`
- [ ] Update `assets/templates/poc-design.md` header (add milestone context)
- [ ] Create `references/4-milestone-design-guide.md` (NEW - Stage 4)
- [ ] Rename `references/4-poc-design-guide.md` → `5-poc-design-guide.md`
- [ ] Create `commands/design-milestones.md` (NEW - Stage 4 command)
- [ ] Update `commands/design-poc-design.md` to accept milestone as input
- [ ] Update all cross-references (Stage 4→5 for PoC Design)

### dev-cycle skill

- [ ] No structural changes needed (already milestone-agnostic)
- [ ] Optional: Add "Task" terminology to docs for clarity

---

## Summary

| What | Decision |
|------|----------|
| Total stages | **5** (added Milestone Design as Stage 4) |
| Stages 1-3 | **Claude Desktop** (free-form exploration) |
| Stages 3-5 | **Claude Code** (template-driven precision) |
| Stage 4 | **Milestone Design** - Every project starts with at least 1 milestone |
| Stage 5 | **PoC Design** - Run once per milestone |
| Milestone 1 | **Always "Core"** - Core functionality first |
| Milestone growth | **Organic** - Start with 1, add more as project evolves |
| Strategic term | **Milestone** (dev-design) |
| Atomic work term | **PoC** (dev-design) |
| Execution term | **Task** (dev-cycle - PoC/feature/bug) |
| dev-cycle changes | **None needed** - Already milestone-agnostic |

---

## Recognition Score

| Term | Recognition |
|------|-------------|
| Project | 95%+ |
| Milestone | 85-90% |
| PoC | 90%+ |
| Bug | 95%+ |

**Combined: ~90%** ✅

---

*Document created for idea-to-mvp Claude Code skill alignment*
