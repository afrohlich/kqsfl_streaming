cat > /usr/share/xsessions/kiosk.desktop << EOF
[Desktop Entry]
Name=Kiosk
Comment=This session creates a gnome kiosk
#Exec=env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
Exec=/usr/bin/gnome-session --session kiosk
TryExec=/usr/bin/gnome-shell
Type=Application
DesktopNames=ubuntu:GNOME
X-GDM-SessionRegisters=true
X-Ubuntu-Gettext-Domain=gnome-session-3.0
EOF


cat > /var/lib/AccountsService/users/stream-user << EOF
[User]
Session=
XSession=kiosk
Icon=/home/stream-user/.face
SystemAccount=false

[InputSource0]
xkb=us
EOF

cat > /usr/share/gnome-session/sessions/kiosk.session << EOF
[GNOME Session]
Name=Kiosk
#RequiredComponents=gnome-shell-classic;gnome-settings-daemon;
RequiredComponents=firefox;kiosk-shell;org.gnome.Shell;org.gnome.SettingsDaemon.A11ySettings;org.gnome.SettingsDaemon.Color;org.gnome.SettingsDaemon.Datetime;org.gnome.SettingsDaemon.Housekeeping;org.gnome.SettingsDaemon.Keyboard;org.gnome.SettingsDaemon.MediaKeys;org.gnome.SettingsDaemon.Power;org.gnome.SettingsDaemon.Rfkill;org.gnome.SettingsDaemon.Sound;org.gnome.SettingsDaemon.XSettings;
EOF

cat > /usr/share/applications/kiosk-shell.desktop << EOF
[Desktop Entry]
Exec=gnome-shell --mode=kiosk
EOF


cat > /usr/share/gnome-shell/modes/kiosk.json << EOF
{
    "parentMode": "user",
    "hasWindows": true,
    "hasOverview": false,
    "stylesheetName": "Yaru/gnome-shell.css",
    "themeResourceName": "theme/Yaru/gnome-shell-theme.gresource",
    "debugFlags": ["backtrace-crashes-all"],
}
EOF
