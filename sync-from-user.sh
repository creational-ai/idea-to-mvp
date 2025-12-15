#!/bin/bash
# Sync changes from ~/.claude/skills/idea-to-mvp/ back to this repo
# Usage: ./sync-from-user.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$HOME/.claude/skills/idea-to-mvp"
COMMANDS_DIR="$HOME/.claude/commands"

echo "Syncing from user directory..."
echo "Source: $SKILL_DIR"
echo "Target: $SCRIPT_DIR"
echo ""

# Check source exists
if [ ! -d "$SKILL_DIR" ]; then
    echo "Error: $SKILL_DIR does not exist"
    exit 1
fi

# Sync skill files
echo "Syncing SKILL.md..."
cp "$SKILL_DIR/SKILL.md" "$SCRIPT_DIR/"

echo "Syncing assets/templates/..."
cp -r "$SKILL_DIR/assets/templates/"* "$SCRIPT_DIR/assets/templates/"

echo "Syncing references/..."
cp -r "$SKILL_DIR/references/"* "$SCRIPT_DIR/references/"

# Sync commands
echo "Syncing commands..."
if [ -f "$COMMANDS_DIR/small-win-check.md" ]; then
    cp "$COMMANDS_DIR/small-win-check.md" "$SCRIPT_DIR/commands/"
fi

echo ""
echo "Done! Synced to $SCRIPT_DIR"
echo ""
echo "Changed files:"
git status --short
