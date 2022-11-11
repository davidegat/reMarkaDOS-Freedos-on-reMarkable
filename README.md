# reMarkaDOS-Freedos-on-reMarkable
Simple FreeDOS setup, optimized for the reMarkable tablet, with CDROM support to mount own ISO image, and run old DOS software via BOCHS emulation.<br>
<br>
<h2>I don't want to read, give me an installer!</h2>
An automation script is available: it checks if <a href="https://toltec-dev.org/">Toltec</a> repository is present, download needed software, register your app on <b>oxide</b>, and test if it works after installation.<br><br>
ssh to your reMarkable and type:<br>
<code>wget https://raw.githubusercontent.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/main/installrmd.sh; bash ./installrmd.sh</code><br>
<h2>Requirements:</h2>
<li>reMarkable (1 or 2)
<li><a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> access to the reMarkable (help screen on the tablet, copyright notice, scroll down to find IP and password)
<li>Toltec repositories installed (instructions @ <a href="https://toltec-dev.org/">Toltec-dev</a> website)
<li><b>Oxide</b> launcher, <b>simple</b> scripting language, <b>yaft</b> (yet another finger terminal): <code>opkg install oxide simple yaft</code>
<h2>HOWTO</h2>
<li><a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> to your reMarkable, and install BOCHS emulator: <code>opkg install bochs</code>, remember to install also the <b>oxide</b>, <b>yaft</b> and <b>simple</b> package if you haven't done it yet.
<li>Unpack the zip file into a folder on your pc (for example "remarkados") and <a href="https://linux.die.net/man/1/scp">scp</a> it to your reMarkable
<li>On reMarkable: via <a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a>, move your files into a folder (for example "remarkados"), test from this folder if it works via terminal with <code>bochs -q -unlock -f bochsrc</code>. BOCHS and FreeDOS should start, if it happens, reboot your tablet and proceede with the next steps.
<li>Copy to reMarkable both the <b>dos.sh</b> and <b>startdos.sh</b> by <a href="https://linux.die.net/man/1/scp">scp</a> it to /home/root folder, make them executable via <a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> with <code>chmod +x *.sh</code> and register your app within <b>oxide</b> by running <code>rot apps call registerApplication 'QVariantMap:{"name": "FreeDOS", "bin": "/home/root/dos.sh"}'</code>
<li>Once done, refresh your apps in <b>oxide</b> from your tablet (top left corner of oxide UI), the FreeDOS icon should now appear on oxide.
<li>On your tablet, tap the FreeDOS icon to run BOCHS and FreeDOS directly from reMarkable
<li>Use it as you like, you can now transfer regular iso images.
  <h2>Install DOS software on your reMarkable</h2>
<li>To install new software, put your files into a folder in your pc, make an ISO image out of it (on linux: <code>mkisofs -0 image.iso folder/</code>, there are specific apps for Windows too), scp it to your reMarkable in the correct folder (in the example "remarkados")
<li>On your reMarkable: edit the <b>bochsrc</b> file to mount ISO image (<b>bochsrc</b> in the zip file will help you understand how, remember to change the image name and path accordingly)
<li>Run FreeDOS from terminal or reMarkable, access the D: drive, and copy your software to the FreeDOS box with the <a href="https://home.csulb.edu/~murdock/copy.html">DOS 'copy' command</a>
