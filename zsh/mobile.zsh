#!/bin/bash

function mobileHelp(){
	echo "Virtual Devices"
	echo "  iOS Simulator device picker"
	echo "   > ios\n"

	echo "  Android Emulato device pickerr"
	echo "   > android\n"

	echo "  Open deeplinks remotely"
	echo "    > npx uri-scheme open onthebeach://[deeplink] --android --ios\n"
}

function ios(){
  sh ~/.utility/dotfiles/mobile/ios.sh
}


function android(){
	sh ~/.utility/dotfiles/mobile/android.sh
}
