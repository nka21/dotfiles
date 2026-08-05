---
name: git-branch
description: Review changes and create a branch. Default choice for starting or isolating a single task on the current branch/directory. Use [[git-worktree]] instead only when work must proceed in parallel with other in-progress work in a separate directory.
user-invocable: true
allowed-tools: Bash
---

Review the current state and create an appropriate branch.

This is the default way to isolate work before implementing any non-trivial
change — including large or risky ones. Reach for `git-worktree` instead only
when the task must run *concurrently* with other in-progress work (e.g. an
interrupt task while something else is mid-flight, or multiple
agents/tasks editing the repo at once) and needs its own directory.

**Current branch:** `!`git branch --show-current``

**Working tree status:**
```
!`git status --short`
```

**Diff stat:**
```
!`git diff --stat`
```

1. Run `git status` and `git diff` to understand what has changed
2. Autonomously decide the most appropriate branch name based on the changes
3. Create the branch

Naming convention:
- Prefix: feat/fix/refactor/docs/chore/test
- Format: {prefix}/{specific-content-in-kebab-case}
- Examples: feat/user-auth, fix/login-error, refactor/api-client
