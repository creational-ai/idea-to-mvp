# Planning Guide (Stage 2)

## Goal
Break the work item (PoC, feature, bug fix) into bite-sized, production-grade implementation steps.

## Code Allowed
YES

## ⚠️ ONE WORK ITEM AT A TIME

Only generate implementation plan for:
- The next logical work item (based on dependency graph), OR
- The specific item you explicitly choose

**Why one at a time?**
- Learnings from one work item often change subsequent items
- Keeps planning nimble and agile
- Avoids wasted effort on plans that become obsolete

## Input
- Single work item from `[name]-poc-design.md` OR feature/bug to implement

## Process
1. List all prerequisites (setup Supabase, configure AWS, API keys, etc.)
2. Break implementation into bite-sized steps (max 30 min each)
3. Define verification for EACH step (not just end result)
4. Include specific code snippets, commands, configs
5. Identify what makes this "production-grade" vs "demo"

## Output

Two documents are created:

1. **Implementation Plan**: `docs/[name]-implementation.md` using `assets/templates/implementation-plan.md`
   - Prerequisites with setup instructions
   - Step-by-step implementation guide
   - Code snippets, commands, configs
   - Verification commands
   - **NO status indicators** - keep it clean and focused on "how to implement"

2. **Results Tracking**: `docs/[name]-results.md`
   - Prerequisites completion status (✅ / ⏳)
   - Step-by-step progress tracking
   - Test results and counts
   - Issues encountered
   - Bug fixes
   - Files created/modified checklist

**Why two documents?**
- Implementation doc = Evergreen guide (pure "how to do it")
- Results doc = Live progress tracking (specific to this execution)
- Keeps documentation clean, focused, and easy to maintain

## Verification Checklist
- [ ] Implementation doc created (`docs/[name]-implementation.md`)
- [ ] Results doc created (`docs/[name]-results.md`)
- [ ] Prerequisites explicitly listed with setup instructions
- [ ] Each step is small enough to verify independently
- [ ] Each step has clear verification criteria (with code)
- [ ] No step relies on mock data where real data is needed
- [ ] Implementation would work in production context
- [ ] Implementation doc contains NO status indicators (keep it clean)
- [ ] **PoC is self-contained** - fully functional without requiring future PoCs

## What CODE IS Allowed

Unlike Stage 1, implementation planning gets into specifics:
- Concrete code snippets for each step
- Specific function signatures
- Exact commands to run
- Configuration examples
- Test code structure

## Code Quality Principles

**Write production-grade, maintainable code from the start:**

### Object-Oriented Design
- **Classes over functions**: Encapsulate related behavior and state
- **Single Responsibility**: Each class has one clear purpose
- **Composition**: Build complex behavior from simple, composable classes
- **Clear interfaces**: Public methods are intuitive and well-documented

### Strong Typing with Pydantic
- **Use Pydantic models** for all data structures (configs, API payloads, database records)
- **Type everything**: All function signatures, class attributes, variables
- **Validation built-in**: Pydantic handles validation, serialization, and documentation
- **No dictionaries for structured data**: Use Pydantic models instead

**Example - Good OOP with Pydantic:**
```python
from pydantic import BaseModel, Field
from typing import Optional

class UserConfig(BaseModel):
    """User configuration with validation."""
    username: str = Field(..., min_length=3, max_length=50)
    email: str
    age: Optional[int] = Field(None, ge=0, le=150)

class UserService:
    """Handles user operations."""

    def __init__(self, config: UserConfig):
        self.config = config

    def validate_user(self) -> bool:
        """Validate user meets requirements."""
        return len(self.config.username) >= 3
```

**Example - Avoid:**
```python
# ❌ Weak typing, no validation
def process_user(user_dict: dict) -> dict:
    username = user_dict.get("username", "")
    # No validation, error-prone
    return {"status": "ok"}
```

## Step Size Guidelines

Each step should be:
- **Completable in ~30 minutes or less**
- **Independently verifiable** (you can prove it works)
- **Self-contained** (doesn't require other steps to test)

If a step is too big, break it into sub-steps (3a, 3b, 3c).

## Self-Contained PoC Requirement

**CRITICAL**: Each PoC must be complete and functional on its own.

### What "Self-Contained" Means

✅ **Good - PoC works independently:**
- All existing functionality continues working after PoC completes
- New capability can be tested/verified immediately
- No "TODO: will work after PoC N+1" comments
- Tests pass at end of PoC

❌ **Bad - PoC breaks things:**
- Existing features stop working
- "This will work once we complete PoC 9" comments
- Tests fail until future PoC
- System non-functional between PoCs

### Strategy: Add Alongside, Don't Replace

When implementing something that could break existing code:

**Don't do this:**
```python
# Replaces existing function (breaks old callers)
def get_client() -> NewType:
    # New implementation
```

**Do this instead:**
```python
# Keep old function working
def get_client() -> OldType:
    # Existing implementation unchanged

# Add new function alongside
def get_new_client() -> NewType:
    # New implementation
```

**Note**: Examples shown in Python. Apply the same "add alongside, don't replace" principle in your language.

**Migration happens in next PoC**, not this one.

## Production-Grade Checklist

For each step, ensure:
- [ ] **OOP Design**: Classes with single responsibility, clear interfaces
- [ ] **Pydantic Models**: All data structures use Pydantic (no raw dicts for structured data)
- [ ] **Strong Typing**: Type hints on all functions, methods, and attributes
- [ ] No mock data where real data is needed
- [ ] Real integrations, not stubs
- [ ] Error handling included
- [ ] Would work at 10x scale
- [ ] Tests can be written
- [ ] No breaking changes to existing functionality

## Common Pitfalls
- Steps that are too large
- Missing prerequisites
- No verification criteria
- Mock data that hides real complexity
- Skipping error handling
- **Using raw dicts instead of Pydantic models** (loses validation, type safety, documentation)
- **Procedural code instead of OOP** (harder to test, maintain, extend)
- **Missing type hints** (reduces IDE support, increases bugs)
- **Breaking self-contained requirement** (add alongside don't replace; PoC must work independently without future PoCs)

## Next Stage
→ Stage 3: Execution (use 3-execution-guide.md)

## After Work Complete
→ Return to Stage 2 for next work item
