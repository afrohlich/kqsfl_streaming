
#!/bin/bash

set -xeuo pipefail

# Get the directory containing this script
SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"

# Configuration variables
ISO_EXTRACT_DIR="$HOME/Downloads/iso_out"
SOURCE_ISO="$HOME/Downloads/ubuntu-24.04.2-live-server-amd64.iso"
OUTPUT_ISO="/tmp/ubuntu-autoinstall.iso"
BUILD_SCRIPT="/tmp/build_iso.sh"

# Download ISO
echo "Download ISO"

# Create ISO extract directory
mkdir -p "$ISO_EXTRACT_DIR"

# Unpack ISO
xorriso -osirrox on -indev "$SOURCE_ISO" --extract_boot_images "$ISO_EXTRACT_DIR/bootpart" -extract / "$ISO_EXTRACT_DIR"

# Create cloud-init directory
mkdir -p "$ISO_EXTRACT_DIR/nocloud"

# Copy user-data
chmod +w $ISO_EXTRACT_DIR/nocloud
cat "$SCRIPT_DIR/user-data" > "$ISO_EXTRACT_DIR/nocloud/user-data"
cat "$SCRIPT_DIR/meta-data" > "$ISO_EXTRACT_DIR/nocloud/meta-data"
chmod -w $ISO_EXTRACT_DIR/nocloud

# Edit grub
grub_dir_mode=$(stat -c "%a" "$ISO_EXTRACT_DIR/boot/grub")
grub_file_mode=$(stat -c "%a" "$ISO_EXTRACT_DIR/boot/grub/grub.cfg")
chmod +w "$ISO_EXTRACT_DIR/boot/grub"
chmod +w "$ISO_EXTRACT_DIR/boot/grub/grub.cfg"
cp "$SCRIPT_DIR/grub.cfg" "$ISO_EXTRACT_DIR/boot/grub/grub.cfg"
chmod "$grub_dir_mode" "$ISO_EXTRACT_DIR/boot/grub"
chmod "$grub_file_mode" "$ISO_EXTRACT_DIR/boot/grub/grub.cfg"

# Generate ISO build command
cat << EOF > "$BUILD_SCRIPT"
#!/bin/bash

xorriso -as mkisofs \\
$(xorriso -indev "$SOURCE_ISO" -report_el_torito as_mkisofs 2>/dev/null | sed -n '/^\-/p' | sed 's/$/ \\/')
-o "$OUTPUT_ISO" \
$ISO_EXTRACT_DIR 
EOF

# Build the ISO
chmod +x "$BUILD_SCRIPT"
$BUILD_SCRIPT
echo "autoinstall iso has been created at $OUTPUT_ISO"


echo "cleaning up temp dir"
chmod --recursive +w $ISO_EXTRACT_DIR
rm -rf $ISO_EXTRACT_DIR

cat << EOF

Create a bootable USB with this ISO to configure the host machine
Use 'lsblk' to look up the name of the block device for your USB. (example: /dev/sdX)
You can use the 'dd' command to write the iso to a usb.
The write process may take a couple of minutes.
Incorrect usage of 'dd' can corrupt your machine.

For example, use the below command and replace /dev/sdX_Replace with the correct device
sudo dd  if=$OUTPUT_ISO   of=/dev/sdX_Replace bs=4M && sync

EOF
