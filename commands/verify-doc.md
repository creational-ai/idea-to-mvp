# Verify Document

Verify design or implementation documents are sound, logical, consistent, and free of surprises.

## Input

**Document path(s)**: $ARGUMENTS (one or more file paths separated by spaces)

**Notes** (optional): User may provide additional context after `--notes` flag

Example usage:
- `/verify-doc core-poc-design.md`
- `/verify-doc core-architecture.md docs/auth-implementation.md`
- `/verify-doc core-architecture.md core-poc-design.md --notes "Focus on Stage 4 requirements"`

## Instructions

You are verifying the document(s) at the path(s) above. Follow this process:

### Step 1: Identify Document Type(s)

For each document, read and determine if it's a:
- **Design Doc**: Architecture, component design, API specifications, folder structure proposals
- **Implementation Plan**: Step-by-step execution plan, phases, tasks to complete

---

### Step 2: Verify Soundness

Check if the overall plan is coherent and feasible:
- Does the approach make sense for the stated goal?
- Are there any logical flaws or contradictions?
- Is the scope realistic?
- Are assumptions clearly stated?

---

### Step 3: Verify Step Logic and Flow

For each step/phase, verify:
- **Logical ordering**: Does this step belong here, or should it come earlier/later?
- **Smooth transitions**: Is the jump from previous step to this step natural?
- **Completeness**: Does this step fully accomplish what it claims before moving on?

---

### Step 4: Verify Dependency Chain

**Critical**: Check that each step sets up the next.

For each step, ask:
- What does this step **produce** (files, configs, state)?
- What does the **next step require** to start?
- Does the output of Step N match the input needs of Step N+1?

Flag any cases where:
- A step uses something not yet created
- A step creates something that's never used
- Steps could run in parallel but are sequenced
- Steps have circular dependencies

---

### Step 5: Hunt for Surprises

Identify potential gotchas, blockers, and hidden assumptions:
- **Hidden dependencies**: Does a step assume something exists that isn't explicitly created?
- **External dependencies**: APIs, services, credentials that might not be available
- **Environment assumptions**: Tools, versions, permissions assumed but not checked
- **Edge cases**: What could go wrong that isn't addressed?
- **Missing error handling**: What if a step fails?

---

### Step 6: Research - Codebase

Use Glob, Grep, and Read to verify against existing code:
- Do referenced files/functions exist?
- Does PoC code match what's described?
- Are dependencies already configured?
- Is the proposed structure compatible with existing patterns?

---

### Step 7: Research - Documentation

Check docs/ folder and related documentation:
- Is the document consistent with source-of-truth docs?
- For implementation plans: does it align with the design doc?
- Are cross-references accurate?

---

### Step 8: Research - External Sources (if needed)

Use WebSearch only if the document makes claims about:
- External library APIs or behavior
- Version compatibility
- Third-party service configurations
- Best practices that might have changed

---

### Step 9: Check for Contradictions

**Critical**: Explicitly look for statements that conflict with each other.

Within each document, check for:
- Conflicting requirements or constraints
- Inconsistent terminology (same concept called different names)
- Steps that undo or conflict with previous steps
- Success criteria that contradict implementation approach
- Stated goals that conflict with the proposed solution

When multiple documents are provided, check across documents for:
- Conflicting definitions of the same concept
- Different explanations of the same process
- Incompatible requirements between docs

**Flag every contradiction found** with exact locations (file + line/section).

---

### Step 10: Check for Unclear or Ambiguous Instructions

Identify parts that could confuse or mislead:
- **Vague language**: "should probably", "might need to", "consider doing"
- **Missing specifics**: References without examples, concepts without definitions
- **Ambiguous phrasing**: Could be interpreted multiple ways
- **Inconsistent patterns**: Similar things described differently
- **Missing context**: Assumes knowledge not stated in the doc

For each unclear part, suggest specific wording improvements.

---

### Step 11: Cross-Document Consistency (if multiple documents)

**Only if 2+ documents provided**: Check alignment between them.

Compare documents for:
- **Terminology alignment**: Same terms used consistently across docs?
- **Process alignment**: Do workflows/steps match between docs?
- **Requirement alignment**: Do all docs agree on what's needed?
- **Definition alignment**: Are key concepts defined the same way?
- **Scope alignment**: Do docs have compatible scope boundaries?

Create a consistency matrix showing where docs align and where they diverge.

---

### Step 12: Generate Report

Output a verification report:

```
## Verification Report: [Document Name(s)]

**Documents Verified**: [List all document paths]
**Overall Status**: ✅ Sound | ⚠️ Issues Found | ❌ Needs Revision

**Notes**: [Include user-provided notes if any]

---

## Per-Document Analysis

### Document: [path/to/doc.md]

**Document Type**: Design Doc | Implementation Plan | PoC Plan | Reference Doc

#### Soundness Check
[Is the overall approach coherent and feasible?]

#### Step Flow Analysis
[Are steps logical and smooth? Any ordering issues?]

#### Dependency Chain
| Step | Produces | Next Step Needs | Status |
|------|----------|-----------------|--------|
| Phase 1 | X, Y | Y, Z | ✅ OK / ⚠️ Gap: Z not created |

#### Potential Surprises
- **[High/Med/Low]**: Description of gotcha or hidden assumption

#### Verified Against Codebase
- [x] Item confirmed in codebase
- [ ] Item NOT found - needs attention

---

## Cross-Cutting Analysis

### Contradictions Found

**Within Documents**:
| Document | Location | Contradiction | Impact |
|----------|----------|---------------|--------|
| [doc.md] | Line X / Section Y | [What conflicts with what] | High/Med/Low |

**Across Documents** (if multiple):
| Document 1 | Document 2 | Contradiction | Impact |
|------------|------------|---------------|--------|
| [doc1.md:LineX] | [doc2.md:LineY] | [What conflicts] | High/Med/Low |

### Unclear or Ambiguous Parts

| Document | Location | Issue | Suggested Fix |
|----------|----------|-------|---------------|
| [doc.md] | Line X | Vague: "might need to..." | Change to: "Must..." or "Optional:..." |
| [doc.md] | Section Y | Missing context: assumes X | Add: "Prerequisites: X must be..." |

### Cross-Document Consistency (if multiple documents)

| Aspect | Doc 1 | Doc 2 | Status |
|--------|-------|-------|--------|
| Terminology for X | "PoC implementation" | "core-poc" | ⚠️ Inconsistent |
| Self-contained definition | "works independently" | "works independently; doesn't break existing functionality and existing tests" | ⚠️ Incomplete in Doc 1 |

**Consistency Matrix**:
- ✅ Aligned: [List what's consistent]
- ⚠️ Divergent: [List what differs]

---

## Summary

### Issues Found
| Issue | Location | Impact | Fix |
|-------|----------|--------|-----|
| [Type: Contradiction/Unclear/Flow/etc] | [doc.md:section] | High/Med/Low | How to fix |

### Recommendations
1. **[Priority: High/Med/Low]** - Specific actionable fix
2. **[Priority: High/Med/Low]** - Specific actionable fix

**Total Issues**: [N contradictions, N unclear parts, N flow issues, etc.]
```

---

### Step 13: Prompt for Action

After generating the report, if there are any **Issues Found** or **Recommendations**:

Use the AskUserQuestion tool to ask:

**Question**: "Would you like me to apply the recommended fixes to the document?"

**Options**:
- **Yes, apply all** - Apply all recommendations to the document
- **Let me pick** - Show the list and let user choose which to apply
- **No, just the report** - End with the report only

If user selects "Yes, apply all" or specific fixes, proceed to edit the document with the recommended changes.

---

## Key Questions to Answer

By the end of verification, you should be able to answer:

1. **Is it sound?** Does the overall plan make sense?
2. **Is it logical?** Are steps in the right order?
3. **Is it smooth?** Do steps flow naturally into each other?
4. **Does each step set up the next?** Is the dependency chain complete?
5. **Any surprises?** What could go wrong that we haven't thought of?
6. **Any contradictions?** Do any statements conflict with each other?
7. **Is it clear?** Are instructions unambiguous and complete?
8. **Are docs consistent?** (If multiple) Do documents align on terminology, processes, and requirements?
