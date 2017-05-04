# git-course
A repository for teaching Git and GitHub

To make everything in this repository work correctly, you will need to
do a few things to get git up and running on your computer. This list
is for Windows computers only, If you have a MAC, skip this list and
read below.

1. <a href="https://github.com/" target="_blank">Get a GitHub account</a>.
2. GitHub requires Microsoft .NET 4.5. If you have a .NET version less
   than 4.5 ([Check version](https://github.com/downloads/shanselman/SmallestDotNet/CheckForDotNet45.exe
   "Which .NET version is on my machine?")),
   then upgrade it: <a href="http://go.microsoft.com/fwlink/p/?LinkId=310158"
   target="_blank">Microsoft .NET 4.5.1</a>.
3. Install <a href="http://windows.github.com" target="_blank">GitHub Desktop</a>
4. Once installed, open the GitHub Desktop Application. Choose Tools->Options
   and under *configure git*, fill in your name, the email address you used
   for signing up to GitHub, and change your *default storage directory* to
   something simple that you will be able to find later. I recommend
   **c:\github**. Make sure that for *default shell*, *PowerShell* is checked.
   *pull behavior* should have *use rebase for pulls* checked. Click *Update*
   and close the application. **This is a one-time step and you will not need
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

