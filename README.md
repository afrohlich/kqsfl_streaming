# kqsfl_streaming

## Initialize on a new server
### Dependencies
- Running on laptop (important for the integrated battery)
- Ubuntu 20.04 (or other Debian-based OS with X11 Desktop manager)
- Twitch account
- Discord channel
- Google Account
  - Google Project
    - Service Account for access for GDrive Access ([see rclone documentation](https://rclone.org/drive/#service-account-support))
- 

### Setup
- Download `utils/bootstrap` from this repository
- `bash ./bootstrap`
- Download this repo
- Go to the `ansible` directory of this repository
- Run `ansible-galaxy install -r requirements.yml`
- Copy and fill out the required environment files
  - `ansible/streambox_credentials_template.yml` --> `$HOME/streambox_credentials.yml`
  - `ansible/streambox_vars_template.yml` -->   `$HOME/streambox_credentials.yml`

### Install Command 
Run `ansible-playbook streambox.yml -c local -K -u stream-admin`

### Details

This repository aims to connect all of the required components for running a streaming setup for Killer Queen Arcade.
This includes:
- OBS Studio for streaming
- Backup solutions for settings and temporary network issues
- Remote server access via RDP and VNC
- Critical server updates via discord
- Role based access control for managing the stream
- Transport-layer encryption
- Performance visability and monitoring
- Power interuption handling

This setup is designed to enable a server to run from within an isolated network when access to firewall rules is not available.