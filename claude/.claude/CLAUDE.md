# Development Philosophy

**Fundamental Principles:**
- **Declarative Code**: Express what to do, not how to do it
- **Composition over Inheritance**: Small components that combine together
- **Performance First**: Optimizations from the start, not afterwards
- **KISS (Keep It Simple)**: Simplicity over complexity, always

**Code Practices:**
- **Single Responsibility**: Each module has a single responsibility
- **DRY (Don't Repeat Yourself)**: Reuse through composition
- **YAGNI (You Aren't Gonna Need It)**: No premature abstractions
- **Fail Fast**: Validation and explicit errors immediately

**Do NOT add these to code:**
- **Comments explaining the diff**: Comments that only describe what changed (e.g., `# Increased from 30 to 120 seconds`) belong in commit messages, not code. They add no lasting value and become misleading over time.
- **Step numbers in code or logs**: Avoid numbered steps in comments or log messages (e.g., `# Step 1. Check a thing`, `log.info("Step 1. Do a thing")`). These become outdated when code changes and clutter the codebase. Express intent through clear function/variable names instead.

# Pull Requests & Commits

Most of my projects use "Squash and Merge" for PRs, so the PR title/description becomes the Git commit subject/message.
Keep titles/descriptions concise and meaningful.

**Include:**
- Why is this change needed? What's broken or missing?
- What are we doing differently going forward?
- How do these specific changes support that decision?
- How was this tested and verified?

**Exclude:**
- Lists of changed files (visible in the diff)
- Overly detailed explanations of changes (that's what the diff is for)
- Boilerplate or lengthy testing descriptions
- Generic template sections that add no value
