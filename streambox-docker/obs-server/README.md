# Ubuntu Desktop with VNC in Docker

Troubelshooting

- https://kasmweb.com/docs/latest/guide/troubleshooting/advanced_connection_troubleshooting.html#validate-session-authorization

Option 1

Basing my image off of kasm core images and replace the INST_SCRIPTS
  Example:  https://github.com/kasmtech/workspaces-images/blob/develop/dockerfile-kasm-ubuntu-focal-desktop
    Base image source code -> https://github.com/kasmtech/workspaces-core-images

Option 2

Design from scratch based on kasm and other similar projects:
  - https://github.com/kasmtech/workspaces-core-images
  - https://github.com/kasmtech/workspaces-images
  - https://github.com/gezp/docker-ubuntu-desktop


Use USB Passthrough for OBS requirements
- https://stackoverflow.com/a/62758958https://stackoverflow.com/a/62758958
- https://unix.stackexchange.com/questions/136781/how-to-get-device-filename-from-lsusb-output-or-by-device-path