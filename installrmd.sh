clear
if [ -d "/home/root/.entware" ]; then


echo
echo
echo    reMarkaDOS by gat.
echo
echo This scripts does no harm, but is not generally safe
echo to be running scripts without knowing its content!
echo
read -p "Did you read these scripts content, and/or are you ok to run them anyway? (y/N)" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    echo Bye wise guy.
    echo
    exit 1
fi
echo
read -p "You're about to download and install reMarkaDOS on this tablet. Sure? (y/N)" -n 1 -r
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
echo
echo Toltec repositories OK!
echo Proceeding...
sleep 2
echo
echo Installing needed software from Toltec...
echo
opkg install bochs simple yaft oxide
echo
echo
echo Creating "remarkados" folder...
echo

mkdir remarkados

echo Downloading and extracting...
echo
echo

wget https://raw.githubusercontent.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/main/dos.sh
wget https://raw.githubusercontent.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/main/startdos.sh
chmod +x *.sh

cd remarkados
wget https://github.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/raw/main/reMarkaDOS-Bochs.zip

unzip reMarkaDOS-Bochs.zip
rm -rf reMarkaDOS-Bochs.zip
clear
echo
echo
echo Registering your app on Oxide...
echo

echo digito il comando per registrare
echo
read -p "Do you want to run a boot test via terminal? (Y/n)" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
bochs -q -unlock -f bochsrc
fi
echo
echo Refresh your apps in oxide to enjoy your reMarkaDOS!
echo gat.
echo
else
  echo
  echo
  echo Unable to continue.
  echo
  echo Toltec repositories are not installed.
  echo Follow the instructions at https://toltec-dev.org and come back.
  echo
  echo Bye.
  echo
  exit 1
fi
