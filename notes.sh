## install
# configuration
git config --global user.name "Your Name"
git config --global user.email "email@example.com"

## initiate
git init
  add files to stage
git add <file>
# commit files staged
git commit -m <"message">

--------------------------------------------------

## time travel
# check status
git status

# check diffrences between working dir and stage
git diff
# check differences between HEAD and working dir; HEAD points to current version in repo
git diff HEAD -- readme.txt

# reset version
git reset --hard commit_id(partial)

# check log
git log
# check each record of log in oneline
git log --pretty=oneline
# check command log
git reflog

# 1. discard changes in working dir
git checkout -- <file>
# 2. discard changes staged and in working dir
git reset HEAD <file> # unstage
git checkout -- file
# 3. reset version in repository
git reset --hard commit_id

# delete a file
git rm <file>

--------------------------------------------------

## remote repository
# SSH Key
# $ cd ~/.ssh/
# $ ls
# $ id_rsa  id_rsa.pub
ssh-keygen -t rsa -C "youremail@example.com"

# create a remote repo on github
# create a new repository on the command line
echo "# learngit" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:steven756284184/learngit.git
git push -u origin master
# …or push an existing repository from the command line
git remote add origin git@github.com:steven756284184/learngit.git
git push -u origin master
# git remote connects a remote repository
# origin stands for current branch of the remote repository
# -u or --set-upstream argument connects local master branch with THE remote master branch
# therefore later push command won't needs it anymore
 git push origin master
 
# clone a remote repo
git clone git@github.com:steven756284184/gitskills.git
# or
git clone https://github.com/steven756284184/gitskills.git

----------------------------------------------------

## branch management
# “Branch early, branch often.”
# check branch
git branch
# create branch
git branch <name>
# switch to branch
git checkout <name>
# or
git switch <name>
# create and switch to branch
git checkout -b <name>
# or
git switch <name>
# merge some branch to current branch
git merge <name>
# delete branch
git branch -d <name>

# workflow example (Fast-forward merge)
# o - o - o
#         ^
#         |
#         master
#         ^
#         |
#         HEAD
git checkout -b dev
# o - o - o <- master
#         ^
#         |
#         dev
#         ^
#         |
#         HEAD
git add <file>
git commit -m ""
# o - o - o - o
#         ^   ^
#         |   |
#      master dev
#             ^
#             |
#             HEAD
git checkout master
# o - o - o - o
#         ^   ^
#         |   |
#      master dev
#         ^
#         |
#       HEAD   
git merge dev
# Fast-forward: points master to current commit of dev
# o - o - o - o <- dev
#             ^
#             |
#             master
#             ^
#             |
#             HEAD
git branch -d dev
# o - o - o - o
#             ^
#             |
#             master
#             ^
#             |
#             HEAD
