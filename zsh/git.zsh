function gitCheatSheet(){
	echo "Checkout"
	echo "   Checkout to branch:"
	echo "      > git switch [branchname]\n"
	echo "   Checkout to a new branch and keep your changes:"
	echo "      > git switch -c feature/PCORE-xxxx-description\n\n"
	echo ""
	echo "Committing"
	echo "   Stage individual files:"
	echo "      > git add [filename]\n"
	echo "   Commit staged changes:"
	echo "      > git commit\n\n"
	echo "   Undo commit"
	echo "      > git commit -m 'Something terribly misguided' # Accident)"
	echo "      > git reset HEAD~                              # This command is responsible for the undo. It will undo your last commit while leaving your working tree (the state of your files on disk) untouched"
	echo "      > [edit files]"
	echo "      > git add [files]                              # Anything we now actually want to commit"
	echo "      > git commit -c ORIG_HEAD                      # Commit the changes, reusing the old commit message. reset copied the old head to .git/ORIG_HEAD; commit with -c ORIG_HEAD will open an editor, which initially contains the log message from the old commit and allows you to edit it. If you do not need to edit the message, you could use the -C option.\n\n"
	echo ""
	echo "Stashing"
	echo "   Stash changes (undo for now, recall later):"
	echo "      > git stash\n"
	echo "   Unstash changes (bring back)"
	echo "      > git stash pop\n\n"
	echo "   Throw stash away"
	echo "      > git stash clear\n\n"
	echo "Branches"
	echo "   List local branches:"
	echo "      > git branch --list\n"
	echo "   List remote branches:"
	echo "      > git branch -r\n"
	echo "   Rename branch:"
	echo "      > git branch -m [newName]       Rename"
	echo "      > git push origin -u [newName]  Push new name"
	echo "      > git push origin -d [old]      Delete remote with old name"
	echo "      > branchRename [newName]		Do all the above\n"
	echo "   Delete local branch:"
	echo "      > git branch -d [branchname]\n"
	echo "   Delete remote branch:"
	echo "      > git push horigin :[branchname]"
	echo ""
	echo "Pushing"
	echo "   Push changes to new branch:"
	echo "      > git push --set-upstream origin [branchname]\n"
	echo ""
	echo "Rebase"
	echo "  Rewrite commit history of past x commits"
	echo "    > git rebase -i HEAD~[numberOfCommits]"
	echo "  Rebase with remote master"
	echo "    > git pull --rebase origin master"
}

function hotfix(){
    git add .
    git commit -m $1
    git push
}

function branchRename(){
	OLD_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
	git branch -m $1
	git push origin -u $1
	git push origin -d "$OLD_BRANCH"
}
