# /design-poc-design

Define what needs to be proven and in what order — with PRODUCTION-GRADE thin slices.

## What This Does

Stage 4 of dev-design: Plan atomic PoCs with clear success criteria and dependencies.

## Resources

**Read these for guidance**:
- `~/.claude/skills/dev-design/SKILL.md` - See "Stage 4: PoC Design" section
- `~/.claude/skills/dev-design/references/4-poc-design-guide.md` - Detailed process
- `~/.claude/skills/dev-design/assets/templates/poc-design.md` - Output template

## Input

**First argument (required):**
- Path to architecture doc (e.g., `core-architecture.md`, `docs/core-architecture.md`)
- OR path to existing PoC design doc for update mode (e.g., `core-poc-design.md`)

**User notes (optional):**
```
{{notes}}
```

**Mode Detection:**
- If first argument is `*-poc-design.md` and exists → **Update mode** (add new PoCs after implementation discoveries)
- If first argument is `*-architecture.md` → Create mode using this architecture
- Auto-detects if `[name]-poc-design.md` exists when architecture provided

**Output naming:**
- Derives `[name]` from architecture file name
- Creates/updates `[name]-poc-design.md`

## Key Requirements

⛔ **NO CODE** - This is design only (PoC planning, dependencies, success criteria)

## Process

**Create Mode** - Follow the guidance in `4-poc-design-guide.md`:
1. Refine architecture with implementation perspective
2. Identify atomic things to prove (PoCs)
3. Map dependencies between PoCs
4. Create PoC diagram
5. Define success criteria for each PoC

**Update Mode** - When new features/requirements discovered during implementation:
1. Read existing `[name]-poc-design.md`
2. Identify new PoCs needed based on user notes
3. **Append** new PoCs with next sequential numbers (e.g., if last PoC is #5, new ones are #6, #7, #8)
4. Update dependency diagram to show where new PoCs fit
5. **DO NOT renumber** existing PoCs
6. Maintain all existing PoC definitions

## PoC Requirements

Each PoC must be:
- **Atomic**: Proves one specific thing
- **Measurable**: Clear success criteria
- **🔒 Self-contained**: Works independently; doesn't break existing functionality and existing tests

## Output

Create `[name]-poc-design.md` using the template.

## After Completion

Run `/verify-doc [name]-poc-design.md` to validate, then hand off to **dev-cycle** skill for implementation.
