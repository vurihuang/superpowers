---
name: superpowers
description: A comprehensive software development workflow framework that guides through brainstorming, planning, implementation, testing, and code review. Use when starting any development task - creating features, building components, fixing bugs, refactoring code, or planning implementations. This skill establishes systematic workflows including design-first approach, test-driven development, and structured code review processes.
---

# Superpowers - Software Development Workflow Framework

Superpowers is a complete software development methodology that ensures systematic, high-quality code production through structured workflows.

## When to Use This Skill

Use Superpowers for ANY software development task:
- Creating new features or functionality
- Building components or modules
- Fixing bugs or issues
- Refactoring existing code
- Adding tests or documentation
- Planning implementations
- Code review and quality assurance

## Core Principles

1. **Design First**: Never jump into implementation without understanding requirements and creating a design
2. **Test-Driven Development**: Write tests before code (RED-GREEN-REFACTOR)
3. **Bite-Sized Tasks**: Break work into 2-5 minute increments
4. **Systematic Review**: Code review against specifications and quality standards
5. **YAGNI**: Ruthlessly eliminate unnecessary features
6. **DRY**: Don't repeat yourself

## Workflow Overview

```
┌─────────────────┐
│  Brainstorming  │ ← Explore requirements, create design
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Writing Plans  │ ← Break into bite-sized tasks
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Implementation │ ← Execute tasks with TDD
│  + TDD          │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Code Review    │ ← Review against specifications
└─────────────────┘
```

## Integration with Droid CLI Tools

Superpowers works seamlessly with Factory Droid's native tools:

### Tool Mappings

| Superpowers Concept | Droid CLI Tool |
|---------------------|----------------|
| Todo tracking | `TodoWrite` |
| File operations | `Read`, `Edit`, `Create` |
| Code search | `Grep`, `Glob` |
| Execution | `Execute` |
| Subagents | `Task` |
| Research | `WebSearch`, `FetchUrl` |

### Using TodoWrite for Checklists

When a skill includes a checklist, create todos immediately:

```
TodoWrite: {"todos": "1. [pending] Explore project context\n2. [pending] Ask clarifying questions\n3. [pending] Propose approaches\n4. [pending] Present design"}
```

Update status as you progress:
- `[in_progress]` - Currently working on this
- `[completed]` - Done
- `[pending]` - Not started yet

### Accessing Other Superpowers Skills

The superpowers skills are located in the cloned repository. Use them via the Droid CLI skill system:

1. **Direct skill loading**: Use `superpowers/brainstorming`, `superpowers/writing-plans`, etc.
2. **Auto-detection**: The system will automatically detect and suggest relevant skills

## Best Practices

### DO:
- Always start with brainstorming before writing code
- Break tasks into 2-5 minute increments
- Write tests before implementation
- Commit frequently with clear messages
- Review code against specifications
- Use TodoWrite for tracking progress
- Ask one question at a time during brainstorming
- Present 2-3 approaches with trade-offs

### DON'T:
- Skip the design phase
- Write code before tests
- Make assumptions about knowledge
- Combine multiple actions in one step
- Skip the refactor step in TDD
- Present all questions at once
- Skip code review
- Write vague plan steps

## Common Pitfalls

1. **"This is too simple to need a design"**
   - Reality: Simple projects often have hidden complexity
   - Solution: Always do at least a brief design

2. **"I'll just write the code first"**
   - Reality: Leads to rework and missed requirements
   - Solution: Follow RED-GREEN-REFACTOR

3. **"I don't need to write that down"**
   - Reality: Mental plans are forgotten or unclear
   - Solution: Document in plans folder

4. **"I'll do a big commit later"**
   - Reality: CLI Droid CLI workflow works best with small, frequent commits
   - Solution: Small, frequent commits

## Summary

Superpowers provides a systematic approach to software development:

1. **Brainstorm** - Understand requirements before coding
2. **Plan** - Break into bite-sized, actionable tasks
3. **Implement** - Use TDD (RED-GREEN-REFACTOR)
4. **Review** - Ensure quality and specification compliance

By following these workflows systematically, you produce higher quality code with fewer bugs and better alignment with requirements.

---

**Remember**: The goal isn't to be rigid—it's to be systematic. These workflows exist to help you think clearly, not to replace thinking. Use them as guardrails, not shackles.
