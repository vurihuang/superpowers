#!/bin/bash
# Superpowers Installation Verification Script for Factory Droid CLI

echo "🔍 Verifying Superpowers installation for Factory Droid CLI..."
echo ""

# Configuration
FACTORY_DIR="${HOME}/.factory"
SUPERPOWERS_DIR="${FACTORY_DIR}/superpowers"
SKILLS_DIR="${FACTORY_DIR}/skills"
ERRORS=0
WARNINGS=0

# Check superpowers repository exists
if [ ! -d "$SUPERPOWERS_DIR" ]; then
    echo "❌ Superpowers repository not found: $SUPERPOWERS_DIR"
    echo "   Fix: git clone https://github.com/obra/superpowers.git ~/.factory/superpowers"
    exit 1
fi
echo "✅ Superpowers repository found"

# Check main skill directory exists
if [ ! -d "$SKILLS_DIR" ]; then
    echo "❌ Skills directory not found: $SKILLS_DIR"
    ERRORS=$((ERRORS + 1))
else
    echo "✅ Skills directory exists"
fi

# Check main superpowers skill link
if [ -L "$SKILLS_DIR/superpowers" ] || [ -d "$SKILLS_DIR/superpowers" ]; then
    echo "✅ Main superpowers skill linked"
else
    echo "❌ Main superpowers skill not linked"
    ERRORS=$((ERRORS + 1))
fi

# Check core workflow skills
CORE_SKILLS=(
    "brainstorming"
    "writing-plans"
    "test-driven-development"
    "systematic-debugging"
)

echo ""
echo "Checking core workflow skills:"
for skill in "${CORE_SKILLS[@]}"; do
    skill_path="$SKILLS_DIR/superpowers-$skill"
    if [ -L "$skill_path" ] || [ -d "$skill_path" ]; then
        echo "  ✅ superpowers-$skill"
    else
        echo "  ⚠️  superpowers-$skill (missing)"
        WARNINGS=$((WARNINGS + 1))
    fi
done

# Check SKILL.md files exist
echo ""
echo "Checking SKILL.md files:"
if [ -f "$SKILLS_DIR/superpowers/SKILL.md" ]; then
    echo "  ✅ Main superpowers SKILL.md"
else
    echo "  ❌ Main superpowers SKILL.md missing"
    ERRORS=$((ERRORS + 1))
fi

# Check if using-superpowers skill exists (important reference skill)
if [ -d "$SUPERPOWERS_DIR/skills/using-superpowers" ]; then
    echo "  ✅ using-superpowers skill exists in repo"
else
    echo "  ⚠️  using-superpowers skill not found in repo"
    WARNINGS=$((WARNINGS + 1))
fi

echo ""

# Summary
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo "🎉 All checks passed! Superpowers is properly installed."
    echo ""
    echo "To use Superpowers:"
    echo "  1. Start a new Droid CLI session"
    echo "  2. Try: 'use superpowers skill'"
    echo "  3. Or simply start working on a task - Superpowers will guide you"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo "⚠️  Installation has $WARNINGS warning(s), but core functionality should work."
    echo ""
    echo "To fix warnings, run:"
    echo "  bash ~/.factory/superpowers/.factory/scripts/init-superpowers.sh"
    exit 0
else
    echo "❌ Found $ERRORS error(s) and $WARNINGS warning(s)."
    echo ""
    echo "To fix, run the initialization script:"
    echo "  bash ~/.factory/superpowers/.factory/scripts/init-superpowers.sh"
    exit 1
fi
