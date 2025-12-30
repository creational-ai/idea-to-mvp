#!/bin/bash
# Deploy both blueprint and dev-cycle skills to ~/.claude/
# Usage: ./deploy.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLUEPRINT_SKILL_DIR="$HOME/.claude/skills/blueprint"
DEVCYCLE_SKILL_DIR="$HOME/.claude/skills/dev-cycle"
OLD_SKILL_DIR="$HOME/.claude/skills/idea-to-mvp"
COMMANDS_DIR="$HOME/.claude/commands"

echo "=============================================="
echo "Deploying idea-to-mvp skills..."
echo "=============================================="
echo ""

# Clean up old idea-to-mvp skill if it exists
if [ -d "$OLD_SKILL_DIR" ]; then
    echo "--- Removing old idea-to-mvp skill ---"
    rm -rf "$OLD_SKILL_DIR"
    echo "  ✓ Removed $OLD_SKILL_DIR"
    echo ""
fi

# Create target directories
mkdir -p "$BLUEPRINT_SKILL_DIR"
mkdir -p "$DEVCYCLE_SKILL_DIR"
mkdir -p "$COMMANDS_DIR"

# Deploy blueprint skill
echo "--- Deploying blueprint skill ---"
echo "Target: $BLUEPRINT_SKILL_DIR"

cp "$SCRIPT_DIR/blueprint/SKILL.md" "$BLUEPRINT_SKILL_DIR/"
echo "  ✓ Copied SKILL.md"

mkdir -p "$BLUEPRINT_SKILL_DIR/assets/templates"
cp -r "$SCRIPT_DIR/blueprint/assets/templates/"* "$BLUEPRINT_SKILL_DIR/assets/templates/"
echo "  ✓ Copied assets/templates/"

mkdir -p "$BLUEPRINT_SKILL_DIR/references"
cp -r "$SCRIPT_DIR/blueprint/references/"* "$BLUEPRINT_SKILL_DIR/references/"
echo "  ✓ Copied references/"

echo ""

# Deploy dev-cycle skill
echo "--- Deploying dev-cycle skill ---"
echo "Target: $DEVCYCLE_SKILL_DIR"

cp "$SCRIPT_DIR/dev-cycle/SKILL.md" "$DEVCYCLE_SKILL_DIR/"
echo "  ✓ Copied SKILL.md"

mkdir -p "$DEVCYCLE_SKILL_DIR/assets/templates"
cp -r "$SCRIPT_DIR/dev-cycle/assets/templates/"* "$DEVCYCLE_SKILL_DIR/assets/templates/"
echo "  ✓ Copied assets/templates/"

mkdir -p "$DEVCYCLE_SKILL_DIR/references"
cp -r "$SCRIPT_DIR/dev-cycle/references/"* "$DEVCYCLE_SKILL_DIR/references/"
echo "  ✓ Copied references/"

echo ""

# Deploy global commands
echo "--- Deploying global commands ---"
echo "Target: $COMMANDS_DIR"

if [ -d "$SCRIPT_DIR/commands" ]; then
    cp -r "$SCRIPT_DIR/commands/"* "$COMMANDS_DIR/"
    echo "  ✓ Copied all commands"
fi

echo ""
echo "=============================================="
echo "✓ Deployment complete!"
echo "=============================================="
echo ""
echo "Deployed to:"
echo "  blueprint:  $BLUEPRINT_SKILL_DIR"
echo "  dev-cycle:  $DEVCYCLE_SKILL_DIR"
echo "  commands:   $COMMANDS_DIR"
echo ""
