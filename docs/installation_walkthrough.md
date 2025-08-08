# Installion Walkthrough

This document will explain the details of what is being installed and how. The actual installation should have minimal user interaction but there are lots of details that are important if modifying the configurations


## Physical Server

- The physical server (The StreamBox) must be installed from a usb or other installation media. For a fully automated install see the base-os directory.
- An ISO file is rebuilt to include the required autoinstall commands and is saved as a bootable USB
- The OS is installed on the StreamBox
- Ansible configures required packages and shared directories on the Streambox

## OBS VM

- The StreamBox uses libvirt/kvm/qemu to manage a virtual machine to run 


# Configuration Management