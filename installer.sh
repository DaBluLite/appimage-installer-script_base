##################################################################################
#                  General script for appimage installing                        #
#                                                                                #
#                                By DaBluLite                                    #
#                                                                                #
#            Note: you must know the names of the main binary                    #
#                       executable and the icon file.                            #
#                                                                                #
##################################################################################
APP_NAME=<Your_app_name_here> #This will be the main app name. It will be displayed in the app launcher and in the desktop shortcut
APP_PATH_NAME=<Your_app_path_name_here> #This will be the name for the paths, the AppImage and others. MUST BE URL-FRIENDLY!
SUDO_USER=$(logname)
mkdir /opt/google-assistant
cd /opt/google-assistant
wget -r -l 1 --span-hosts --output-document=$APP_PATH_NAME.AppImage -erobots=off -nH <Your_appimage_url> #This must lead to an appimage file
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
Icon=/opt/$APP_PATH_NAME/<Your_icon_name>
StartupWMClass=$APP_NAME
X-AppImage-Version=2.5.0
Comment=Your app description goes here
Categories=Utility;
EOT
chmod 775 /home/*/Desktop/$APP_PATH_NAME.desktop
chmod +x /home/*/Desktop/$APP_PATH_NAME.desktop
chown $SUDO_USER /home/*/Desktop/$APP_PATH_NAME.desktop
cd /opt/google-assistant
chmod 775 /opt/$APP_PATH_NAME -R
chown $SUDO_USER /opt/$APP_PATH_NAME -R
chmod 775 /opt/$APP_PATH_NAME/AppRun
chmod +rwx /opt/$APP_PATH_NAME/AppRun
chown $SUDO_USER /opt/$APP_PATH_NAME/AppRun
chmod 775 /opt/$APP_PATH_NAME/<Your_app_binary_executable>
chmod +rwx /opt/$APP_PATH_NAME/<Your_app_binary_executable>
chown $SUDO_USER /opt/$APP_PATH_NAME/<Your_app_binary_executable>
cd /home/*/Desktop
cp $APP_PATH_NAME.desktop /usr/share/applications
