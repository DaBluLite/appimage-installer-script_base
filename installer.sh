##################################################################################
#                  General script for appimage installing                        #
#                                                                                #
#                                By DaBluLite                                    #
#                                                                                #
#            Note: you must know the name of the icon file.                      #
#                                                                                #
##################################################################################
echo -en "\033]0;Your AppImage Installer Name\a"
APP_NAME=Your App #This will be the main app name. It will be displayed in the app launcher and in the desktop shortcut
APP_PATH_NAME=your-app #This will be the name for the paths, the AppImage and others. MUST BE URL-FRIENDLY!
APP_URL=http://your-app.url.com/your-app.appimage #This must lead to an appimage file
SUDO_USER=$(logname)
mkdir /opt/$APP_PATH_NAME
cd /opt/$APP_PATH_NAME
wget -r -l 1 --span-hosts --output-document=$APP_PATH_NAME.AppImage -erobots=off -nH $APP_URL
chmod +xwr $APP_PATH_NAME.AppImage
chown $SUDO_USER $APP_PATH_NAME.AppImage
./$APP_PATH_NAME.AppImage --appimage-extract
cd /opt/$APP_PATH_NAME/squashfs-root
cp * /opt/$APP_PATH_NAME -r
rm * -r
cd /opt/$APP_PATH_NAME
rm squashfs-root -r
cd /home/*/Desktop
echo -n > $APP_PATH_NAME.desktop
cat <<EOT >> $APP_PATH_NAME.desktop
[Desktop Entry]
Name=$APP_NAME
Exec=/opt/$APP_PATH_NAME/AppRun
Terminal=false
Type=Application
Icon=/opt/$APP_PATH_NAME/your-app-icon.png
StartupWMClass=$APP_NAME
X-AppImage-Version=2.5.0
Comment=$APP_NAME
Categories=Utility;
EOT
chmod 775 /home/*/Desktop/$APP_PATH_NAME.desktop
chmod +x /home/*/Desktop/$APP_PATH_NAME.desktop
chown $SUDO_USER /home/*/Desktop/$APP_PATH_NAME.desktop
cd /opt/google-assistant
chmod +xwr /opt/$APP_PATH_NAME -R
chmod 775 /opt/$APP_PATH_NAME -R
chown $SUDO_USER /opt/$APP_PATH_NAME -R
chmod 775 /opt/$APP_PATH_NAME/AppRun
chmod +rwx /opt/$APP_PATH_NAME/AppRun
chown $SUDO_USER /opt/$APP_PATH_NAME/AppRun
cd /home/*/Desktop
cp $APP_PATH_NAME.desktop /usr/share/applications
