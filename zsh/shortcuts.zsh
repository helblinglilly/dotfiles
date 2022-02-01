# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0 variable
zstyle ':vcs_info:git:*' formats ' ⎇ [%b]'
setopt PROMPT_SUBST

#%n username %m hostname to the first . %d current directory %* time, %F and %f set/end foreground colour
PROMPT='%F{green}%B%n@%m%f%b%F{white}:%f%F{cyan}%B%~%b%f at %F{magenta}%*%f%F{yellow}${vcs_info_msg_0_}%f >'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

function utility(){
	cd /Users/joel/.utility
}

function reload(){
    source /Users/joel/.zshrc
}

function edit(){
	code /Users/joel/.zshrc
	code /Users/joel/.utility/*.zsh
}

function ascii(){
	  echo $1 | tr -d "\n" | od -An -t dC
}

function count(){
	echo -n "$1" | wc -m
}

function words(){
	echo -n "$1" | wc -w
}

function d2x(){
	echo "ibase=10; obase=16; $1" | bc
}

function x2d(){
	echo "ibase=10; obase=16; $1" | bc
}

function b2d(){
	echo "ibase=2; obase=10; $1" | bc
}

function d2b(){
	echo "ibase=10; obase=2; $1" | bc
}

function x2b(){
	echo "ibase=16; obase=2; $1" | bc
}

function b2x(){
	echo "$((2#$1))"
}

function b2d(){
	printf '%x\n' "$((2#$1))"
}

function tomp4(){
	ffmpeg -i $1 -vcodec h264 -acodec aac "${1}.mp4"
	rm $1
}

function zshHelp(){
	echo "Ctrl + A		Move cursor to start of line"
	echo "Ctrl + E		Move cursor to end of line"
	echo "Option + D		Delete next word"
	echo "Ctrl + W		Delete last word (Ctrl + Backspace)"
	echo "Ctrl + K		Delete from cursor to end of line"
	echo "Ctrl + U		Delete entire line"
	echo "Ctrl + L		Clear"
	echo "Ctrl + R		Search recent command history"
	echo "!!			Run previous command again"
}

function gitHelp(){
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
	echo "      > git push origin -d [old]      Delete remote with old name\n"
	echo "   Delete local branch:"
	echo "      > git -d [branchname]\n"
	echo "   Delete remote branch:"
	echo "      > git push horigin :[branchname]"
	echo ""
	echo "Pushing"
	echo "   Push changes to new branch:"
	echo "      > git push --set-upstream origin [branchname]\n"
}

function port(){
	kill -9 $(lsof -ti:$1)
}

function dns(){
	dig +short $1
}

function help(){
	echo "utility\n   - cd to ~/.utility"
	echo "edit\n   - Edit shortcuts"
	echo "reload\n\n   - Refresh shortcuts"

	echo "b2d [number]\n   - Binary to decimal"
	echo "b2x [number]\n   - Binary to hex"
	echo "x2b [number]\n   - Hex to binary"
	echo "d2b [number]\n   - Decimal to binary"
	echo "x2d [number]\n   - Hex to decimal"
	echo "d2x [number]\n   - Decimal to hex"
	echo "words [string]\n   - Count the amount of words (separated by spaces)"
	echo "count [string]\n   - Count the number of characters in a string"
	echo "ascii [char]\n\n   - Print the ascii code for a char"
	
	echo "port [port number]\n   - kill a process running on the first argument"
	echo "tomp4 [link]\n   - Download a video in the link provided"
	echo "dns [hostname]\n   - Resolve a hostname to an IP"
	echo "zshHelp\n   - Display ZSH cheat sheet"
	echo "gitHelp\n   - Print a git cheat sheet"

}
# Add Decimal to ASCII
# Add Hex to ASCII
# Add bitwise operations (AND, OR, XOR etc)
