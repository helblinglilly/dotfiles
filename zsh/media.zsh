function tomp4(){
	ffmpeg -i $1 -vcodec h264 -acodec aac "${1}.mp4"
	rm $1
}

function tomp3(){
	ffmpeg -i $1 -vn -acodec libmp3lame -ab 320k "${1}.mp3"
}
