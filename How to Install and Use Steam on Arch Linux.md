How to Install and Use Steam on Arch Linux
https://linuxhint.com/install_steam_arch_linux/


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
