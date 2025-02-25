# 🧙‍♂️ Git Magic: Command Line Edition

![Git Logo](.medias/git_logo.png)

## 🔧 Configure Your Git Persona

Before using Git, you need to set up your identity so that your commits are properly attributed to you.

```sh
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

If you want to set it only for a specific project, remove `--global`.

To verify your configuration:
```sh
git config --list
```

---

## 🛠️ Creating a New Repository

### Steps:
1. Create a new project directory:
   ```sh
   mkdir my_project
   cd my_project
   ```
2. Initialize a Git repository:
   ```sh
   git init
   ```

This creates a hidden `.git` folder that tracks changes in your project.

To check if your repository has been initialized:
```sh
git status
```

---

## 📁 Adding Files to Git

### Add files to the staging area:
- Add a specific file:
  ```sh
  git add filename
  ```
- Add all files in the directory:
  ```sh
  git add .
  ```

### Commit changes:
```sh
git commit -m "Your commit message"
```

To check the current status of your repository:
```sh
git status
```

To view commit history:
```sh
git log
```

---

## 🌐 Connecting to a Remote Repository

### Steps:
1. Create a repository on GitHub, GitLab, or Bitbucket.
2. Link your local repository to the remote repository:
   ```sh
   git remote add origin <remote_url>
   ```
3. Verify the remote repository:
   ```sh
   git remote -v
   ```
4. Push your local commits to the remote repository:
   ```sh
   git push -u origin master
   ```

---

## 🕵️‍♂️ Cloning a Repository

To download an existing repository from a remote server:
```sh
git clone <repository_url>
```

To clone into a specific directory:
```sh
git clone <repository_url> my_directory
```

---

## 🚨 Undoing Changes

### Undo last commit (without losing changes):
```sh
git reset --soft HEAD~1
```

### Undo last commit (discarding changes):
```sh
git reset --hard HEAD~1
```

### Remove a file from the staging area:
```sh
git reset HEAD filename
```

### Discard local changes in a file:
```sh
git checkout -- filename
```

---

## 🌿 Working with Branches

### Create a new branch:
```sh
git branch new-branch
```

### Switch to a branch:
```sh
git checkout new-branch
```

### Create and switch to a branch in one step:
```sh
git checkout -b new-branch
```

### Merge a branch into master:
```sh
git checkout master
git merge new-branch
```

### Delete a branch:
```sh
git branch -d new-branch
```

---

## 🔄 Syncing and Updating

### Pull latest changes from remote:
```sh
git pull origin master
```

### Fetch updates without merging:
```sh
git fetch origin
```

### Rebase to keep a clean commit history:
```sh
git rebase origin/master
```

---

## 🏷️ Tagging Commits

### Create a tag:
```sh
git tag v1.0.0
```

### Push tags to remote:
```sh
git push origin --tags
```

---

## 🌟 Stashing Changes

### Save unfinished work:
```sh
git stash
```

### List all stashes:
```sh
git stash list
```

### Retrieve and apply the latest stash:
```sh
git stash pop
```

### Apply a specific stash:
```sh
git stash apply stash@{0}
```

### Drop a stash:
```sh
git stash drop stash@{0}
```

---

## 🧙‍♂️ Summary Table

| Command | Description |
|---------|-------------|
| `git config --global user.name "Name"` | Set global username |
| `git config --global user.email "email"` | Set global email |
| `git init` | Initialize a new repository |
| `git add .` | Stage all changes |
| `git commit -m "message"` | Commit staged changes |
| `git remote add origin <url>` | Link remote repository |
| `git push -u origin master` | Push code to master branch |
| `git pull origin master` | Pull latest changes |
| `git branch new-branch` | Create a new branch |
| `git checkout new-branch` | Switch to a branch |
| `git checkout -b new-branch` | Create and switch to a branch |
| `git merge new-branch` | Merge a branch into master |
| `git branch -d new-branch` | Delete a branch |
| `git log` | View commit history |
| `git status` | Check current state |
| `git reset --soft HEAD~1` | Undo last commit (keep changes) |
| `git reset --hard HEAD~1` | Undo last commit (discard changes) |
| `git checkout -- filename` | Discard local changes |
| `git stash` | Stash changes |
| `git stash pop` | Apply stashed changes |
| `git stash list` | List all stashes |
| `git tag v1.0.0` | Create a tag |
| `git push origin --tags` | Push tags to remote |
| `git fetch origin` | Fetch updates from remote |
| `git rebase origin/master` | Rebase local branch |

Now, you're ready to master Git like a pro! 🚀