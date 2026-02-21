# Installing Superpowers for Factory Droid CLI

This guide helps you set up Superpowers workflow framework in the Factory Droid CLI environment.

## Overview

Superpowers is a comprehensive software development workflow framework that provides:
- Systematic brainstorming and design workflows
- Test-driven development (TDD) practices
- Structured planning and implementation
- Code review and quality assurance

## Prerequisites

- Factory Droid CLI installed
- Git installed
- Bash shell (macOS/Linux) or WSL (Windows)

## Installation Steps

### 1. Clone Superpowers Repository

```bash
git clone https://github.com/obra/superpowers.git ~/.factory/superpowers
```

### 2. Link Superpowers Skill

Create a symlink to make Superpowers available as a Droid skill:

```bash
mkdir -p ~/.factory/skills
ln -sf ~/.factory/superpowers/.factory/skills/superpowers ~/.factory/skills/superpowers
```

### 3. Link Additional Superpowers Skills

Superpowers includes many workflow-specific skills. Link them all:

```bash
# Core workflow skills
for skill in brainstorming writing-plans executing-plans test-driven-development systematic-debugging using-git-worktrees finishing-a-development-branch requesting-code-review receiving-code-review verification-before-completion subagent-driven-development dispatching-parallel-agents; do
  if [ -d "$HOME/.factory/superpowers/skills/$skill" ]; then
    ln -sf "$HOME/.factory/superpowers/skills/$skill" "$HOME/.factory/skills/superpowers-$skill"
  fi
done
```

### 4. Verify Installation

Run the verification script:

```bash
bash ~/.factory/superpowers/.factory/scripts/verify-install.sh
```

## Usage

Once installed, Superpowers works automatically when you use Droid CLI:

1. **Start a task**: Simply tell Droid what you want to build or fix
2. **Automatic skill detection**: Superpowers will detect relevant workflows
3. **Follow the process**: The framework guides you through brainstorming, planning, implementation, and review

### Example Workflow

```
You: I want to add a user authentication feature to my app

Droid: [Uses Superpowers brainstorming skill]
  Let me help you design this feature. First, let me understand your requirements...
  
  [Follows systematic design process]
  
  Here's my proposed approach:
  1. Option A: JWT-based authentication
  2. Option B: Session-based authentication
  3. Option C: OAuth integration

You: Let's go with Option A

Droid: [Uses Superpowers planning skill]
  Great! Now I'll create a detailed implementation plan...
  
  [Creates bite-sized tasks]
  
  Task 1: Set up JWT library
  Task 2: Create auth middleware
  Task 3: Implement login endpoint
  ...

Droid: [Uses Superpowers TDD skill]
  Now let's implement using test-driven development...
  
  [RED-GREEN-REFACTOR cycle]
```

## Available Skills

Superpowers provides these workflow skills:

- **superpowers/brainstorming** - Systematic design and requirements gathering
- **superpowers/writing-plans** - Create detailed implementation plans
- **superpowers/executing-plans** - Execute plans with checkpoints
- **superpowers/test-driven-development** - RED-GREEN-REFACTOR workflow
- **superpowers/systematic-debugging** - Methodical debugging process
- **superpowers/using-git-worktrees** - Parallel development branches
- **superpowers/finishing-a-development-branch** - Merge/PR workflows
- **superpowers/requesting-code-review** - Self-review checklists
- **superpowers/receiving-code-review** - Handle feedback
- **superpowers/verification-before-completion** - Verify fixes
- **superpowers/subagent-driven-development** - Parallel subagent workflows
- **superpowers/dispatching-parallel-agents** - Coordinate multiple agents

## Project Structure

```
~/.factory/
├── superpowers/                    # Superpowers repository
│   ├── .factory/
│   │   ├── skills/superpowers/     # Main skill entry point
│   │   ├── scripts/                # Installation scripts
│   │   └── INSTALL.md              # This file
│   └── skills/                     # All workflow skills
│
├── skills/
│   ├── superpowers -> ~/.factory/superpowers/.factory/skills/superpowers
│   ├── superpowers-brainstorming -> ~/.factory/superpowers/skills/brainstorming
│   ├── superpowers-writing-plans -> ~/.factory/superpowers/skills/writing-plans
│   └── ... (other skills)
│
└── plugins/                          # Droid plugins (if any)
```

## Troubleshooting

### Skills not found

1. Check symlinks exist:
   ```bash
   ls -la ~/.factory/skills/
   ```

2. Verify target directories exist:
   ```bash
   ls ~/.factory/superpowers/skills/
   ```

3. Re-create symlinks:
   ```bash
   ~/.factory/superpowers/.factory/scripts/init-superpowers.sh
   ```

### Superpowers not activating

1. Verify installation:
   ```bash
   ~/.factory/superpowers/.factory/scripts/verify-install.sh
   ```

2. Restart Droid CLI session

3. Try explicitly: "use superpowers skill"

## Updating

To update Superpowers to the latest version:

```bash
cd ~/.factory/superpowers
git pull
```

Skills are symlinked, so updates are immediate.

## Uninstalling

Remove the symlinks and clone:

```bash
# Remove skill symlinks
rm ~/.factory/skills/superpowers*

# Remove repository
rm -rf ~/.factory/superpowers
```

## Getting Help

- **Issues**: https://github.com/obra/superpowers/issues
- **Documentation**: https://github.com/obra/superpowers/blob/main/README.md
- **Skill Guide**: https://github.com/obra/superpowers/blob/main/skills/writing-skills/SKILL.md

## License

MIT License - see LICENSE file for details
