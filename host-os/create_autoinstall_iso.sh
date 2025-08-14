
# Download ISO
echo "Download ISO"

# Create ISO extract directory
mkdir -p /tmp/iso_out

# Unpack ISO
xorriso -osirrox on -indev ubuntu-24.04.2-live-server-amd64.iso --extract_boot_images iso_out/bootpart -extract / iso_out

# Create cloud-init directory
mkdir -p /tmp/iso_out/nocloud

# Copy user-data
cp user-data /tmp/iso_out/nocloud/user-data
touch /tmp/iso_out/nocloud/meta-data

# Edit grub
cp grub.cfg /tmp/iso_out/boot/grub/grub.cfg

# Generate ISO build command
cat << EOF > /tmp/build_iso.sh
#!/bin/bash

xorriso -as mkisofs \\
$(xorriso -indev ubuntu-24.04.2-live-server-amd64.iso -report_el_torito as_mkisofs 2>/dev/null | sed -n '/^\-/p' | sed 's/$/ \\/')
-o /tmp/ubuntu-autoinstall.iso
/tmp/iso_out
EOF

# Build the ISO
chmod +x /tmp/build_iso.sh
bash /tmp/build_iso.sh
echo "autoinstall iso has been created at /tmp/ubuntu-autoinstall.iso"
echo "Create a bootable USB with this ISO to configure the host machine"