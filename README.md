# LOG INTO THE HPC
- ssh into the HPC
  ```bash
  ssh your-psc-username@bridges2.psc.edu
  ```
- When prompted, type your password. You will not see any characters appear on the screen as you type (not even * symbols), but your input is still being recorded. Press Enter when done.
# IMPORTANT DIRECTORIES IN THE HPC

## 1. Your Home Directory
**Path:** `/jet/home/your-psc-username`
- This is your personal workspace on Bridges-2.
- To navigate here quickly, use:
  ```bash
  cd ~
  ```
  (The `~` symbol, called tilde, represents your home directory.)

## 2. Shared Storage Directory (Class & Tutorial Data)
**Path:** `/ocean/projects/bio260081p/shared`
- This is a shared space where class materials and datasets will be stored.

## 3. Your Personal Storage Folder (Large Files)
**Path:** `/ocean/projects/bio260081p/your-psc-username`
- Use this directory for storing large files that do not fit in your home directory.

---

# CHECKING DISK SPACE USAGE
Since `my_quota` did not work, use these commands instead:

### Check Available Space in Different Directories
| **Directory**          | **Command**                                      | **Purpose** |
|------------------------|--------------------------------------------------|------------|
| Home Directory         | `df -h ~`                                        | Check your personal space usage. |
| Personal Storage       | `df -h /ocean/projects/bio260081p/your-psc-username` | See how much space is left in your storage folder. |
| Shared Storage         | `df -h /ocean/projects/bio260081p/shared`        | Check how much space remains in the shared class folder. |

---

# CLONING A REPOSITORY (Read-Only Access)
Cloning allows you to make a local copy of a GitHub repository, including scripts, data, and files.  
However, you cannot push changes unless you own the repository.

### Steps to Clone a Repository
1. Find the repository URL on GitHub:
   - Open GitHub in your browser.
   - Go to the repository of interest.
   - Click the **green "Code" button** → Select **HTTPS** → Copy the URL.

2. Run this command in your HPC terminal:
   ```bash
   git clone https://repository-url
   ```
3. This creates a new folder with the repository’s name. Enter it with:
   ```bash
   cd repository-name
   ```
4. List the directory to see the files ara available and check that the contents of the files are not corrupted.
  ```bash
  ls
  cat example-file.slurm
  ```
6. When finished, go back to your home directory
  ```bash
  cd ~
  ```

---

# FORKING A REPOSITORY (Make It Yours) & CLONING IT
Forking allows you to make a copy of someone else's repository under your GitHub account, giving you full control to modify and push changes.

### Steps to Fork & Clone a Repository
1. Go to GitHub → Open the repository you want to use.
2. Click the "Fork" button (top right or left in some devices).
3. Your forked version will now have a new URL.
4. Copy the URL and clone it to the HPC in your home directory:
   ```bash
   git clone https://your.forked.repository-url
   ```
5. Enter the newly created folder:
   ```bash
   cd your-forked-repository-name
   ```
6.Configure Git with your username and email (required to commit changes):
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your-email@example.com"
   ```
7. Modify, create, and edit files as needed.
---
# GET READY TO SYNC GITHUB
1. Go to GitHub → click on your profile photo → Settings → Developer Settings → Personal Access Tokens.
2. Click "Tokens (classic)".
3. Click "Generate New Token".
4. Click "Generate New Token (classic)".
5. Select the necessary scopes:
        repo (to access private repositories, for now.).
6. Generate and copy the token. If you have difficulties remembering passcodes, use "1234" --please!.
7. When Git asks for a password during git pull or git push, enter this token instead.
8. To avoid re-entering the token every time:
  ```bash
git config --global credential.helper store
   ```
---

# ADDING, COMMITTING, AND PUSHING CHANGES
Once you've made changes in your local copy, push them back to GitHub:

1. Stage all changes:
   ```bash
   git add .
   ```
2. Commit the changes with a message:
   ```bash
   git commit -m "Adding new scripts"
   ```
3. Push changes to GitHub:
   ```bash
   git push origin main
   ```
*(If you are using a branch, replace `main` with your branch name.)*

---

# PULLING UPDATES FROM GITHUB
Always pull the latest changes before working on your repository to avoid conflicts.  
```bash
git pull origin main
```

---

### Final Notes:
- Use `git clone` for read-only access (you can't push changes).
- Use forking + cloning if you want to modify and store changes in your GitHub.
- Always `git pull origin main` before making changes to stay updated.
