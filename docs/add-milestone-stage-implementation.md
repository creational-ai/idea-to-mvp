# Add Milestone Design Stage Implementation Plan

> **Track Progress**: See `docs/add-milestone-stage-results.md` for implementation status, test results, and issues.

## Overview

| Attribute | Value |
|-----------|-------|
| **Name** | Add Stage 4 (Milestone Design) to dev-design skill |
| **Proves** | 5-stage workflow with organic milestone growth works end-to-end |
| **Production-Grade Because** | Real templates, complete documentation, tested commands, integrated with existing workflow |

> ⚠️ **Self-Contained Requirement**: This work must be complete and functional on its own. All existing dev-design and dev-cycle functionality must continue working. We're adding Stage 4 alongside existing stages, then renumbering PoC Design from Stage 4 to Stage 5.

---

## Prerequisites

Complete these BEFORE starting implementation steps.

### 1. Understanding Current Structure

**Why Needed**: Must understand existing 4-stage structure before adding Stage 4

**Steps**:
1. Review current dev-design SKILL.md (4 stages)
2. Review existing templates (north-star, architecture, poc-design)
3. Review existing reference guides (1-4)
4. Review existing commands (design-northstar, design-architecture, design-research, design-poc-design)

**Verification**:
```bash
# List all current files
ls -la dev-design/
ls -la dev-design/assets/templates/
ls -la dev-design/references/
ls -la commands/design-*.md
```

### 2. Terminology Alignment Document

**Why Needed**: Source of truth for 5-stage structure

**Steps**:
1. Already exists at `docs/idea-to-mvp-terminology-alignment.md`
2. Contains complete 5-stage definition
3. Includes templates and examples

**Verification**:
```bash
# Verify document exists
cat docs/idea-to-mvp-terminology-alignment.md | head -20
```

---

## Success Criteria

From `docs/idea-to-mvp-terminology-alignment.md`:

- [ ] dev-design SKILL.md updated with 5-stage structure (Stage 4: Milestone Design, Stage 5: PoC Design)
- [ ] New template created: `dev-design/assets/templates/milestones.md`
- [ ] poc-design template updated with milestone context
- [ ] New reference guide: `dev-design/references/4-milestone-design-guide.md`
- [ ] Existing reference renamed: `4-poc-design-guide.md` → `5-poc-design-guide.md`
- [ ] New command: `commands/design-milestones.md`
- [ ] Updated command: `commands/design-poc-design.md` (accepts milestone input)
- [ ] All cross-references updated (Stage 4→5 for PoC Design)
- [ ] Environment guidance added (Claude Desktop vs Claude Code)
- [ ] Deploy script works with new structure
- [ ] All existing functionality still works

---

## Architecture

### File Structure
```
idea-to-mvp/
├── dev-design/
│   ├── SKILL.md                                    # Updated (5 stages)
│   ├── assets/templates/
│   │   ├── north-star.md                           # Unchanged
│   │   ├── architecture.md                         # Unchanged
│   │   ├── research.md                             # Unchanged
│   │   ├── milestones.md                           # NEW (Stage 4 output)
│   │   └── poc-design.md                           # Updated (add milestone context)
│   └── references/
│       ├── 1-north-star-guide.md                   # Unchanged
│       ├── 2-architecture-guide.md                 # Unchanged
│       ├── 3-research-guide.md                     # Unchanged
│       ├── 4-milestone-design-guide.md             # NEW (Stage 4 guide)
│       └── 5-poc-design-guide.md                   # Renamed from 4-poc-design-guide.md
├── commands/
│   ├── design-northstar.md                         # Unchanged
│   ├── design-architecture.md                      # Unchanged
│   ├── design-research.md                          # Unchanged
│   ├── design-milestones.md                        # NEW (Stage 4 command)
│   └── design-poc-design.md                        # Updated (accept milestone input)
└── docs/
    └── idea-to-mvp-terminology-alignment.md        # Source of truth
```

### Design Principles
1. **Add Alongside**: Keep existing 4-stage structure working during transition
2. **Template-Driven**: All stages use consistent template format
3. **Self-Documenting**: Reference guides provide complete process documentation
4. **Command Integration**: Slash commands provide easy access to each stage

---

## Implementation Steps

**Approach**: Bottom-up - Start with templates and guides (foundation), then update SKILL.md and commands (interface).

### Step 1: Create Milestone Template + Tests

**Goal**: Create the Stage 4 output template

**Tasks**:
- [ ] Create `dev-design/assets/templates/milestones.md`
- [ ] Include all sections from terminology alignment doc
- [ ] Add clear instructions for organic growth
- [ ] Verify template structure matches terminology doc

**Code** (create `dev-design/assets/templates/milestones.md`):
```markdown
# [Project Name] - Milestones

## Project
[Link to docs/north-star.md]

## Milestones

### Milestone 1: [Name] (Core)
**Focus**: Core functionality that proves the product works
**Proves**: [What completing this milestone validates]
**Size**: [Expected PoC count: 10-20]
**Status**: Planning / In Progress / Complete

### Milestone 2: [Name] (if clear path visible)
**Focus**: [Theme - what this milestone achieves]
**Proves**: [What completing this milestone validates]
**Size**: [Expected PoC count: 10-20]
**Status**: Planning / In Progress / Complete

### Milestone 3: [Name] (if clear path visible)
**Focus**: [Theme]
**Proves**: [What completing this milestone validates]
**Size**: [Expected PoC count]
**Status**: Planning / In Progress / Complete

## Milestone Order

1. **[Milestone 1 Name]** (Core) - Core functionality (always first)
   - Why first: Proves the fundamental product works
   - Unlocks: All dependent milestones

2. **[Milestone 2 Name]** (if applicable)
   - Why second: [Rationale]
   - Depends on: Milestone 1
   - Unlocks: [What this enables]

3. **[Milestone 3 Name]** (if applicable)
   - Why third: [Rationale]
   - Depends on: Milestone 1, Milestone 2
   - Unlocks: [What this enables]

## Notes

**Organic Growth**: This document starts minimal (often just Milestone 1: Core) and grows as the project evolves and the path to the north star becomes clearer.

**Clear vs Unclear Path**:
- **Clear path**: If you can see the giant steps to reach the north star, plan 2-3 milestones upfront
- **Unclear path**: Start with just Milestone 1 (Core) - common with small/experimental projects
- Add more milestones as clarity emerges

**Dependencies**: [Any dependencies between milestones, risks, technical constraints]

**Risks**: [Risks that could impact milestone completion or order]
```

**Verification**:
```bash
# Verify file created
cat dev-design/assets/templates/milestones.md
# Expected: Complete template with all sections
```

**Output**: `dev-design/assets/templates/milestones.md` created

---

### Step 2: Create Milestone Design Guide + Tests

**Goal**: Create comprehensive Stage 4 reference guide

**Tasks**:
- [ ] Create `dev-design/references/4-milestone-design-guide.md`
- [ ] Include process steps from terminology doc
- [ ] Add examples (clear path vs unclear path)
- [ ] Define verification checklist
- [ ] Emphasize organic growth concept

**Code** (create `dev-design/references/4-milestone-design-guide.md`):
```markdown
# Stage 4: Milestone Design

## Goal
Break North Star + Architecture into strategic milestones that group related PoCs.

## Code Allowed
NO - This is pure strategic planning

## Input
- Completed North Star doc (`docs/north-star.md`)
- Completed Architecture doc (`docs/[name]-architecture.md`)
- Optional: Research findings

## Process

### 1. Start with Milestone 1: Core

**Every project starts with Milestone 1: Core**
- Focus: Core functionality that proves the product works
- Size: 10-20 PoCs typically
- Status: Planning (at this stage)

### 2. Assess Path Clarity

**Ask**: Can you see the giant steps to reach the north star?

**Clear Path Visible** (plan 2-3 milestones upfront):
- You can articulate major phases (e.g., "Core → Mobile Support → Enterprise Features")
- Each phase has a clear theme and proof point
- Dependencies between phases are obvious
- Example: Building a SaaS product with known scaling requirements

**Unclear Path** (start with just Core):
- Small/experimental projects
- Novel/unproven concepts
- High uncertainty about what comes after Core
- Example: Proof-of-concept for a new idea

### 3. Define Each Milestone

For each milestone (starting with Core):

**Focus**: What is the theme of this milestone?
- Core: Fundamental product functionality
- Others: A major capability or expansion (mobile, enterprise, scale, etc.)

**Proves**: What does completing this milestone validate?
- Core: "The product works and solves the problem"
- Others: "We can scale to 10K users", "Mobile experience is solid", etc.

**Size**: Expected PoC count (typically 10-20 per milestone)

**Dependencies**: Which milestones must complete first?

### 4. Document Milestone Order

Explain the sequence:
1. Why Core comes first
2. Why Milestone 2 comes next (if applicable)
3. Why Milestone 3 follows (if applicable)

Include:
- Dependencies between milestones
- What each milestone unlocks
- Rationale for the order

### 5. Add Notes

**Organic Growth Note**: Always include reminder that milestones grow organically
- Document starts minimal
- Add more as project evolves
- Path becomes clearer with progress

**Dependencies & Risks**: Document any technical constraints or risks

## Output

`docs/milestones.md` using `assets/templates/milestones.md`

## Verification Checklist

- [ ] Milestone 1: Core is defined
- [ ] Each milestone has clear focus and proof point
- [ ] Milestone order makes sense (dependencies clear)
- [ ] Size estimates reasonable (10-20 PoCs each)
- [ ] Organic growth note included
- [ ] Clear vs unclear path decision documented
- [ ] Run `/verify-doc docs/milestones.md`

## Examples

### Example 1: Clear Path (Mission Control)

```markdown
## Milestone 1: Core MVP (Current)
Focus: Core functionality that proves the product works
Proves: Local project management with MCP tools works end-to-end
Size: 14 PoCs

## Milestone 2: Cloud Deployment
Focus: Scale and multi-tenant access
Proves: Multi-tenant SaaS with authentication works
Size: 8 PoCs

## Milestone Order
1. Core MVP - Proves local functionality first
2. Cloud Deployment - Scales proven local functionality
```

### Example 2: Unclear Path (Small Project)

```markdown
## Milestone 1: Core (Current)
Focus: Core functionality
Proves: Basic video processing pipeline works
Size: 6 PoCs

## Notes
Starting with just Core milestone. Will add Milestone 2 after Core proves viability.
Path unclear - need to validate core concept before planning next steps.
```

## Common Pitfalls

- Planning too many milestones upfront (creates rigidity)
- Making milestones too small (should group 10-20 PoCs)
- Not starting with Core (always start with Core)
- Forgetting organic growth note (users need to know doc grows)

## Next Stage

→ Stage 5: PoC Design (run once per milestone, starting with Core)
```

**Verification**:
```bash
# Verify file created
cat dev-design/references/4-milestone-design-guide.md
# Expected: Complete guide with examples
```

**Output**: `dev-design/references/4-milestone-design-guide.md` created

---

### Step 3: Rename and Update PoC Design Guide (4→5) + Tests

**Goal**: Update PoC Design guide to be Stage 5 (atomic rename + header update)

**Tasks**:
- [ ] Rename `dev-design/references/4-poc-design-guide.md` → `5-poc-design-guide.md`
- [ ] Update header to say "Stage 5"
- [ ] Update input section to reference milestones.md
- [ ] Update "Next Stage" reference
- [ ] Verify all content still accurate

**Code**:
```bash
# Rename file
mv dev-design/references/4-poc-design-guide.md dev-design/references/5-poc-design-guide.md
```

Then immediately update the header (edit `dev-design/references/5-poc-design-guide.md`):
```markdown
# Stage 5: PoC Design

## Goal
Define what needs to be proven and in what order — with PRODUCTION-GRADE thin slices.

## Code Allowed
NO

## Input
- Milestone definition from `docs/milestones.md`
- Validated architecture doc (`docs/[name]-architecture.md`)

[Rest of content unchanged, except:]

## Next Stage
→ PoC Implementation Planning (ONE PoC at a time) via dev-cycle
```

**Verification**:
```bash
# Verify rename worked
ls -la dev-design/references/
# Expected: 5-poc-design-guide.md exists, 4-poc-design-guide.md does not

# Verify header updated
cat dev-design/references/5-poc-design-guide.md | head -15
# Expected: "Stage 5: PoC Design"

# Verify Input section references milestones.md
grep "milestones.md" dev-design/references/5-poc-design-guide.md
# Expected: Input section shows milestone definition source
```

**Output**: File renamed to `5-poc-design-guide.md` with updated header

---

### Step 4: Update PoC Design Template + Tests

**Goal**: Add milestone context to poc-design template

**Tasks**:
- [ ] Read current `dev-design/assets/templates/poc-design.md` template
- [ ] Update header to include milestone context
- [ ] Add milestone overview section
- [ ] Keep all existing sections intact
- [ ] Verify structure matches current template

**Code**:

First, read the current template to understand its structure:
```bash
cat dev-design/assets/templates/poc-design.md | head -30
# Review current structure before making changes
```

Then update header in `dev-design/assets/templates/poc-design.md`:
```markdown
# [Milestone Name]

## Milestone Overview
[What does completing this Milestone prove? What capability does it unlock?]

## Project
[Parent project name - link to docs/north-star.md]

## Size
[Expected number of PoCs for this milestone: e.g., 10-15]

## PoC Dependency Diagram
...
[Rest of template remains unchanged]
```

**Verification**:
```bash
# Verify template updated
cat dev-design/assets/templates/poc-design.md | head -20
# Expected: Shows milestone context in header
```

**Output**: `dev-design/assets/templates/poc-design.md` updated

---

### Step 5: Create /design-milestones Command + Tests

**Goal**: Create Stage 4 slash command

**Tasks**:
- [ ] Create `commands/design-milestones.md`
- [ ] Match format of other design-* commands
- [ ] Point to correct template and guide
- [ ] Include user notes section

**Code** (create `commands/design-milestones.md`):
```markdown
# /design-milestones

Create milestone roadmap breaking North Star into strategic phases.

## What This Does

Stage 4 of dev-design: Break North Star + Architecture into 1-3 milestones.

## Resources

**Read these for guidance**:
- `~/.claude/skills/dev-design/SKILL.md` - See "Stage 4: Milestone Design" section
- `~/.claude/skills/dev-design/references/4-milestone-design-guide.md` - Detailed process
- `~/.claude/skills/dev-design/assets/templates/milestones.md` - Template

## Prerequisites

Must complete before running this command:
- [ ] Stage 1: North Star (`docs/north-star.md`)
- [ ] Stage 2: Architecture (`docs/[name]-architecture.md`)
- [ ] Optional: Stage 3: Research (if applicable)

## Input

**User notes (optional):**
```
{{notes}}
```

**Examples:**
```bash
# Basic usage (reads from north-star.md and architecture docs)
/design-milestones

# With specific guidance
/design-milestones "Clear path: Core → Mobile → Enterprise"

# For unclear path
/design-milestones "Small project - just start with Core milestone"
```

## Process

Follow the guidance in `4-milestone-design-guide.md`:
1. Start with Milestone 1: Core (always)
2. Assess path clarity (can you see the giant steps?)
3. Define 1-3 milestones (Core + others if clear path visible)
4. Document milestone order and dependencies
5. Add organic growth notes

## Output

Creates:
- `docs/milestones.md` - Strategic milestone roadmap

## Key Decisions

**Every project starts with Milestone 1: Core** (core functionality)

**Clear path to north star**: Plan 2-3 milestones upfront if you can see the giant steps

**Unclear path**: Start with just 1 milestone (Core) - common with small/experimental projects

**Milestones grow organically**: Add more as the path becomes clearer

## After Completion

User will run `/verify-doc docs/milestones.md`, fix issues, then proceed to Stage 5 (PoC Design) starting with the first milestone.

**Next Stage**: `/design-poc-design` (run once per milestone, starting with Core)
```

**Verification**:
```bash
# Verify command created
cat commands/design-milestones.md | head -20
# Expected: Complete command definition
```

**Output**: `commands/design-milestones.md` created

---

### Step 6: Update /design-poc-design Command + Tests

**Goal**: Update PoC Design command to accept milestone input and update all Stage 4 references

**Tasks**:
- [ ] Update `commands/design-poc-design.md`
- [ ] Add milestone parameter to input section
- [ ] Update ALL "Stage 4" references to "Stage 5" (currently 2 references at lines 7, 12)
- [ ] Add examples showing milestone input
- [ ] Verify no remaining "Stage 4" references

**Code**:

First, update the "What This Does" section:
```markdown
## What This Does

Stage 5 of dev-design: Plan atomic PoCs with clear success criteria and dependencies.
```

Then update the "Resources" section:
```markdown
**Read these for guidance**:
- `~/.claude/skills/dev-design/SKILL.md` - See "Stage 5: PoC Design" section
- `~/.claude/skills/dev-design/references/5-poc-design-guide.md` - Detailed process
- `~/.claude/skills/dev-design/assets/templates/poc-design.md` - Template
```

Finally, update the input section in `commands/design-poc-design.md`:
```markdown
## Input

**First argument (optional):**
- Milestone name or number (e.g., "Core", "Milestone 1", "Cloud Deployment")
- If not provided, use first milestone from `docs/milestones.md`

**User notes (optional):**
```
{{notes}}
```

**Examples:**
```bash
# Design PoCs for first milestone (Core)
/design-poc-design

# Design PoCs for specific milestone
/design-poc-design "Core"

# Design PoCs for second milestone
/design-poc-design "Milestone 2: Cloud Deployment"

# With specific guidance
/design-poc-design "Core" --notes "Focus on database first, then API"
```

**The command will:**
1. Read `docs/milestones.md` to get milestone definition
2. Read milestone name from first argument or default to first milestone
3. Read architecture docs for technical context
4. Create PoC breakdown for the specified milestone
```

**Verification**:
```bash
# Verify input section updated
cat commands/design-poc-design.md | grep -A 10 "Input"
# Expected: Shows milestone parameter and examples

# Verify ALL "Stage 4" references updated to "Stage 5"
grep -n "Stage 4" commands/design-poc-design.md
# Expected: No output (all references should now be "Stage 5")

grep -n "Stage 5" commands/design-poc-design.md
# Expected: Shows updated references (lines ~7, ~12, and others)
```

**Output**: `commands/design-poc-design.md` updated (all Stage 4→5 references changed)

---

### Step 7: Update dev-design SKILL.md + Tests

**Goal**: Update main SKILL to reflect 5-stage structure

**Tasks**:
- [ ] Update Stage Overview table (add Stage 4)
- [ ] Renumber PoC Design (Stage 4→5)
- [ ] Add Stage 4: Milestone Design section
- [ ] Update Stage 5: PoC Design section
- [ ] Update reference guide list
- [ ] Add environment guidance (Desktop vs Code)

**Code** (update stage overview in `dev-design/SKILL.md`):
```markdown
## Stage Overview

| Stage | Where | Output |
|-------|-------|--------|
| 1. North Star | Claude Desktop (free-form) | `docs/north-star.md` |
| 2. Architecture | Claude Desktop (free-form) | `docs/[name]-architecture.md` |
| 3. Research | Claude Desktop (free-form) | Market analysis, validation |
| 4. Milestone Design | Claude Code (template-driven) | `docs/milestones.md` |
| 5. PoC Design | Claude Code (template-driven) | `docs/[milestone]-poc-design.md` |

**Note**: `[name]` can be anything - project name, feature name, module name, etc.

**Environment Split**:
- **Claude Desktop (Stages 1-3)**: Free-form exploration, "what if" discussions, dream big
- **Claude Code (Stages 4-5)**: Structured templates, file creation, precision

**Next**: → Hand off to `dev-cycle` skill for implementation
```

**Verification**:
```bash
# Verify SKILL.md updated
cat dev-design/SKILL.md | grep -A 15 "Stage Overview"
# Expected: 5 stages with environment split
```

**Output**: `dev-design/SKILL.md` updated with 5-stage structure

---

### Step 8: Update Stage 3 Cross-References + Tests

**Goal**: Update all Stage 3 references to point to new Stage 4 (Milestone Design)

**Tasks**:
- [ ] Update `dev-design/SKILL.md` Stage 3 section "Next" references
- [ ] Update `dev-design/references/3-research-guide.md` "Next Stage" reference
- [ ] Update `commands/design-research.md` Stage 4 references

**Code**:

Update `dev-design/SKILL.md` Stage 3 section (lines ~132, 141):
```markdown
### Stage 3 Complete Checklist
- [ ] Competitors identified with strengths/weaknesses
- [ ] Market gap clearly articulated
- [ ] Differentiation strategy defined
- [ ] Pricing validated against market (if applicable)
- [ ] Go/no-go decision supported by evidence

**Next**: → Stage 4: Milestone Design
```

Update `dev-design/references/3-research-guide.md` (line ~68):
```markdown
## Next Stage
→ Stage 4: Milestone Design
```

Update `commands/design-research.md` (lines ~56, 64):
```markdown
## Fast-Track Option

If research already exists (from prior sessions, reference docs, or external sources):
1. Review existing research docs for coverage
2. Verify all checklist items are addressed
3. Note source: "Research validated via [reference docs]"
4. Proceed to Stage 4: Milestone Design

## After Completion

Make go/no-go decision based on research, then proceed to Stage 4: Milestone Design.
```

**Verification**:
```bash
# Verify Stage 3 section in SKILL.md updated
grep -A2 "Stage 3 Complete" dev-design/SKILL.md | grep "Stage 4"
# Expected: "→ Stage 4: Milestone Design"

# Verify research guide updated
grep "Next Stage" -A1 dev-design/references/3-research-guide.md
# Expected: "→ Stage 4: Milestone Design"

# Verify design-research command updated
grep "Stage 4" commands/design-research.md
# Expected: Both lines show "Stage 4: Milestone Design"
```

**Output**: All Stage 3 → Stage 4 cross-references updated to point to Milestone Design

---

### Step 9: Add Stage 4 Section to SKILL.md + Tests

**Goal**: Add complete Stage 4 documentation

**Tasks**:
- [ ] Add Stage 4: Milestone Design section
- [ ] Include rules (Core first, organic growth)
- [ ] Add checklist
- [ ] Update cross-references

**Code** (add after Stage 3 in `dev-design/SKILL.md`):
```markdown
## Stage 4: Milestone Design

**Goal**: Break North Star + Architecture into strategic milestones

**Input**: North Star doc (`docs/north-star.md`) and Architecture doc (`docs/[name]-architecture.md`)

**Template**: `assets/templates/milestones.md`

**Output**: `docs/milestones.md`

**Process**:
1. Start with Milestone 1: Core (always)
2. Assess path clarity to north star
3. Define 1-3 milestones (Core + others if clear path visible)
4. Document milestone order and dependencies
5. Add organic growth notes

**Key Principles**:
- **Every project starts with Milestone 1: Core** (core functionality)
- **Clear path**: Plan 2-3 milestones upfront if you can see the giant steps
- **Unclear path**: Start with just 1 milestone (Core) - common with small/experimental projects
- **Organic growth**: Milestones document grows as project evolves
- Each milestone groups 10-20 PoCs

### Stage 4 Complete Checklist
- [ ] `docs/milestones.md` created using template
- [ ] Milestone 1: Core is defined
- [ ] Each milestone has clear focus and proof point
- [ ] Milestone order makes sense (dependencies clear)
- [ ] Size estimates reasonable (10-20 PoCs each)
- [ ] Organic growth note included
- [ ] Run `/verify-doc docs/milestones.md`

**Next**: → Stage 5: PoC Design (run once per milestone, starting with Core)
```

**Verification**:
```bash
# Verify Stage 4 section added
cat dev-design/SKILL.md | grep -A 30 "Stage 4: Milestone Design"
# Expected: Complete section with checklist
```

**Output**: Stage 4 section added to SKILL.md

---

### Step 10: Update Stage 5 Section in SKILL.md + Tests

**Goal**: Update PoC Design section for Stage 5

**Tasks**:
- [ ] Update stage number (4→5)
- [ ] Add milestone input requirement
- [ ] Update naming convention
- [ ] Keep all existing content

**Code** (update in `dev-design/SKILL.md`):
```markdown
## Stage 5: PoC Design

**Goal**: Break ONE milestone into atomic PoCs — with PRODUCTION-GRADE thin slices

**Input**:
- Milestone definition from `docs/milestones.md`
- Validated architecture doc (`docs/[name]-architecture.md`)

**Template**: `assets/templates/poc-design.md`

**Naming**: `docs/[milestone]-poc-design.md` where `[milestone]` is the milestone name (e.g., `core-poc-design.md`, `cloud-poc-design.md`)

**Important**: Run this stage once per milestone. Start with Milestone 1 (Core), then repeat for subsequent milestones.

**Process**:
1. Read milestone definition from `docs/milestones.md`
2. Refine architecture with implementation perspective
3. Identify atomic things to prove (PoCs) for THIS milestone
4. Map dependencies between PoCs
5. Create PoC diagram
6. Define success criteria for each PoC

[Keep all existing PoC Requirements, Golden Rule, etc.]

### Stage 5 Complete Checklist
- [ ] `docs/[milestone]-poc-design.md` created using template
- [ ] Milestone context included in header
- [ ] Each PoC proves one specific thing
- [ ] Dependencies mapped (which PoCs unlock others)
- [ ] Success criteria measurable
- [ ] Order of execution clear
- [ ] Run `/verify-doc docs/[milestone]-poc-design.md`

**Next**: → Hand off to **dev-cycle skill** for implementation
```

**Verification**:
```bash
# Verify Stage 5 updated
cat dev-design/SKILL.md | grep -A 20 "Stage 5: PoC Design"
# Expected: Updated with milestone context
```

**Output**: Stage 5 section updated in SKILL.md

---

### Step 11: Update Reference Guide List + Tests

**Goal**: Update reference guide list at end of SKILL.md

**Tasks**:
- [ ] Add reference to 4-milestone-design-guide.md
- [ ] Update PoC design guide number (4→5)

**Code** (update in `dev-design/SKILL.md`):
```markdown
## Reference Guides

For detailed guidance on each stage:
- `references/1-north-star-guide.md` - Stage 1 process
- `references/2-architecture-guide.md` - Stage 2 process
- `references/3-research-guide.md` - Stage 3 process
- `references/4-milestone-design-guide.md` - Stage 4 process (NEW)
- `references/5-poc-design-guide.md` - Stage 5 process (was Stage 4)
```

**Verification**:
```bash
# Verify reference guide list updated
cat dev-design/SKILL.md | grep -A 6 "Reference Guides"
# Expected: 5 guides listed
```

**Output**: Reference guide list updated

---

### Step 12: Test Deploy Script + Tests

**Goal**: Verify deploy script works with new structure

**Tasks**:
- [ ] Run `./deploy.sh`
- [ ] Verify all files copied correctly
- [ ] Check that 5 reference guides exist in deployed location
- [ ] Check that milestones template exists
- [ ] Check that design-milestones command exists

**Verification**:
```bash
# Deploy
./deploy.sh

# Verify deployed files
ls -la ~/.claude/skills/dev-design/references/
# Expected: 5 guide files (1, 2, 3, 4, 5)

ls -la ~/.claude/skills/dev-design/assets/templates/
# Expected: milestones.md exists

ls -la ~/.claude/commands/design-*.md
# Expected: design-milestones.md exists

# Verify content
cat ~/.claude/skills/dev-design/SKILL.md | grep "Stage 4: Milestone Design"
# Expected: Stage 4 section exists

# Comprehensive check: Verify NO "Stage 4" references to PoC Design remain
echo "Checking dev-design/ for Stage 4 PoC references..."
grep -rn "Stage 4.*PoC" dev-design/ || echo "✓ No 'Stage 4.*PoC' found"
grep -rn "Stage 4: PoC" dev-design/ || echo "✓ No 'Stage 4: PoC' found"

echo "Checking commands/ for Stage 4 references..."
grep -rn "Stage 4" commands/design-poc-design.md || echo "✓ No 'Stage 4' found in design-poc-design"

# Verify Stage 5 references exist
echo "Verifying Stage 5 references exist..."
grep -n "Stage 5.*PoC" dev-design/SKILL.md
# Expected: Should show "Stage 5: PoC Design"

grep -n "Stage 5" commands/design-poc-design.md
# Expected: Should show updated references
```

**Output**: Deploy script works, all files in correct locations, all cross-references validated

---

## Test Summary

### After Implementation Complete

| Test Area | Tests | What It Covers |
|-----------|-------|----------------|
| Template validation | 2 | milestones.md and updated poc-design.md |
| Reference guides | 1 | New guide 4, renamed+updated guide 5 (atomic) |
| Commands | 2 | New design-milestones, updated design-poc-design |
| SKILL.md | 5 | Stage overview, Stage 3 cross-refs, Stage 4 section, Stage 5 section, references |
| Cross-references | 1 | Stage 3 → Stage 4 references (research guide, commands) |
| Deploy | 1 | End-to-end deployment + cross-reference validation |

**Total Expected: 12 verification steps** (Steps 1-12, with atomic rename+header update in Step 3)

---

## Production-Grade Checklist

Before marking work complete, verify:

- [ ] **Template Completeness**: milestones.md template has all sections from terminology doc
- [ ] **Guide Quality**: 4-milestone-design-guide.md provides complete process with examples
- [ ] **Command Integration**: /design-milestones command works and points to correct resources
- [ ] **Stage Renumbering**: All references to PoC Design updated from Stage 4 to Stage 5
- [ ] **SKILL.md Accuracy**: 5-stage overview clear, environment split documented
- [ ] **Backward Compatibility**: Existing commands and workflows still work
- [ ] **Deploy Success**: ./deploy.sh completes without errors
- [ ] **File Organization**: All files in correct locations after deploy
- [ ] **Documentation Clarity**: Each stage has clear input, process, output, checklist
- [ ] **Cross-References**: All internal links and references accurate

---

## What "Done" Looks Like

```bash
# 1. Verify all new files exist in repo
ls dev-design/assets/templates/milestones.md
ls dev-design/references/4-milestone-design-guide.md
ls dev-design/references/5-poc-design-guide.md
ls commands/design-milestones.md

# 2. Verify SKILL.md has 5 stages
grep "^## Stage [1-5]:" dev-design/SKILL.md | wc -l
# Expected: 5

# 3. Deploy successfully
./deploy.sh
# Expected: No errors

# 4. Verify deployed structure
ls ~/.claude/skills/dev-design/references/
# Expected: 1-north-star-guide.md, 2-architecture-guide.md, 3-research-guide.md,
#           4-milestone-design-guide.md, 5-poc-design-guide.md

# 5. Test command exists
cat ~/.claude/commands/design-milestones.md | head -5
# Expected: Command definition

# 6. Verify no broken references
grep -r "Stage 4.*PoC" dev-design/
# Expected: No matches (should be Stage 5)
```

---

## Files to Create/Modify

| File | Action | Purpose |
|------|--------|---------|
| `dev-design/assets/templates/milestones.md` | Create | Stage 4 output template |
| `dev-design/assets/templates/poc-design.md` | Modify | Add milestone context |
| `dev-design/references/4-milestone-design-guide.md` | Create | Stage 4 process guide |
| `dev-design/references/4-poc-design-guide.md` | Rename to 5 | Update stage number |
| `dev-design/references/5-poc-design-guide.md` | Modify | Update header to Stage 5 |
| `dev-design/SKILL.md` | Modify | Add Stage 4, renumber Stage 5, update overview |
| `commands/design-milestones.md` | Create | Stage 4 slash command |
| `commands/design-poc-design.md` | Modify | Accept milestone input |

---

## Dependencies

No new dependencies required. This is pure documentation and template work.

---

## Risks & Mitigations

| Risk | Likelihood | Mitigation |
|------|------------|------------|
| Breaking existing workflows | Medium | Add alongside, test thoroughly, keep backward compatibility |
| Stage number confusion (4→5) | Medium | Update all cross-references systematically in one step |
| Deploy script issues | Low | Test deploy before committing |
| Missing cross-references | Medium | Grep for "Stage 4.*PoC" to find all instances |

---

## Next Steps After Completion

1. ✅ Verify all 12 implementation steps complete (Steps 1-12)
2. ✅ Run deploy script successfully
3. ✅ Verify cross-reference validation passes (no Stage 4→PoC references remain)
4. ✅ Test `/design-milestones` command in a real project
5. ✅ Test updated `/design-poc-design` command with milestone input
6. → Update CLAUDE.md if needed (document 5-stage structure)
7. → Commit changes to git
8. → Create example milestone.md in Mission Control project (if applicable)
