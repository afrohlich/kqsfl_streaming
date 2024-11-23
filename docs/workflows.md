# Workflows

Because this repository is aims to collect tools and configurations for all levels of the system stack, there are many ways that you might interact with the tools in this repository.
This document will attempt to outline common, intended workflows and link to more comprehensive documentation.

The architecture of this repository has 3 user types in mind:
IT/system admin: responsible for managing the software, networks, credential management
OBS stream admin: responsible for updating the obs profiles/collections and configuring upstream cloud resources
OBS stream user: ability to start and stop a stream and get some basic info about the state of the server

For now system admin and obs admin will be the same user but this will be separated in the future. This will be the "stream-admin" user throughout this repository.

## Remote Access

The remote access workflows are designed to allow for the maximum flexibility while being mindful of the lack of control of the local network.

Multiple remote access systems are active. All are placed behind a reverse web proxy and can be connected to through a web browser. These include:
RDP to a new virtual display, VNC to the physical display, VNC to a new virtual display, command line terminal

SSH is also enabled.

## Updating the server

If updates to network or server configurations are required take care to document the changes in this repository. These changes should only be done by an IT/System admin.

## Updating the Elgato Streamdeck

## Updating OBS Scenes

The main server functions as an OBS studio workstation. Edits can be made directly on the server. Backups of the configurations are regularly taken and can be modified separately and imported. Importing and or locally updating OBS should be done as the OBS stream admin user.

### Backups

## Password Management

