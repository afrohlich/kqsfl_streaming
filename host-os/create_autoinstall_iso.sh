
#!/bin/bash

set -xeuo pipefail

# Configuration variables
ISO_EXTRACT_DIR="/tmp/iso_out"
SOURCE_ISO="ubuntu-24.04.2-live-server-amd64.iso"
OUTPUT_ISO="/tmp/ubuntu-autoinstall.iso"
BUILD_SCRIPT="/tmp/build_iso.sh"

# Download ISO
echo "Download ISO"

# Create ISO extract directory
mkdir -p "$ISO_EXTRACT_DIR"

# Unpack ISO
xorriso -osirrox on -indev "/$SOURCE_ISO" --extract_boot_images "$ISO_EXTRACT_DIR/bootpart" -extract / "$ISO_EXTRACT_DIR"

# Create cloud-init directory
mkdir -p "$ISO_EXTRACT_DIR/nocloud"

# Copy user-data
cp user-data "$ISO_EXTRACT_DIR/nocloud/user-data"
touch "$ISO_EXTRACT_DIR/nocloud/meta-data"

# Edit grub
cp grub.cfg "$ISO_EXTRACT_DIR/boot/grub/grub.cfg"

# Generate ISO build command
cat << EOF > "$BUILD_SCRIPT"
#!/bin/bash

xorriso -as mkisofs \\
$(xorriso -indev "$SOURCE_ISO" -report_el_torito as_mkisofs 2>/dev/null | sed -n '/^\-/p' | sed 's/$/ \\/')
-o "$OUTPUT_ISO"
$ISO_EXTRACT_DIR
EOF

# Build the ISO
chmod +x "$BUILD_SCRIPT"
bash "$BUILD_SCRIPT"
echo "autoinstall iso has been created at $OUTPUT_ISO"
echo "Create a bootable USB with this ISO to configure the host machine"