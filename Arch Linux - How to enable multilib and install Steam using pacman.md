<h1>Arch Linux - How to enable multilib and install Steam using pacman</h1>

<br>

Source : ```https://linuxhint.com/install_steam_arch_linux/```

<br>

Steam installation with Pacman
Tweaking <strong>pacman.conf</strong>
<br>
Enjoying Steam requires activating the <strong>multilib</strong> repository. It’s not enabled by default. We have to manually edit the <strong>pacman.conf</strong> file and enable <strong>multilib</strong>.

<br>

1. Run the following command for editing the file.
```
sudo nano /etc/pacman.conf
```
2. Now, scroll down and find out the “multilib” section, uncomment it by removing <strong>#</strong>.
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
3. Run pacman to update the package database.
```
sudo pacman -Sy
```
4. To install Steam run the following command.
```
sudo pacman -S steam
```
Note : Pacman will automatically run all the installation task for Steam, even including the 32-bit libraries. Once the installation is complete, reboot your computer.
