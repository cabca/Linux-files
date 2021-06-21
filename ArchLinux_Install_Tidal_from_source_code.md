<h1>ArchLinux - Install Tidal from source</h1>


In order to install the latest version of Tidal from source follow the steps below.

<strong>Note:</strong> For me it didn't work to install it from AUR giving me a bunch of errors but from source it works perfectly.

<br>
<strong>Option 1</strong>
<ol>
  <li>go to https://github.com/Mastermindzh/tidal-hifi/releases
  <li>download the .Pacman file
  <li>open terminal in the location of the .Pacman
  <li>sudo pacman -U whatever_file.pacman
</ol>

<br>
<strong>Option 2</strong>
<ol>
  <li>git clone https://github.com/Mastermindzh/tidal-hifi.git
  <li>cd tidal-hifi
  <li>npm install
  <li>go to directory ~/tidal-hifi/build/linux/arch
  <li>makepkg si
  <li>makepkg --install
</ol>

<br>
<strong>Option 3</strong>
<ol>
  <li>git clone https://github.com/Mastermindzh/tidal-hifi.git
  <li>cd tidal-hifi/build/
  <li>gedit/nano /tidal-hifi/build/electron-builder.yml
  <li>uncomment -pacman
  <li>update the electron version the builder is using <strong>electronVersion</strong> and <strong>version</strong> with the latest stable one from https://github.com/castlabs/electron-releases/releases
  <li>return to tidal-hifi folder
  <li>npm install
  <li>npm run build
  <li>cd tidal-hifi/dist/
  <li>sudo pacman -U package_name.pacman (If you have an older version you need to remove it first "yay -Rsc tidal-hifi-git")
  <li>To fix the icon open <strong>/usr/share/applications/tidal-hifi.desktop</strong>, change the icon line to <strong>/usr/share/icons/hicolor/0x0/apps/tidal-          hifi.png</strong>
  <li>run <strong>gtk-update-icon-cache</strong>
</ol>

<br>
<strong>Option 4</strong>
<ol>
  <li>go to https://github.com/Mastermindzh/tidal-hifi/releases
  <li>download the .AppImage file
  <li>open terminal in the location of the .AppImage, chmod +x package_name.AppImage
  <li>the file is executable, just double-click on it to open the app, no fuss
</ol>
