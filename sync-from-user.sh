#!/bin/bash
# Sync changes from ~/.claude/ back to this repo
# Usage: ./sync-from-user.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLUEPRINT_SKILL_DIR="$HOME/.claude/skills/blueprint"
DEVCYCLE_SKILL_DIR="$HOME/.claude/skills/dev-cycle"
COMMANDS_DIR="$HOME/.claude/commands"

echo "=============================================="
echo "Syncing from user directories..."
echo "=============================================="
echo ""

# Check sources exist
if [ ! -d "$BLUEPRINT_SKILL_DIR" ]; then
    echo "Warning: $BLUEPRINT_SKILL_DIR does not exist"
fi

if [ ! -d "$DEVCYCLE_SKILL_DIR" ]; then
    echo "Warning: $DEVCYCLE_SKILL_DIR does not exist"
fi

# Sync blueprint skill
if [ -d "$BLUEPRINT_SKILL_DIR" ]; then
    echo "--- Syncing blueprint skill ---"
    echo "Source: $BLUEPRINT_SKILL_DIR"

    cp "$BLUEPRINT_SKILL_DIR/SKILL.md" "$SCRIPT_DIR/blueprint/"
    echo "  ✓ Synced SKILL.md"

    cp -r "$BLUEPRINT_SKILL_DIR/assets/templates/"* "$SCRIPT_DIR/blueprint/assets/templates/"
    echo "  ✓ Synced assets/templates/"

    cp -r "$BLUEPRINT_SKILL_DIR/references/"* "$SCRIPT_DIR/blueprint/references/"
    echo "  ✓ Synced references/"

    echo ""
fi

# Sync dev-cycle skill
if [ -d "$DEVCYCLE_SKILL_DIR" ]; then
    echo "--- Syncing dev-cycle skill ---"
    echo "Source: $DEVCYCLE_SKILL_DIR"

    cp "$DEVCYCLE_SKILL_DIR/SKILL.md" "$SCRIPT_DIR/dev-cycle/"
    echo "  ✓ Synced SKILL.md"

    cp -r "$DEVCYCLE_SKILL_DIR/assets/templates/"* "$SCRIPT_DIR/dev-cycle/assets/templates/"
    echo "  ✓ Synced assets/templates/"

    cp -r "$DEVCYCLE_SKILL_DIR/references/"* "$SCRIPT_DIR/dev-cycle/references/"
    echo "  ✓ Synced references/"

    echo ""
fi

# Sync global commands
echo "--- Syncing global commands ---"
echo "Source: $COMMANDS_DIR"

mkdir -p "$SCRIPT_DIR/commands"
for cmd in verify-doc.md small-win-check.md dev-overview.md dev-plan.md dev-execute.md; do
    if [ -f "$COMMANDS_DIR/$cmd" ]; then
        cp "$COMMANDS_DIR/$cmd" "$SCRIPT_DIR/commands/"
        echo "  ✓ Synced $cmd"
    fi
done

echo ""
echo "=============================================="
echo "✓ Sync complete!"
echo "=============================================="
echo ""
echo "Synced to: $SCRIPT_DIR"
echo ""
echo "Changed files:"
git status --short
