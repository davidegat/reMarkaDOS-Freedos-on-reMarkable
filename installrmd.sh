clear
# Check Toltec or die
if [ -d "/home/root/.entware" ]; then
    echo Toltec repositories ... OK!
    echo
    echo reMarkaDOS script by gat.
    echo
    echo This scripts shoud do no harm, but is not generally safe
    echo to run scripts on your tablet without knowing what they do!
    echo
    read -p "Did you read, and/or are you ok to run the scripts anyway? (y/N)" -n 1 -r
    echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]
            then
            echo Bye wise guy.
            echo
            exit 1
        fi
    echo
# User awareness about oxide
    read -p "Install OXIDE launcher, BOCHS and FreeDOS on reMarkable. Sure? (y/N)" -n 1 -r
    echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]
            then
            echo
            echo Install process stopped by user.
            echo Bye.
            echo
            exit 1
        fi
    echo
    echo
    echo Proceeding...
    echo
    echo Getting software from Toltec if needed...
    echo
        opkg install bochs simple yaft oxide rot
    echo
    echo
    echo Creating "remarkados" folder...
    echo
        mkdir remarkados
    echo Downloading files from github...
    echo
    echo
        wget https://raw.githubusercontent.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/main/dos.sh
        wget https://raw.githubusercontent.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/main/startdos.sh
        wget https://raw.githubusercontent.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/main/LICENSE.md
        chmod +x *.sh
        cd remarkados
        echo
        echo
        echo Extracting files...
        echo
        echo
        wget https://github.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/raw/main/reMarkaDOS-Bochs.zip
        unzip reMarkaDOS-Bochs.zip
        rm -rf reMarkaDOS-Bochs.zip
        clear
    echo
    echo
    echo Registering FreeDOS app...
    echo
        rot apps call registerApplication 'QVariantMap:{"name": "FreeDOS", "bin": "/home/root/dos.sh"}'
    echo
    echo
    echo DONE! Refresh apps in oxide to enjoy FreeDOS on reMarkable!
    echo
    echo
    read -p "Do you want to test the installation? (Y/n)" -n 1 -r
    echo
        if [[ ! $REPLY =~ ^[Nn]$ ]]
            then
            clear
            echo
            echo 
            echo Your FreeDOS setup will start in 5 seconds, ctrl-c to stop.
            echo Remember to reboot reMarkable after the test.
            sleep 5
            bochs -q -unlock -f bochsrc
        fi    
else
    echo
    echo
    echo Toltec repositories are not installed.
    echo Follow instructions at https://toltec-dev.org and come back.
    echo
    echo Bye.
    echo
    exit 1
fi
