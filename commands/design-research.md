# /design-research

Validate market fit and competitive landscape.

## What This Does

Stage 3 of dev-design: Research competitors and validate market assumptions.

## Resources

**Read these for guidance**:
- `~/.claude/skills/dev-design/SKILL.md` - See "Stage 3: Research" section
- `~/.claude/skills/dev-design/references/3-research-guide.md` - Detailed process

## Input

**First argument (required):**
- Path to architecture doc (e.g., `core-architecture.md`, `docs/core-architecture.md`)

**User notes (optional):**
```
{{notes}}
```

**Required files to read:**
- `north-star.md` - For context
- `[name]-architecture.md` - The architecture to research

**Files that will be updated:**
- `north-star.md` - Updated with market validation
- `[name]-architecture.md` - Updated with competitive insights

## Key Requirements

⛔ **NO CODE** - This is research only (market analysis, competitive analysis)

**Input Required**:
- North Star doc (`north-star.md`)
- Architecture doc (`[name]-architecture.md`)

## Process

Follow the guidance in `3-research-guide.md`:
1. Research competitors
2. Identify market gaps
3. Validate pricing assumptions
4. Assess technical differentiation
5. Multiple research passes to fine-tune

## Fast-Track Option

If research already exists (from prior sessions, reference docs, or external sources):
1. Review existing research docs for coverage
2. Verify all checklist items are addressed
3. Note source: "Research validated via [reference docs]"
4. Proceed to Stage 4

## Output

Updates to `north-star.md` and `[name]-architecture.md` with market analysis.

## After Completion

Make go/no-go decision based on research, then proceed to Stage 4: PoC Design.
