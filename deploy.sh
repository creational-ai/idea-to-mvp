#!/bin/bash
# Deploy idea-to-mvp skill to ~/.claude/skills/
# Usage: ./deploy.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$HOME/.claude/skills/idea-to-mvp"
COMMANDS_DIR="$HOME/.claude/commands"

echo "Deploying idea-to-mvp skill..."
echo "Source: $SCRIPT_DIR"
echo "Target: $SKILL_DIR"
echo ""

# Create target directories
mkdir -p "$SKILL_DIR"
mkdir -p "$COMMANDS_DIR"

# Copy skill files
echo "Copying SKILL.md..."
cp "$SCRIPT_DIR/SKILL.md" "$SKILL_DIR/"

echo "Copying assets/templates/..."
mkdir -p "$SKILL_DIR/assets/templates"
cp -r "$SCRIPT_DIR/assets/templates/"* "$SKILL_DIR/assets/templates/"

echo "Copying references/..."
mkdir -p "$SKILL_DIR/references"
cp -r "$SCRIPT_DIR/references/"* "$SKILL_DIR/references/"

# Copy commands to global commands folder
echo "Copying commands to $COMMANDS_DIR..."
if [ -d "$SCRIPT_DIR/commands" ]; then
    cp -r "$SCRIPT_DIR/commands/"* "$COMMANDS_DIR/"
fi

echo ""
echo "Done! Deployed to:"
echo "  Skill: $SKILL_DIR"
echo "  Commands: $COMMANDS_DIR"
echo ""
echo "Final structure:"
echo ""
tree "$HOME/.claude/skills" "$COMMANDS_DIR" 2>/dev/null || {
    echo "~/.claude/skills/"
    find "$HOME/.claude/skills" -print | sed 's|'"$HOME/.claude/skills"'|  |' | sort
    echo ""
    echo "~/.claude/commands/"
    find "$COMMANDS_DIR" -type f -name "*.md" | sed 's|'"$COMMANDS_DIR/"'|  |'
}
