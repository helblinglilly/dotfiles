function port(){
	kill -9 $(lsof -ti:$1)
}

function dns(){
	dig +short $1
}

function dnsFlush(){
	sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
}
