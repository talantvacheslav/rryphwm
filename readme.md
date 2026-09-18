# rryphwm

## About
rryphwm is a fork of dwm 

the defining feature of rryphwm is horizontal scrollable layout:
windows live on an infinite horizontal strip that you scroll through with the mouse wheel

## Requirements
Xlib Xft Xinerama header files and some sort of make

**for example**

Arch:
```bash
sudo pacman -Sy libx11 libxft libxinerama make
```
Debian/Ubuntu:
```bash
sudo apt install libx11-dev libxft-dev libxinerama-dev make
```
Void:
```bash
sudo xbps-install -S libX11 libX11-devel libXft libXft-devel libXinerama libXinerama-devel make
```
Gentoo:
```bash
doas emerge -av x11-libs/libX11 x11-libs/libXft x11-libs/libXinerama make
```


## Installation
```bash
git clone https://github.com/talantvacheslav/rryphwm.git
cd rryphwm
```
```bash
make
sudo make clean install
```

## Running
needs `startx` utility installed

`.xinitrc` should contains `rryphwm` to start using `startx`
