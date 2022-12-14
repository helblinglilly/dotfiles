function dockershell(){
	docker container exec -it $1 /bin/bash
}

function port(){
	kill -9 $(lsof -ti:$1)
}