# git-course yadayada

Introductory course on **git** and **GitHub** by Chris Grandin and Andrew Edwards.

Departure Bay Room A/B, Vancouver Island Conference Centre.

Wednesday 21st and Thursday 22nd June, 9:00-4:30 both days.

Basically, **git** works on your computer and saves all versions of documents as you continually work on them ('version control'). **GitHub** is a copy of everything on a website that allows users to share code with each other.


## Setting up

See the **git-course-setup.pdf** file that we email to you. 

You will then have all the files from this **git-course** repository on your computer.

From the [GitHub glossary](https://help.github.com/articles/github-glossary/#repository): "A repository is the most basic element of GitHub. They're easiest to imagine as a project's folder. A repository contains all of the project files (including documentation), and stores each file's revision history. Repositories can have multiple collaborators and can be either public or private." 

 
## Summary of most common commands

### To fork and clone someone else's repository

On the repository's GitHub page, click 'Fork'.

Navigate to your GitHub version of the repo.

To clone it onto your local machine, in git shell:

      git clone https://github.com/YOUR-GITHUB-USER-NAME/REPO-NAME

### The basic commands we use are:

[//]: # (https://mislav.net/2010/07/git-tips/)

      git help <command>                <Open a help page in your browser for the command>

      git s                             <View status of the repository>
      git s -sb                         <View status of the repository in very concise form>
      git s -u                          <Show all untracked files, not just directories>
      git add FILENAME                  <Add FILENAME (including path) to the list of files being tracked by git>
      git com "MESSAGE"                 <Commit changes with descriptive MESSAGE>
	  git push                          <Push your changes to GitHub>

      git remote add NAME URL           <One-time command to enable fetching and merging from
                                         NAME'S GitHub repo at URL, for example:>
	  git remote add cgrandin https://github.com/cgrandin/git-course

      git r                             <Look at all remote data sources (URLs)>
	  git fetch cgrandin                <Fetch changes that cgrandin has made>
	  git merge cgrandin/master         <Merge the fetched changes with your local repository>
	  git merge c<TAB>                  <This will auto-complete the above command (if unique)>

	  git rm --cached FILENAME          <Remove FILENAME from the git repo, but not from local directory>
	  git rm FILENAME                   <Remove FILENAME from the git repo AND from local directory>
	  git difftool <options>            <Compare changes using difftool; options can be branches, other repos you have
                                         fetched but not merged, or leave blank to compare to latest commit>

      git log                           <View commit log>
      git help                          <List git commands>

      git cb BRANCH-NAME                <Create and switch to branch BRANCH-NAME>
      git co BRANCH-NAME                <Checkout (switch to) branch BRANCH-NAME>
      git branch                        <List all branches>
      git branch -d NAME                <Safely delete the branch called NAME>
      git branch -D NAME                <Forcibly delete the branch called NAME>
      git push origin --delete NAME     <Delete the branch NAME from the remote>

### Some of those are aliases (from your .gitconfig file):
      git s                             git status
      git com "MESSAGE"                 git commit -a -m "MESSAGE"
      git r                             git remote -v
      git cb BRANCH-NAME                git checkout -b BRANCH-NAME
      git co BRANCH-NAME                git checkout BRANCH-NAME


### Fixing a conflict

When there is a conflict you will get a message. Then open the relevant file in a text editor, and you will see

     <<<<<<< HEAD
     Line(s) of text/code which are currently in your file.
     =======
     Line(s) of text/code which are trying to merge in, but conflict.
     >>>>>>> BRANCH-NAME
  
where BRANCH-NAME is the name of the branch (or remote) you are trying to merge in from the previously-issued command:

     git merge BRANCH-NAME

Choose one of the line(s) of text/code to keep, or edit the line(s) to be something else entirely.

Then remove the bracketing and separation lines 

     <<<...
     >>>...
     =======
Once you are done fixing each conflicted file, you need to 

     git add FILENAME

to confirm that's the one you want (that step is not completely obvious), then commit and push.

See <https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/> for an example.

Generally we try and work on different files so that there are no conflicts when we merge.

## General introduction

A readable introduction to the general ideas of 'version control' is the manuscript <a href="https://arxiv.org/abs/1609.00037">Good Enough Practices in Scientific Computing</a>.

