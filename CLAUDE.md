# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Claude Code skill ("idea-to-mvp") that provides a structured workflow for taking ideas from concept to working product through 6 stages.

## Stage Workflow

| Stage | Code Allowed | Purpose |
|-------|--------------|---------|
| 1. Concept | NO | Refine idea into North Star doc |
| 2. Design | NO | Technical architecture |
| 3. Research | NO | Market validation |
| 4. PoC Planning | NO | Define what to prove and in what order |
| 4b. PoC Implementation | YES | Break PoC into bite-sized steps |
| 5. PoC Execution | YES | Implement one step at a time |
| 6. MVP | YES | Combine proven PoCs |

## Critical Rules

**Stages 1-4 are NO-CODE zones.** If asked to write code in these stages, respond with: "We're in the [stage] stage — let's keep focus on [architecture/design/validation/planning]. Code comes in Stage 4b and beyond."

**Stage 4b+**: Code is allowed. Include concrete snippets, commands, configs.

**One PoC at a time**: Only plan/execute one PoC before moving to the next. Learnings often change subsequent plans.

**One step at a time**: In Stage 5, work through implementation steps sequentially with verification after each.

## Key Commands

```bash
# Run tests for a specific step
uv run pytest tests/test_stepN_*.py -v

# Run all tests
uv run pytest tests/ -v
```

## Slash Command

`/small-win-check` - Run after completing PoC milestones to assess alignment with North Star vision, gaps, and recommendations.

## File Structure

- `docs/` - Project artifacts (concept.md, design.md, poc-plan.md, results)
- `PoC/` - Implementation scripts (stepN_[description].py)
- `tests/` - pytest tests (test_stepN_[description].py)
- `PROJECT_STATE.md` - Current project status (update after each step)
- `assets/templates/` - Templates for docs
- `references/` - Detailed stage reference docs

## Step Naming Convention

| Pattern | Use |
|---------|-----|
| `step1_[description].py` | Main steps |
| `step3a_[description].py` | Sub-steps |
| `step4_1_[alternative].py` | Alternative approaches |

## Production-Grade Requirements

PoCs must be thin vertical slices of production architecture:
- Real integrations (actual APIs, databases), not mocks
- Code that could ship with more features added
- Patterns that scale
- Config externalized (no hardcoded secrets)
