How to Install and Use Steam on Arch Linux
https://linuxhint.com/install_steam_arch_linux/

<br>

Steam installation with Pacman
Tweaking pacman.conf
Enjoying Steam requires activating the “multilib” repository. It’s not enabled by default. We have to manually edit the “pacman.conf” file and enable multilib.

Run the following command for editing the file.
```
sudo nano /etc/pacman.conf
```
Now, scroll down and find out the “multilib” section.
Uncomment the “multilib” section.
Run pacman to update the package database.
```
sudo pacman -Sy
```
Installing Steam - Run the following command.
```
sudo pacman -S steam
```
