#!/bin/bash
# Superpowers Initialization Script for Factory Droid CLI
# This script sets up the Superpowers workflow skills

set -e

echo "🔋 Initializing Superpowers for Factory Droid CLI..."

# Determine paths
FACTORY_DIR="${HOME}/.factory"
SUPERPOWERS_DIR="${FACTORY_DIR}/superpowers"
SKILLS_DIR="${FACTORY_DIR}/skills"

# Check if superpowers is cloned
if [ ! -d "$SUPERPOWERS_DIR" ]; then
    echo "❌ Superpowers repository not found at $SUPERPOWERS_DIR"
    echo "Please clone it first:"
    echo "  git clone https://github.com/obra/superpowers.git ~/.factory/superpowers"
    exit 1
fi

echo "✅ Superpowers repository found"

# Create skills directory
mkdir -p "$SKILLS_DIR"

# Link main superpowers skill
echo "🔗 Linking superpowers skills..."

# Main entry point skill
if [ -d "$SUPERPOWERS_DIR/.factory/skills/superpowers" ]; then
    ln -sf "$SUPERPOWERS_DIR/.factory/skills/superpowers" "$SKILLS_DIR/superpowers"
    echo "  ✅ superpowers (main skill)"
fi

# Core workflow skills
CORE_SKILLS=(
    "brainstorming"
    "writing-plans"
    "executing-plans"
    "test-driven-development"
    "systematic-debugging"
    "using-git-worktrees"
    "finishing-a-development-branch"
    "requesting-code-review"
    "receiving-code-review"
    "verification-before-completion"
    "subagent-driven-development"
    "dispatching-parallel-agents"
    "using-superpowers"
    "writing-skills"
)

for skill in "${CORE_SKILLS[@]}"; do
    if [ -d "$SUPERPOWERS_DIR/skills/$skill" ]; then
        # Remove old link if exists
        rm -f "$SKILLS_DIR/superpowers-$skill"
        # Create new link
        ln -sf "$SUPERPOWERS_DIR/skills/$skill" "$SKILLS_DIR/superpowers-$skill"
        echo "  ✅ superpowers-$skill"
    fi
done

echo ""
echo "🎉 Superpowers initialization complete!"
echo ""
echo "Available skills:"
ls -1 "$SKILLS_DIR" | grep -E "^superpowers" || echo "  (none found)"
echo ""
echo "Next steps:"
echo "  1. Start a new Droid CLI session"
echo "  2. Try: 'use superpowers skill' or just start working on a task"
echo "  3. The framework will guide you through the workflow"
echo ""
echo "To verify installation:"
echo "  bash ~/.factory/superpowers/.factory/scripts/verify-install.sh"
echo ""
