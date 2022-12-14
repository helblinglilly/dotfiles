function goLoad(){
	export PATH=$PATH:$(dirname $(go list -f '{{.Target}}' .))
}


function goCheatsheet(){
	echo "Go Cheat Sheet"
	echo "* The object that the pointer points to"
	echo "& Take the address of that pointer"
}