# Git demo and hands-on lab

1. Before you can use Git, you'll need to configure Git (if you haven't already). First, tell Git your name with `git config --global user.name "<Your Name>"` (the quotes are needed).

2. Next, tell Git your email address with `git config --global user.email "<your.address@domain.com>"` (the quotes are needed).

3. Log into GitHub ([https://github.com](https://github.com)).

4. Locate the repository for this workshop ([https://github.com/scottslowe/2018-itx-iac-workshop](https://github.com/scottslowe/2018-itx-iac-workshop)).

5. Click "Fork" to make a copy of the repository into your own GitHub account.

6. Click the "Clone or download" button to get the HTTPS URL for your newly-forked repository.

7. In a directory on your computer, type `git clone <HTTPS URL from previous step>` to clone the forked repository down to your local computer.

8. Change into the directory where Git cloned the repository. List the contents of the directory (be sure to use `ls -a` if on Linux or macOS, so you'll see all the contents of the directory). You should see a new directory called `.git`. _This is the actual Git repository._

9. Run `git log` to see the history of changes. You'll see the full history of the repository, even from before you cloned it.

10. Run `git remote` to see a list of remotes associated with the repository. Only a single remote, named "origin", should be listed.

11. Run `git remote -v` to get more detailed information on the remotes. You'll see that the "origin" remote has an HTTPS URL (should be the same as the one you got in step 4).

12. Now you're ready to add some content to the repository. Run `git branch` to verify that the "master" branch is active (there will be an asterisk next to it in the list of branches).

13. Create a new text file named `file-1.txt`. Add some content to the file (the content doesn't really matter).

14. Run `git status`. You should see that the new file you created is listed as an _untracked_ file.

15. Stage the new file by entering `git add file-1.txt`.

16. Run `git status` again and you'll see the file listed as a change to be committed.

17. Run `git commit` to commit the changes. Enter a brief commit message, then save and exit the file in your editor.

18. Run `git status` again and Git will report that the working directory is clean.

19. Run `git log` again, and you should see your latest commit listed there.

20. Now flip over to the browser and refresh the display of your forked repository. Did the change you made show up? Why or why not?

21. In order for the change you made locally to show up in the remote Git repository, you'll need to _push_ the changes. Run `git push origin master` to send the local changes to the "master" branch to the remote named "origin".

22. Repeat step 20. Is the change you made present now?
