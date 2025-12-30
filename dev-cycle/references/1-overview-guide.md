# Overview Guide (Stage 1)

## Goal
Analyze features, bugs, issues, or milestones and plan how to address them through structured implementation.

## Code Allowed
NO

## When This Stage Happens

This stage is **user-initiated**:

1. **User discovers new requirement**: "I found an issue/feature we need to handle"
2. **User requests analysis**: "Are there any new features/issues we should address?"

**Important**: This is NOT automatic. Claude should only create an overview when explicitly asked by the user.

## Input
- Understanding of current architecture (from implemented work)
- New feature or issue identified
- Existing `[idea]-poc-plan.md` (if applicable)

## Process

### 1. Document Current Architecture

**What to capture:**
- What components/systems exist today
- How they currently work
- Current dependencies and integrations
- Limitations or constraints

**Example:**
```
### Current Architecture (Supabase-Specific)

**1. Database Client**
- Uses Supabase Python Client directly
- Query builder API: client.table("users").select()
- Hardcoded to Supabase

**2. Dependencies**
from supabase import Client, create_client
```

### 2. Define Target Architecture

**What to capture:**
- Desired end state
- How it should work
- What changes from current
- Configuration or extensibility points

**Example:**
```
### Target Architecture (Database-Agnostic)

**1. Abstraction Layer**
- Protocol-based interface
- Pluggable implementations (Supabase, PostgreSQL, etc.)
- Configuration-driven provider selection
```

### 3. Identify What Needs to Change

**Break down by component/file:**
- Which files need modification
- What currently exists (code examples)
- What should exist (proposed code)
- How to verify changes work

**Be specific:**
```
#### `core/db.py`
**Current**: Returns Supabase Client
def get_client() -> Client:
    # Supabase-specific

**New**: Factory pattern with abstraction
def get_client() -> DatabaseClient:
    # Returns adapter based on config
```

### 4. Break Down into Self-Contained PoCs

**Critical requirement**: Each PoC must be self-contained and **production-grade**

**Why self-contained matters:**
- Each PoC is complete within its scope (doesn't need non-dependent PoCs to work)
- System remains functional between PoCs (no breaking changes to existing functionality/tests)
- Prevents cascading failures
- Clearly shows what it proves and what capabilities it opens up for dependent PoCs
- Safe to pause work at any PoC boundary

**Strategy: Add Alongside, Don't Replace**

When new capability could break existing code:
```python
# ❌ BAD - Breaks existing code
def get_client() -> NewType:  # Changes return type
    # New implementation

# ✅ GOOD - Add alongside
def get_client() -> OldType:  # Keep unchanged
    # Existing implementation

def get_new_client() -> NewType:  # Add new
    # New implementation
```

**Note**: Examples shown in Python. Apply the same "add alongside, don't replace" principle in your language.

**PoC structure example:**
```
PoC N: Create abstraction layer
- Keep get_client() unchanged (Supabase)
- Add get_db_adapter() (new abstraction)
- Why: Existing tools keep working during PoC N

PoC N+1: Refactor tools to use abstraction
- Update tools to use get_db_adapter()
- Test with both providers
- Why: Now self-contained with abstraction

PoC N+2: Production deployment
- Deploy to AWS RDS
- Verify in production
```

### 5. Evaluate Implementation Approaches

**Compare options:**
- List 2-4 viable approaches
- For each: Pros, Cons
- Recommend one with rationale

**Example:**
```
### Option A: Adapter Pattern
Pros: Simple, type-safe, flexible
Cons: Manual implementation per provider

### Option B: ORM (SQLAlchemy)
Pros: Industry standard, feature-rich
Cons: Heavier dependency, more complex

Recommended: Option A - Adapter Pattern
Reason: Simpler for our use case, easier to optimize
```

### 6. Document Design Decisions

**Capture key decisions:**
- ✅ What was decided
- Why that choice was made
- What alternatives were considered

**Example:**
```
1. ✅ Connection pooling: Deferred to later PoC
   - Simple connection OK for PoC N
   - Add pooling when performance demands it

2. ✅ CRUD operations: Implement all 4 upfront
   - Complete abstraction layer
   - Prevents partial implementation
```

### 7. Update Plan

**Final critical step:**
- Add new work items to `[idea]-poc-plan.md`
- **DO NOT renumber existing items** - just add new sequential numbers (e.g., if last item is #5, new items are #6, #7, #8)
- Update dependency graph to show where new items fit
- Verify dependencies still make sense

## Output

Two documents:

1. **Overview**: `docs/[name]-overview.md` using `assets/templates/overview.md`
   - Executive summary
   - Current vs target architecture
   - What needs to change
   - Work item breakdown
   - Implementation approaches
   - Risks and mitigations
   - Design decisions

2. **Updated Plan**: `[idea]-poc-plan.md`
   - Incorporate new work items
   - Add new sequential numbers
   - Maintain dependency graph

## Verification Checklist

- [ ] Overview document created with all sections
- [ ] Current architecture documented with code examples
- [ ] Target architecture clearly defined
- [ ] All files requiring changes identified
- [ ] Each new PoC is self-contained (works independently, doesn't break existing functionality/tests)
- [ ] PoC dependency order makes sense
- [ ] Implementation approaches evaluated
- [ ] Recommended approach selected with rationale
- [ ] Risks identified with mitigations
- [ ] Design decisions documented
- [ ] `[idea]-poc-plan.md` updated with new work items

## Common Pitfalls

- **Forgetting self-contained requirement**: Each work item must work independently
- **Breaking changes**: Use "add alongside" strategy, not "replace"
- **Vague definitions**: Be specific about what each item proves
- **Missing dependencies**: Ensure prerequisites are clear
- **Skipping plan update**: Must update plan with new work items

## Next Stage

→ Stage 2: Implementation Planning (use 2-planning-guide.md)
