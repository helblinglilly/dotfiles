function help(){
    if [ $1 = "git" ]; then
        echo "===== shortcuts/git.zsh ====="
        echo "gitHelp\n   - Print a git cheat sheet"
        echo "hotfix [git message]\n    - git add . && git commit -m [git message] && git push"
    elif [ $1 = "utils" ] || [ $1 = "util" ]; then
        echo "====== shortcuts/utils.zsh ====="
        echo "tomp4 [link]\n   - Convert a video to mp4"
        echo "utility\n   - cd to ~/.utility"
        echo "reload\n   - Refresh shortcuts"
        echo "edit\n   - Edit shortcuts"
        echo "zshHelp\n   - Display ZSH cheat sheet"
        echo "powershell\n   - Launch powershell"
        echo "dns [hostname]\n   - Resolve a hostname to an IP"
        echo "fixDump\n   - When shell spits out a load of garbage, use this command"
    else
        utils_help
        echo "\n\n"
        other_help
        echo "\n\n"
        go_help
        echo "\n\n"
        git_help
    fi
}


function other_help(){
    echo "===== other.zsh ====="
    echo "b2d [number]\n   - Binary to decimal"
	echo "b2x [number]\n   - Binary to hex"
	echo "x2b [number]\n   - Hex to binary"
	echo "d2b [number]\n   - Decimal to binary"
	echo "x2d [number]\n   - Hex to decimal"
	echo "d2x [number]\n   - Decimal to hex"
	echo "words [string]\n   - Count the amount of words (separated by spaces)"
	echo "count [string]\n   - Count the number of characters in a string"
	echo "ascii [char]\n   - Print the ascii code for a char"
}

function go_help(){
    echo "===== go.zsh ====="
	echo "goLoad\n   - Add go install output to PATH"
	echo "goCheatsheet\n   - Display cheat sheet"
}