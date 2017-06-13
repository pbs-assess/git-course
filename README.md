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
      git remote add REMOTE-NAME REMOTE-URL	<One-time command to enable fetching 
		and merging from REMOTE-NAME'S GitHub repo at REMOTE-URL, e.g.:>
	  git remote add cgrandin https://github.com/cgrandin/git-course	

	  git fetch cgrandin					<fetch changes that cgrandin has made>
	  git merge cgranding/master			<merge the fetched changes with your local repository>
	  git merge c<TAB>						<this will auto-complete the above command (if unique)>
	  git rm --cached filename			<remove the file from the git repo, but not from local directory>
	  git rm filename					<remove the file from the git repo AND from local directory>


### To collaborate with others

Now, the true value of git and GitHub is in collaborating on code or documents. Having forked my repository and then cloned it your computer you have a copy of my files. But what about keeping up-to-date with what I've been doing, and then doing some work yourself that I can then merge into my files? We may not use this full functionality for this project, but in case, here is what we do.

Look at the Network Graph for your repository: go to your GitHub site for this repository, and click Graphs and then Network. Your (GitHub) name should be on the left, with a series of nodes (each representing a commit) to the right in the graph. If you see someone else's name below yours, it means that they have pushed something to their repository that you don't yet have. You can hover over each node to see the commit message associated with each commit. 

If you cannot see anyone else's name then no-one is ahead of you, and you are up to date (this is good!). 

So, to incorporate my (Andy's) latest commits, you need to (just once) do: 

       git remote add aedwards https://github.com/andrew-edwards/empirical-dyn-mod

You can use anything you like instead of 'aedwards', but we've found it consistent to use this format for when we are involving multiple people. 

Then, to fetch (from GitHub) the latest version of mine:

	git fetch aedwards

I think you can do 

	git diff aedwards/master

which will show the differences between our repositories, but it's not super clear. [I now use difftool I think which is likely better, but I haven't done merging for a while].

Then to merge my version of the repository with your own repository, do

	git merge aedwards/master

If we have no **conflicts** then the merge will work fine. A conflict is where we have both changed a file in the same place [line number] since the repositories diverged from each other. Then **git com "..."** (though a merge may automatically do one?) and **git push** as usual. Then look at the Network Graph page again (refresh it), and it should look different - the repository you merged from should not show up, since you are now up to date with it.

When there is a conflict you will get a message. Then open the relevant file in a text editor, and it has <<<<<<   for the start of a conflicting part, and ========= at the end, so manually fix it. Basically you decide which part of the conflicting code you want to keep.

Then **git add <filename>** to confirm that's the one you want (that step is not completely obvious), then **git com "..."** as usual. See <https://help.github.com/articles/resolving-a-merge-conflict-from-the-command-line/>

Generally we try and work on different files so that there are no conflicts when we merge.

From <http://stackoverflow.com/questions/9069061/what-is-the-difference-between-git-merge-and-git-merge-no-ff> Andy found the command

	git merge --no-ff <branch name, or presumably e.g. cgrandin/master>

which looks like in the Network Graph it retains a branch even if a fast-forward can occur (even if nothing else has happened and git can simply 'catch up'). Am testing by adding these notes in branch **mergeTest**. If it works then this side branch should show up on the Network Graph. Before I've gone back to **master** branch and just tweaked a file so that the side branch still shows up clearly on the Network Graph. This is obviously better. 

I've purposefully glossed over a few technical things to get you started, and haven't fully explained why things are done. When I started our I tried to read up about GitHub a bit, but it can be very technically described (requiring a strong computer science background) so not overly helpful, with lots of references to other 'version control systems' that you never used in the first place.

A readable introduction to the general ideas of 'version control' is the manuscript <a href="https://arxiv.org/abs/1609.00037">Good Enough Practices in Scientific Computing</a> (thanks to Carrie for passing this on).

## This is what Chris had

A repository for teaching Git and GitHub

To use Git and GitHub on Windows, you will need to do the following things.
If you have a MAC, skip this list and read below.

1. <a href="https://github.com/" target="_blank">Get a GitHub account</a>.
2. GitHub requires Microsoft .NET 4.5. If you have a .NET version less
   than 4.5 ([Check version](https://github.com/downloads/shanselman/SmallestDotNet/CheckForDotNet45.exe
   "Which .NET version is on my machine?")),
   then upgrade it: <a href="http://go.microsoft.com/fwlink/p/?LinkId=310158"
   target="_blank">Microsoft .NET 4.5.1</a>.
3. Install <a href="http://windows.github.com" target="_blank">GitHub Desktop</a>
4. Once installed, open the GitHub Desktop Application. Press the gear icon and
   choose *Options*. In *Configure Git*, fill in your name and the email address
   you used for your GitHub account, and change your *Clone Path* to
   **c:\github**. Make sure that for *Default Shell*, *PowerShell* is checked.
   Click *Save* and close the application. **This is a one-time step and you will not need
   to do it again unless you want to sign in with a different user name.**
5. Open the Git Shell, (not the GitHub application). The shortcut should be
   **C:\Users\your-computer-user-name\AppData\Local\GitHub\GitHub.appref-ms --open-shell**
   but with **your-computer-user-name** replaced with your Windows account name.
6. Note your starting directory, this is where your files will be. It should be
   the same as the one you entered into the GitHub application in the steps
   above.
7. Install <a href="https://sourcegear.com/diffmerge/downloads.php"
   target="_blank">Diffmerge</a>

If you have a MAC, try typing *git* on the command line. If it is installed,
you have nothing else to do. If not, you need to install it. One way is
outlined here (you don't need SSH keys):
<a href="http://burnedpixel.com/blog/beginners-setup-guide-for-ruby-node-git-github-on-your-mac/"
target="_blank">Install Git on MAC OSX</a>

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


