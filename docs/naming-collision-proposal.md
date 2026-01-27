# Naming Collision Proposal

## Problem

There's a naming collision between:

| Current Name | Type | Purpose |
|--------------|------|---------|
| `dev-design` | SKILL | Project-level design (Idea → Executable Plan) |
| `/dev-design` | COMMAND (in dev-cycle) | Task-level design (Stage 1 of dev-cycle) |

**From Claude Code docs**: "If a skill and command share the same name, the skill takes precedence."

When user runs `/dev-design`, Claude loads the **dev-design SKILL** instead of the **dev-cycle /dev-design COMMAND**.

---

## Solution Options

### Option 1: `design` + `dev` (CHOSEN)

```
dev-design skill → design
dev-cycle skill  → dev

Commands unchanged:
  /design-northstar, /design-architecture, ...
  /dev-design, /dev-plan, /dev-execute, ...
```

| Pros | Cons |
|------|------|
| Minimal changes (just skill names) | `dev` is generic (collision risk) |
| Commands stay as-is | |
| `/dev-*` matches skill name exactly | |

### Option 2: `design` + `develop`

```
dev-design skill → design
dev-cycle skill  → develop

Commands renamed:
  /design-northstar, /design-architecture, ...
  /develop-design, /develop-plan, /develop-execute, ...
```

| Pros | Cons |
|------|------|
| Parallel naming (design/develop) | More changes (rename all commands + agents) |
| Lower collision risk | Longer to type (`/develop-*` vs `/dev-*`) |
| Skill name matches command prefix | Breaks existing muscle memory |

**If chosen later**, would require:
- Rename all `/dev-*` commands to `/develop-*`
- Rename all `dev-*-agent` to `develop-*-agent`
- Update all references in guides, templates, CLAUDE.md

---

## Decision

**Chosen option**: Option 1 (`design` + `dev`)

**Rationale**:
1. Simple, intuitive names
2. Commands stay as-is - no user retraining
3. Minimal changes required
4. `/dev-*` prefix matches skill name exactly
5. Clear mental model: design (plan) → dev (build)

---

## Final State

| Skill | Purpose | Command Prefix |
|-------|---------|----------------|
| `design` | Idea → Executable Plan | `/design-*` |
| `dev` | Plan → Working Code | `/dev-*` |

**design commands**:
- `/design-northstar`
- `/design-architecture`
- `/design-milestones-overview`
- `/design-milestone-design`
- `/design-poc-design`

**dev commands**:
- `/dev-design`
- `/dev-plan`
- `/dev-execute`
- `/dev-diagram`
- `/dev-lessons`
- `/dev-finalize`
- `/dev-health`

---

## Implementation Steps

1. Rename `claude-code/dev-design/` → `claude-code/design/`
2. Rename `claude-code/dev-cycle/` → `claude-code/dev/`
3. Update SKILL.md `name:` field in both skills
4. Update deploy.sh to deploy `design` and `dev` instead of `dev-design` and `dev-cycle`
5. Update CLAUDE.md and README.md references
6. Remove old deployed skills:
   - `~/.claude/skills/dev-design/`
   - `~/.claude/skills/dev-cycle/`
7. Deploy new skills and test all commands

---

## Naming Convention Guidelines

To prevent future collisions:

### Rule 1: Skill Name ≠ Any Command Name

Never name a command the same as any skill in the suite.

### Rule 2: Commands Namespaced to Skill

Each skill's commands should have a consistent prefix.

| Skill | Command Prefix |
|-------|----------------|
| `design` | `/design-*` |
| `dev` | `/dev-*` |
| `market-research` | `/market-*` |

### Rule 3: Avoid Generic Single-Word Commands

```
❌ /design, /plan, /execute
✅ /design-northstar, /dev-plan, /dev-execute
```

### Rule 4: Document Reserved Names

Maintain a registry in README:

```
Reserved Skill Names: design, dev, market-research
Reserved Command Prefixes: /design-*, /dev-*, /market-*
```
