#!/bin/bash

# Get the list of available AVDs
avd_list=$(emulator -list-avds)

# Check if any AVDs are available
if [[ -z "$avd_list" ]]; then
	echo "No Android Virtual Devices (AVDs) found."
	exit 1
fi

# Present the available AVDs to the user for selection
echo "Available Android Virtual Devices:"
IFS=$'\n' read -r -d '' -a avds <<< "$avd_list"
PS3="Choose an emulator to boot: "

# Display the list of AVDs
for i in "${!avds[@]}"; do
	echo "$((i + 1)). ${avds[$i]}"
done

# Prompt the user to choose a device
read -p "Enter the number of the emulator to boot: " avd_choice

# Validate the input
if [[ -z "$avd_choice" ]] || ! [[ "$avd_choice" =~ ^[0-9]+$ ]] || (( avd_choice < 1 || avd_choice > ${#avds[@]} )); then
	echo "Invalid selection."
	exit 1
fi

# Get the selected AVD name
selected_avd="${avds[$((avd_choice - 1))]}"

# Boot the selected emulator
echo "Booting Android emulator: $selected_avd"
emulator -avd "$selected_avd" &

# Wait for the emulator to start (you can tweak this if needed)
sleep 5

echo "Android emulator $selected_avd is booting."
