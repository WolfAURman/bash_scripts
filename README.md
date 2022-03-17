# bash_scripts
When using this shell script, also comment out the swap file line in the fstab config.
You can do it like this:
sudo nano /etc/fstab
Then put "#" in front of the section where it says "/swap"
Then restart the computer and see if the change was applied by the command:
cat /proc/swaps
