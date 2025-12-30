#!/bin/bash
# Verify dev-design + dev-cycle skills are deployed correctly
# Usage: ./verify.sh

DEVDESIGN_SKILL_DIR="$HOME/.claude/skills/dev-design"
DEVCYCLE_SKILL_DIR="$HOME/.claude/skills/dev-cycle"
OLD_SKILL_DIR="$HOME/.claude/skills/idea-to-mvp"
OLD_BLUEPRINT_DIR="$HOME/.claude/skills/blueprint"
COMMANDS_DIR="$HOME/.claude/commands"

PASS_COUNT=0
FAIL_COUNT=0

echo "=============================================="
echo "Verifying deployment..."
echo "=============================================="
echo ""

# Helper functions
pass() {
    echo "  ✅ $1"
    ((PASS_COUNT++))
}

fail() {
    echo "  ❌ $1"
    ((FAIL_COUNT++))
}

# Check old skills are removed
echo "--- Checking old skills removed ---"
if [ ! -d "$OLD_SKILL_DIR" ]; then
    pass "idea-to-mvp skill removed"
else
    fail "idea-to-mvp skill still exists at $OLD_SKILL_DIR"
fi

if [ ! -d "$OLD_BLUEPRINT_DIR" ]; then
    pass "blueprint skill removed"
else
    fail "blueprint skill still exists at $OLD_BLUEPRINT_DIR"
fi

echo ""

# Check dev-design skill
echo "--- Checking dev-design skill ---"
if [ -d "$DEVDESIGN_SKILL_DIR" ]; then
    pass "dev-design directory exists"

    if [ -f "$DEVDESIGN_SKILL_DIR/SKILL.md" ]; then
        pass "SKILL.md exists"

        # Check title
        if head -1 "$DEVDESIGN_SKILL_DIR/SKILL.md" | grep -q "^# dev-design"; then
            pass "SKILL.md has correct title"
        else
            fail "SKILL.md title is incorrect"
        fi
    else
        fail "SKILL.md missing"
    fi

    if [ -d "$DEVDESIGN_SKILL_DIR/assets/templates" ]; then
        pass "assets/templates/ exists"

        # Check templates
        for template in north-star.md architecture.md poc-design.md; do
            if [ -f "$DEVDESIGN_SKILL_DIR/assets/templates/$template" ]; then
                pass "Template $template exists"
            else
                fail "Template $template missing"
            fi
        done
    else
        fail "assets/templates/ missing"
    fi

    if [ -d "$DEVDESIGN_SKILL_DIR/references" ]; then
        pass "references/ exists"

        # Check reference guides
        for guide in 1-north-star-guide.md 2-architecture-guide.md 3-research-guide.md 4-poc-design-guide.md; do
            if [ -f "$DEVDESIGN_SKILL_DIR/references/$guide" ]; then
                pass "Reference $guide exists"
            else
                fail "Reference $guide missing"
            fi
        done
    else
        fail "references/ missing"
    fi
else
    fail "dev-design directory missing at $DEVDESIGN_SKILL_DIR"
fi

echo ""

# Check dev-cycle skill
echo "--- Checking dev-cycle skill ---"
if [ -d "$DEVCYCLE_SKILL_DIR" ]; then
    pass "dev-cycle directory exists"

    if [ -f "$DEVCYCLE_SKILL_DIR/SKILL.md" ]; then
        pass "SKILL.md exists"

        # Check title
        if head -1 "$DEVCYCLE_SKILL_DIR/SKILL.md" | grep -q "^# dev-cycle"; then
            pass "SKILL.md has correct title"
        else
            fail "SKILL.md title is incorrect"
        fi
    else
        fail "SKILL.md missing"
    fi

    if [ -d "$DEVCYCLE_SKILL_DIR/assets/templates" ]; then
        pass "assets/templates/ exists"

        # Check templates
        for template in overview.md implementation-plan.md implementation-results.md PROJECT_STATE.md; do
            if [ -f "$DEVCYCLE_SKILL_DIR/assets/templates/$template" ]; then
                pass "Template $template exists"
            else
                fail "Template $template missing"
            fi
        done
    else
        fail "assets/templates/ missing"
    fi

    if [ -d "$DEVCYCLE_SKILL_DIR/references" ]; then
        pass "references/ exists"

        # Check reference guides
        for guide in 1-overview-guide.md 2-planning-guide.md 3-execution-guide.md; do
            if [ -f "$DEVCYCLE_SKILL_DIR/references/$guide" ]; then
                pass "Reference $guide exists"
            else
                fail "Reference $guide missing"
            fi
        done
    else
        fail "references/ missing"
    fi
else
    fail "dev-cycle directory missing at $DEVCYCLE_SKILL_DIR"
fi

echo ""

# Check commands
echo "--- Checking global commands ---"
if [ -d "$COMMANDS_DIR" ]; then
    pass "commands directory exists"

    # Check dev-design commands
    for cmd in design-northstar.md design-architecture.md design-research.md design-poc-design.md; do
        if [ -f "$COMMANDS_DIR/$cmd" ]; then
            pass "Command $cmd exists"
        else
            fail "Command $cmd missing"
        fi
    done

    # Check dev-cycle commands
    for cmd in dev-overview.md dev-plan.md dev-execute.md; do
        if [ -f "$COMMANDS_DIR/$cmd" ]; then
            pass "Command $cmd exists"
        else
            fail "Command $cmd missing"
        fi
    done

    # Check utility commands
    for cmd in verify-doc.md small-win-check.md; do
        if [ -f "$COMMANDS_DIR/$cmd" ]; then
            pass "Command $cmd exists"
        else
            fail "Command $cmd missing"
        fi
    done
else
    fail "commands directory missing at $COMMANDS_DIR"
fi

echo ""
echo "=============================================="
echo "Verification Summary"
echo "=============================================="
echo "  ✅ Passed: $PASS_COUNT"
echo "  ❌ Failed: $FAIL_COUNT"
echo ""

if [ $FAIL_COUNT -eq 0 ]; then
    echo "🎉 All checks passed! Deployment is correct."
    exit 0
else
    echo "⚠️  Some checks failed. Please review the output above."
    exit 1
fi
