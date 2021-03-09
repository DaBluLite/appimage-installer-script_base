# appimage-installer-script_base
## A base script to create a simple AppImage installer for your AppImage.

## How to use
* The way to edit this file is really straightforward. The things you have to change are the bold fields below:
* echo -en "\033]0;**Your AppImage Installer Name**\a": This is the terminal title for when the script runs.
* APP_NAME=**Your App**: The name of your app.
* APP_PATH_NAME=**your-app**: This time you must enter a path/url-friendly name of your app.
* APP_URL=**http://your-app.url.com/your-app.appimage**: This is the download url of your AppImage. Note that it must lead to an Appimage file.
* Once you're done, test your script and see if it works.
