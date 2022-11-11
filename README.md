# reMarkaDOS-Freedos-on-reMarkable
Simple FreeDOS setup, optimized for the reMarkable tablet, with CDROM support to mount own ISO image, and run old DOS software via BOCHS emulation.
<br>
<h2>Requirements:</h2>
<li>reMarkable (1 or 2)
<li>SSH access to the reMarkable (help screen on the tablet, copyright notice, scroll down to find)
<li>Toltec repositories (instructions @ <a href="https://toltec-dev.org/">Toltec-dev</a> website)
<li><b>Oxide</b> launcher and <b>simple</b> scripting language: <code>opkg install oxide simple</code>
<li><b>yaft</b> (yet another finger terminal): <code>opkg install yaft</code>
<h2>HOWTO</h2>
<li>ssh to your reMarkable, and install BOCHS emulator: <code>opkg install bochs</code>, remember to install also the <b>oxide</b>, <b>yaft</b> and <b>simple</b> package.
<li>Unpack the zip file into a folder on your pc (for example "remarkados") and scp it to your reMarkable
<li>On reMarkable: via ssh, put files into a folder (for example "remarkados"), and from it test it out with <code>bochs -q -unlock -f bochsrc</code>
<li>Copy to reMarkable both the <b>dos.sh</b> and <b>startdos.sh</b> by scp it to /home/root folder, make them executable with <code>chmod +x *.sh</code><li>Register your app within <b>oxide</b> by running <code>rot apps call registerApplication 'QVariantMap:{"name": "FreeDOS", "bin": "/home/root/dos.sh"}'</code>
<li>Once done, refresh your apps on <b>oxide</b> on your tablet (top left corner of oxide UI)
<li>Tap the FreeDOS icon to run BOCHS and FreeDOS directly from reMarkable
<li>Use it as you like.
