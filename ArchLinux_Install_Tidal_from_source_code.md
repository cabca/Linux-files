<h1>ArchLinux - Install Tidal from source</h1>


In order to install the latest version of Tidal from source follow the steps below.

<strong>Note:</strong> For me it didn't work to install it from AUR giving me a bunch of errors but from source it works perfectly.


<strong>Option 1</strong>
<ol>
  <li>git clone https://github.com/Mastermindzh/tidal-hifi.git
  <li>cd tidal-hifi
  <li>npm install
  <li>go to directory ~/tidal-hifi/build/linux/arch
  <li>makepkg si
  <li>makepkg --install
</ol>



<strong>Option 2</strong>
<ol>
  <li>git clone https://github.com/Mastermindzh/tidal-hifi.git
  <li>cd tidal-hifi
  <li>npm install
  <li>got to tidal-hifi folder /build 
  <li>open file electron-builder.yml and uncomment -pacman
  <li>update the electron version the builder is using <strong>electronVersion</strong> and <strong>version</strong> with the latest stable one from https://github.com/castlabs/electron-releases/releases
  <li>npm run build
  <li>go to tidal-hifi folder /dist
  <li>sudo pacman -U package_name.pacman (If you have an oleder version you need to remove it first "yay -Rsc tidal-hifi-git")
</ol>




<strong>Option 3</strong>
<ol>
  <li>go to https://github.com/Mastermindzh/tidal-hifi/releases
  <li>download the .AppImage file
  <li>open terminal in the location of the .AppImage, chmox +x package_name.AppImage
  <li>the file is executable, just double-click on it to open the app, no fuss
</ol>

