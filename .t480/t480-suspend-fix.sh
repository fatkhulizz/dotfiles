TARGET_FILE="/usr/lib/systemd/system-sleep/t480-hook-sleep"
SOURCE_FILE=".t480/t480-hook-sleep"

# Check if the hook file exists
if [ ! -e "$TARGET_FILE" ]; then
	# Ensure the file is executable
	chmod +x "$SOURCE_FILE"

	# Create a symbolic link using sudo
	sudo ln -s "$(realpath "$SOURCE_FILE")" "$TARGET_FILE"

	echo "Symbolic link to t480-hook-sleep created successfully."
else
	echo "t480-hook-sleep already exists. Skipping symbolic link creation."
fi
