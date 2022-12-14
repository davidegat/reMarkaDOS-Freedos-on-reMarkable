# reMarkaDOS-Freedos-on-reMarkable
<a href="https://www.freedos.org/">FreeDOS</a> setup, ready for the reMarkable tablet, with CDROM support to mount own ISO image, and run old DOS software via <a href="https://bochs.sourceforge.io/">BOCHS</a> emulation.<br><br>
FreeDOS is under the <a href="https://www.gnu.org/licenses/gpl.html">GNU General Public License</a>

<h2>I don't want to read, give me an installer!</h2>
A script is available: it checks if <a href="https://toltec-dev.org/">Toltec</a> repository is present, download needed software, register your app on <b>oxide</b>, and offers a way to test the setup. You will have a running copy of <a href="https://www.freedos.org/">FreeDOS</a> on reMarkable out of the box.<br><br><b>Before proceeding</b>: you MUST know what <a href="https://toltec-dev.org/">Toltec</a> repository is about, not just install it. By installing <a href="https://github.com/Eeems/oxide">oxide</a> launcher you are going to modify the way your reMarkable works. Make sure you know what you are doing. If you already use both of them, just ignore this warning.<br><br>
ssh to your reMarkable and type or paste the following:<br><br>
<code>wget https://raw.githubusercontent.com/davidegat/reMarkaDOS-Freedos-on-reMarkable/main/installrmd.sh; bash ./installrmd.sh</code><br><br>
Don't forget to refresh your apps in <b>oxide</b> after installation (top left corner on your oxide UI). To install DOS software on your reMarkable, follow instructions at the end.
<h2>Requirements:</h2>
<li>reMarkable (1 or 2)
<li><a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> access to the reMarkable (help screen on the tablet, copyright notice, scroll down to find IP and password)
<li>Toltec repositories installed (instructions @ <a href="https://toltec-dev.org/">Toltec-dev</a> website)
<li><b>Oxide</b> launcher, <b>simple</b> scripting language, <b>yaft</b> (yet another finger terminal): <code>opkg install oxide simple yaft</code>
<h2>HOWTO</h2>
<li>You MUST know what <a href="https://toltec-dev.org/">Toltec</a> repository is about. <a href="https://github.com/Eeems/oxide">Oxide</a> launcher will to modify the way your reMarkable works. If you already use both of them, just ignore this warning.
<li>Learn about how to <a href="https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html">config BOCHS</a> emulator, to be able to adjust <b>bochsrc</b> config file for further use (mounting ISO images).
<li><a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> to your reMarkable, and install <a href="https://bochs.sourceforge.io/">BOCHS</a> emulator: <code>opkg install bochs</code>, remember to install also the <b>oxide</b>, <b>yaft</b> and <b>simple</b> package if you haven't done it yet.
<li>Unpack the zip file into a folder on your pc (for example "remarkados") and <a href="https://linux.die.net/man/1/scp">scp</a> it to your reMarkable
<li>On reMarkable: via <a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a>, move your files into a folder (for example "remarkados"), test from this folder if it works via terminal with <code>bochs -q -unlock -f bochsrc</code>. BOCHS and <a href="https://www.freedos.org/">FreeDOS</a> should start, if it happens, reboot your tablet and proceede with the next steps.
<li>Copy to reMarkable both the <b>dos.sh</b> and <b>startdos.sh</b> by <a href="https://linux.die.net/man/1/scp">scp</a> it to /home/root folder, make them executable via <a href="https://man7.org/linux/man-pages/man1/ssh.1.html">SSH</a> with <code>chmod +x *.sh</code> and register your app within <b>oxide</b> by running <code>rot apps call registerApplication 'QVariantMap:{"name": "FreeDOS", "bin": "/home/root/dos.sh"}'</code>
<li>Once done, refresh your apps in <b>oxide</b> from your tablet (top left corner of oxide UI), the <a href="https://www.freedos.org/">FreeDOS</a> icon should now appear on oxide.
<li>On your tablet, tap the <a href="https://www.freedos.org/">FreeDOS</a> icon to run BOCHS and <a href="https://www.freedos.org/">FreeDOS</a> directly from reMarkable
<li>Use it as you like, you can now transfer regular iso images.
 
  <h2>Need more space?</h2>
<li>Ssh to your reMarkable, and rename your c.img file <code>mv c.img c-old.img</code>
<li>Run <code>bximage</code>, a menu appears: choose "3. Resize hard disk image", when asked for source image: <b>c-old.img</b>, new image: <b>c.img</b>, input the new <b>size</b> (say.. 500mb)
<li>Launch FreeDOS (better from terminal, ssh to your reMarkable and type: <code>./startdos.sh</code>)
<li>In FreeDOS, run the good old fdisk: <code>fdisk</code>
<li>Follow the menu, add a second partition to the disk, activate it, and quit.
<li>Restart your reMarkable, and run FreeDOS again, format your new partition. Now you have extra space on a second disk. Delete the c-old.img image from reMarkable terminal (not from FreeDOS!) <code>rm -rf c-old.img</code> or keep it as a backup if something doesn't work.
<h2>I need help with fdisk and format</h2>
After running <code>fdisk</code> on your FreeDOS, a menu activates:<br>
<br>
1. Create DOS partitions on the fixed disk. Using this option, you can create more than one logical drive on one physical fixed disk.<br>
2. Change an existing partition on the fixed disk.<br>
3. Delete an existing partition on the fixed disk.<br>
4. Display current partition information.<br><br>
Type 1, enter, and follow the instructions to create a new partition.<br>fdisk will give the new partition a drive letter (example "d:"), after the partition is made, exit fdisk and reboot reMarkable.<br>Boot FreeDOS again, and format the new partition with <code>format d:</code> (change drive letter accordingly). <h2>Install DOS software on your reMarkable</h2>
<li>To install new software, put software files into a folder in your pc, make an ISO image out of it (on linux: <code>mkisofs -0 image.iso folder/</code>, there are specific apps for Windows too), scp it to your reMarkable in the correct folder (in the example "remarkados")
<li>On your reMarkable: edit the <b>bochsrc</b> file to mount ISO image: <code>nano bochsrc</code> (<b>bochsrc</b> in the zip file will help you understand how, remember to change the image name and path accordingly), it will be recognized as a CDROM drive. Check <a href="https://bochs.sourceforge.io/doc/docbook/user/bochsrc.html">bochsrc options</a> for more details.
<li>Run FreeDOS from terminal or reMarkable, access the drive, and copy your software to the FreeDOS box with the <a href="https://home.csulb.edu/~murdock/xcopy.html">DOS 'xcopy' command</a> (for example: <code>xcopy d:\FOLDER\ c:\FOLDER /a</code>).
