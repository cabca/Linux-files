How to Install Steam on Arch Linux with pacman
<br>
https://linuxhint.com/install_steam_arch_linux/

<br>

Steam installation with Pacman
Tweaking <strong>pacman.conf</strong>
<br>
Enjoying Steam requires activating the “<strong>multilib</strong>” repository. It’s not enabled by default. We have to manually edit the “<strong>pacman.conf</strong>” file and enable multilib.

Run the following command for editing the file.
```
sudo nano /etc/pacman.conf
```
Now, scroll down and find out the “multilib” section by removing <strong>#</strong>.
Uncomment the “multilib” section.
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
Run pacman to update the package database.
```
sudo pacman -Sy
```
Installing Steam - Run the following command.
```
sudo pacman -S steam
```
