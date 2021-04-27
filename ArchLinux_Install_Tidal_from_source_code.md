<h1>ArchLinux - Install Tidal from source</h1>


In order to install the latest version of Tidal from source follow the steps below.

<strong>Note:</strong> For me it didn't work to install it from AUR giving me a bunch of errors but from source it works perfectly.

<ol>
  <li>git clone https://github.com/Mastermindzh/tidal-hifi.git
  <li>cd tidal-hifi
  <li>npm install
  <li>go to directory ~/tidal-hifi/build/linux/arch
  <li>makepkg si
  <li>makepkg --install
</ol>


<ol>
  <li>git clone https://github.com/Mastermindzh/tidal-hifi.git
  <li>cd tidal-hifi
  <li>npm install
  <li>got to tidal-hifi folder /build 
  <li>open file electron-builder.yml and uncomment -pacman
  <li>npm run build
  <li>go to tidal-hifi folder /dist
  <li>sudo pacman -U package_name.pacman (If you have an oleder version you need to remove it first "yay -Rsc tidal-hifi-git")
</ol>

