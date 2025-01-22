# Git Config and Branching

## Configure User

Set the Git username and email for the current repository.

```bash
git config --global user.name "AJ Barea"
git config --global user.email "ajbareaa@gmail.com"
```

## Delete All Local Branches

Delete all local branches except the main branch (may need to change `main` to `master` based on your repository).

### Bash

```bash
git checkout main
git branch | grep -v "main" | xargs git branch -D
git fetch --prune
```

### PowerShell

```powershell
git checkout main
git branch | Where-Object {$_ -notmatch "main"} | ForEach-Object { git branch -D $_ }
git fetch --prune
```

## Create and Switch to a New Branch

Create a new branch and switch to it in one command.

```bash
git checkout -b aj-feature-branch
```

## Clean Up Local Branches

Switch to the main branch, delete all local branches except the main branch, and fetch updates from the remote repository, pruning deleted branches.

### Bash Terminal

```bash
git checkout main
git branch | grep -v "main" | xargs git branch -D
git fetch --prune
```

### PowerShell Terminal

```powershell
git checkout main
git branch | Where-Object {$_ -notmatch "main"} | ForEach-Object { git branch -D $_ }
git fetch --prune
