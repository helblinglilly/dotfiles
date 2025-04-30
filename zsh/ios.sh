#!/bin/bash

# Parse JSON output from simctl to list available devices
devices=$(xcrun simctl list devices -j)

# Use jq to filter available devices (ignoring unavailable ones) and extract name and UUID
available_devices=$(echo "$devices" | jq -r '
	.devices[] |
	map(select(.isAvailable == true)) |
	map(select(.state == "Shutdown" or .state == "Booted")) |
	.[] | "\(.name) (\(.state)) - \(.udid)"')

# Check if we have any available devices
if [[ -z "$available_devices" ]]; then
	echo "No available simulators found."
	exit 1
fi

# Present the available devices to the user for selection
echo "Available iOS Simulators:"
IFS=$'\n' read -r -d '' -a device_list <<< "$available_devices"
PS3="Choose a simulator to boot: "

# Display the list of devices
for i in "${!device_list[@]}"; do
	echo "$((i + 1)). ${device_list[$i]}"
done

# Prompt user to choose a device
read -p "Enter the number of the simulator to boot: " device_choice

# Validate the input
if [[ -z "$device_choice" ]] || ! [[ "$device_choice" =~ ^[0-9]+$ ]] || (( device_choice < 1 || device_choice > ${#device_list[@]} )); then
	echo "Invalid selection."
	exit 1
fi

# Extract the UUID of the selected device
selected_device="${device_list[$((device_choice - 1))]}"
uuid=$(echo "$selected_device" | grep -oE "[A-F0-9-]{36}")

# Boot the selected device
echo "Booting device: $selected_device"
xcrun simctl boot "$uuid"

# Open the simulator app
open -a Simulator
