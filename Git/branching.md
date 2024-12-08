# Delete all local branches
<!-- May need to change `main` to `master` -->
```bash
git checkout main
git branch | grep -v "main" | xargs git branch -D
git fetch --prune
```
