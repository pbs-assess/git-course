# git-course

Introductory course on **git** and **GitHub** by Chris Grandin and Andrew Edwards.

Departure Bay Room A/B, Vancouver Island Conference Centre.

Wednesday 21st and Thursday 22nd June, 9:00-4:30 both days.

Basically, **git** works on your computer and saves all versions of documents as you continually work on them ('version control'). **GitHub** is a copy of everything on a website that allows users to share code with each other.


## Setting up

See the **git-course-setup.pdf** file that we email to you. 

You will then have all the files from this **git-course** repository on your computer.

From the [GitHub glossary](https://help.github.com/articles/github-glossary/#repository): "A repository is the most basic element of GitHub. They're easiest to imagine as a project's folder. A repository contains all of the project files (including documentation), and stores each file's revision history. Repositories can have multiple collaborators and can be either public or private." 

If you want Potentially <a href="http://www.sciencedirect.com/science/article/pii/S0169534715002906">useful reference</a> about code in ecology.
 
## Summary of most common commands





5. Open the GitHub Application. Choose Tools->Options and under *configure git*, fill in your name, the email address you used for signing up to GitHub,
and change your *default storage directory* to something simple that you will be able to find later. 

 - It's good to have all your GitHub based projects in this directory, so something like **c:\github** or anything you like, but ***AVOID USING SPACES IN FILENAMES AND DIRECTORY NAMES*** [this is generally good practice but will avoid potential problems; make sure you add the new directory name to your back up software if you want to back your files up as normal]. 
 - Make sure that for *default shell*, *PowerShell* is checked. *pull behavior* should have *use rebase for pulls* checked. Click *Update* and close the application.

### To get the repository onto your computer

1. Open the Git Shell, (not the GitHub application). The shortcut should be at (maybe copy it to somewhere useful):
**C:\Users\your-computer-user-name\AppData\Local\GitHub\GitHub.appref-ms --open-shell**

2. Note your starting directory, this is where your files will be. It should be the same as the one you entered into the GitHub application in the steps above.

Type the following to clone your repository onto your local machine:

      git clone https://github.com/your-github-user-name/empirical-dyn-mod

This may take a while depending on your network connection, mainly because there are many .pdf's of papers included. Now you have all the files on your computer.

### To change the files and then *push* then back to GitHub

Okay, now to get started. It's easier to be shown by someone and for explaining the concepts, but basically I only end up using a few basic commands. These are typed in the Git Shell. If you are in your **C:/...../github/** directory then you should see a standard DOS prompt, something like:

	C:\user-name\github> 

Then **ls** or **dir** will show you the subdirectories, and you should only have **empirical-dyn-mod** if this is your first use of GitHub.

So change directory 

	cd empirical-dyn-mod

[note that you can use Tab to complete unique commands]. The prompt now says something like

	C:\user-name\github\empirical-dyn-mod [master]>

with **master** in blue. This last bit tells you that you are in a directory that is being tracked in a GitHub repository (don't worry about why it's called master yet). 

### The basic commands that I use are:

      git s                             <View status of the repository>
      git com "MESSAGE"                 <Commit changes with message>
      git add filename                  <Add 'filename' (including path) to the list of files being tracked by git>
	  git push							<Push your changes to GitHub>
	  git fetch ****					<fetch changes that someone else has made>
	  git merge							<merge the fetched changes with your local repository>
	  git merge --no-ff					<merge a branch (or fetched changes?) with your master - see below>
	  git rm --cached filename			<remove the file from the git repo, but not from local directory>
	  git rm filename					<remove the file from the git repo AND from local directory>

In more detail:

	git s

is short for **git status**, and tells you if everything is 'up to date'.

	git com "Comment here"

is short for **git commit**. Once you have made a change to a file then you can 'commit' it to your repository. Git then notes that commit, but in such a way that you can **always go back to earlier versions of the file**. You do not end up with multiple copies of the same file in your directory - Git efficiently keeps track of the **differences** but in hidden folders.

Each commit needs a comment describing what you did, such as

	git com "Updated README.md with comments about commiting."
 
Next,

	git add filename

tells git to keep track of changes to that filename in this repository (so you do this when you create a new file). You do not need to change directory in the git shell once you're in the base directory for a repository, but you just need to include the relative path in 'filename' - i.e. something like

	git add edmPapers/smith06salmonEDM.pdf

To ignore a file, you add that file to the **.gitignore** file for that repository. Don't worry about that for now.

	git push

pushes your commits back to the version of your repository that is on your GitHub web page.

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

