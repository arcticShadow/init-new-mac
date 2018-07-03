# New Computer Setup

## Make it go!
1. Make A repos directory in your Home folder `mkdir ~/repos`
```
# No SSH Key Setup Required
$ git clone https://github.com/arcticShadow/init-new-mac.git ~/repos/init-new-mac

# OR

# SSH Keys already setup and Auth'd to Github
$ git clone git@github.com:arcticShadow/init-new-mac.git ~/repos/init-new-mac

# OR

# Without GIT becasue this is a New computer... Duh
$ curl -L -o ~/repos/init-new-mac.zip https://github.com/arcticShadow/init-new-mac/archive/master.zip 
$ unzip -d ~/repos/ ~/repos/init-new-mac.zip
mv ~/repos/init-new-mac-master ~/repos/init-new-mac
```


## Kinda Important to know

* there are some paths that expects this repo to be located at ~/repos/init-new-mac
  * Therefore, get this repo and put it ~/repos/init-new-mac


## Iterm Profiles etc

To export all iterm settings, run the following `defaults export com.googlecode.iterm2 setup/iterm.plist`

To Import these settings, run `defaults import com.googlecode.iterm2 setup/iterm.plist`

These settings are imported when you run configure.sh
