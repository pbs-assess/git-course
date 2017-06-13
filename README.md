# git-course

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

      git s                             <View status of the repository>
      git add filename                  <Add 'filename' (including path) to the list of files being tracked by git>
      git com "MESSAGE"                 <Commit changes with descriptive MESSAGE>
	  git push							<Push your changes to GitHub>
      git remote add REMOTE-NAME REMOTE-URL
		<One-time command to enable fetching 
		and merging from REMOTE-NAME'S GitHub repo at REMOTE-URL, e.g.:>
	  git remote add cgrandin https://github.com/cgrandin/git-course	

	  git fetch cgrandin				<fetch changes that cgrandin has made>
	  git merge cgranding/master		<merge the fetched changes with your local repository>
	  git merge c<TAB>					<this will auto-complete the above command (if unique)>
	  git rm --cached filename			<remove the file from the git repo, but not from local directory>
	  git rm filename					<remove the file from the git repo AND from local directory>
	  git difftool <options>			<Compare changes using difftool; options can be branches, other repos you have fetched but not merged, or leave blank to compare to latest commit **CHECK THESE**>


### Fixing a conflict

When there is a conflict you will get a message. Then open the relevant file in a text editor, and it has <<<<<<   for the start of a conflicting part, and ========= at the end, so manually fix it. Basically you decide which part of the conflicting code you want to keep.

Then **git add <filename>** to confirm that's the one you want (that step is not completely obvious), then **git com "..."** as usual. See <https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/>

Generally we try and work on different files so that there are no conflicts when we merge.

A readable introduction to the general ideas of 'version control' is the manuscript <a href="https://arxiv.org/abs/1609.00037">Good Enough Practices in Scientific Computing</a>.


## Useful commands in the Git Shell
      git help                          <List git commands>
      git clone url NAME                <Clone repository found at url into directory NAME>
      git status                        <View changes & staging>
      git remote -v                     <Look at all remote data sources (URLs)>
      git remote add NAME URL           <Add the remote reposiroty at URL, and give it the name NAME>
      git fetch NAME                    <Fetch the commits from the repository denoted by NAME>
      git add FILENAME                  <Add new file called FILENAME>
      git commit -a -m "MESSAGE"        <Commit with MESSAGE recorded to the log>
      git branch                        <List all branches>
      git branch -d NAME                <Safely delete the branch called NAME>
      git branch -D NAME                <Forcibly delete the branch called NAME>
      git checkout -b NAME              <Create new branch called NAME>
      git checkout NAME                 <Switch to already-existing branch called NAME>
      git push                          <Add the local branch NAME to the remote>
      git push origin --delete NAME     <Delete the branch NAME from the remote>
      git log                           <View commit log>
      git difftool                      <Open up your difftool software and show differences>
## Useful Git aliases
      git r                             <View remote URLs for the project, same as 'git remote -v'>
      git s                             <View status of the repository, same as 'git status'>
      git co NAME                       <Change to branch "NAME", same as 'git checkout NAME'>
      git cb NAME                       <Create branch "NAME", same as 'git checkout -b NAME'>
      git com "MESSAGE"                 <Commit all with message, same as 'git commit -a -m "MESSAGE"'>


