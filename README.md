# reMarkaDOS-Freedos-on-reMarkable
Simple FreeDOS setup, optimized for the reMarkable tablet, with CDROM support to mount own ISO image, and run old DOS software via BOCHS emulation.
<br>
<h2>Requirements:</h2>
<li>reMarkable (1 or 2)
<li><a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> access to the reMarkable (help screen on the tablet, copyright notice, scroll down to find IP and password)
<li>Toltec repositories installed (instructions @ <a href="https://toltec-dev.org/">Toltec-dev</a> website)
<li><b>Oxide</b> launcher, <b>simple</b> scripting language, <b>yaft</b> (yet another finger terminal): <code>opkg install oxide simple yaft</code>
<h2>HOWTO</h2>
<li><a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> to your reMarkable, and install BOCHS emulator: <code>opkg install bochs</code>, remember to install also the <b>oxide</b>, <b>yaft</b> and <b>simple</b> package.
<li>Unpack the zip file into a folder on your pc (for example "remarkados") and <a href="https://linux.die.net/man/1/scp">scp</a> it to your reMarkable
<li>On reMarkable: via ssh, put files into a folder (for example "remarkados"), and from it test it out with <code>bochs -q -unlock -f bochsrc</code>
<li>Copy to reMarkable both the <b>dos.sh</b> and <b>startdos.sh</b> by <a href="https://linux.die.net/man/1/scp">scp</a> it to /home/root folder, make them executable with <code>chmod +x *.sh</code><li>On reMarkable, register your app within <b>oxide</b> by running <code>rot apps call registerApplication 'QVariantMap:{"name": "FreeDOS", "bin": "/home/root/dos.sh"}'</code>
<li>Once done, refresh your apps on <b>oxide</b> on your tablet (top left corner of oxide UI)
<li>Tap the FreeDOS icon to run BOCHS and FreeDOS directly from reMarkable
<li>Use it as you like.
