
# function ascii(){
# 	echo $1 | tr -d "\n" | od -An -t dC
# }
#
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