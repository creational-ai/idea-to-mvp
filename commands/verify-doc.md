# Verify Document

Verify a design or implementation document is sound, logical, and free of surprises.

## Input

Document path: $ARGUMENTS

## Instructions

You are verifying the document at the path above. Follow this process:

### Step 1: Identify Document Type

Read the document and determine if it's a:
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

### Step 9: Generate Report

Output a verification report:

```
## Verification Report: [Document Name]

**Document Type**: Design Doc | Implementation Plan
**Overall Status**: Sound | Issues Found | Needs Revision

---

### Soundness Check
[Is the overall approach coherent and feasible?]

### Step Flow Analysis
[Are steps logical and smooth? Any ordering issues?]

### Dependency Chain
| Step | Produces | Next Step Needs | Status |
|------|----------|-----------------|--------|
| Phase 1 | X, Y | Y, Z | OK / Gap: Z not created |

### Potential Surprises
- **[Severity]**: Description of gotcha or hidden assumption

### Verified Against Codebase
- [x] Item confirmed in codebase
- [ ] Item NOT found - needs attention

### Issues Found
| Issue | Location | Impact | Fix |
|-------|----------|--------|-----|
| Description | Phase/Step | High/Med/Low | How to fix |

### Recommendations
1. Specific actionable fix
2. Specific actionable fix
```

---

### Step 10: Prompt for Action

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
