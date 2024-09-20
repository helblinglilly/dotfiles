function dockershell(){
	docker container exec -it $1 /bin/bash
	if [[ "$?" != 0 ]]; then
		docker container exec -it $1 /bin/sh
	fi
}

function linuxbox(){
	container_id=$(docker run -d -t --platform=linux/amd64 -d ubuntu)
	dockershell $container_id
}

function cleanContainer(){
	docker container stop $1 || true
	docker container rm $1 || true
}

function dockerHelp(){
	echo "Start a container and keep it running\n > docker run -d -t ..."
	echo "Start a container under a different architecture\n > docker run --platform=linux/amd64"
	echo "Build docker image from non-Dockerfile filename\n > docker build -f dockerfile-location ..."
	echo "Skip local cache when building image\n > docker build --no-cache ..."
	echo "Build a docker image\n > docker build -t test:latest ."
	echo "Start a docker container\n > docker run test:latest"
	echo "\nAliases"
	echo " > dockershell [container]\n    Start a shell session in a container"
	echo " > linuxbox\n    Start a fresh Ubuntu container and open a shell session in it"
	echo " > cleanContainer [container]\n    Stop and remove a container"
}
