function tomp4(){
	ffmpeg -i $1 -vcodec h264 -acodec aac "${1}.mp4"
	rm $1
}

function utility(){
	cd /Users/joel/.utility
}

function reload(){
    source /Users/joel/.zshrc
}

function edit(){
	code ~/.utility
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

function powershell(){
	/usr/local/microsoft/powershell/7-lts/pwsh ; exit;
}

function dns(){
	dig +short $1
}