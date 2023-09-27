# VStream download scripts

![windows](https://img.shields.io/badge/testing_on_Windows-9747ff?logo=windows&logoColor=fff)
![macos](https://img.shields.io/badge/to_be_tested_on_MacOS-f31f1f?logo=apple&logoColor=fff)
![linux](https://img.shields.io/badge/works_on_Linux%2FWSL-1476ff?logo=linux&logoColor=fff)

this is the repository responsible for a one-stop download of scripts designated to efficiently download your VStream VODs!!

this repository has been provisioned as the VStream backend has no direct implementation of downloading the VODs from the website yet.

## table of contents

1. [important information](#important-information)
    - [what this repository contains](#what-this-repository-contains)
    - [dependencies](#dependencies)
    - [brace terminologies](#brace-terminologies)
2. [installation](#installation)
    - [installing on Windows](#installing-on-windows)
    - [installing on MacOS](#installing-on-macos)
    - [installing on Linux](#installing-on-linux)
3. [instantiating the working directory](#instantiating-the-working-directory)
4. [downloading VStream VODs](#downloading-vstream-vods)
    - [supplementary notes for WSL](#supplementary-notes-for-wsl)
5. [tutorial video](#tutorial-video)
6. [FAQ](#faq)
7. [file checksums](#file-checksums)
    - [verifying file checksums](#verifying-file-checksums)

# important information

some things you need to know about this repository.

## what this repository contains

we've provided the scripts that works on their designated operating systems:

- `.sh` applies to all UNIX Shell commandline, including MacOS and WSL (Windows Subsystem for Linux).
- `.bat` applies only to Windows commandline.

## dependencies

the scripts depend on the following:

- `yt-dlp` for download operations
- `ffmpeg` for video processing and conversion
- `python3` for framework behind the app

refer to the next main section below on how to download these dependencies.

## brace terminologies

- `{WORKDIR}` - your working directory.
- `{LATESTVERSION}` - latest version of `yt-dlp` on GitHub. recommended to address the latest fixes.
- `{PACKAGENAME}` - a package name to be installed to your system. mainly for UNIX shell package manager operations.
- `{PACKAGEFILE}` - the file of the package to be installed. in this documentation, it will be used for RHEL local installs.
- `{PACKAGEWEBFILE}` - package file that came from the internet. application same as above.
- `{EXECUTABLE}` - the app name to be executed in the commandline.
- `{YOURCHANNEL}` - your VStream channel username.
- `{FILENAME}` - specify a name to appear in your working directory.
- `{PCNAME}` - your PC's hostname. only applies to Windows.
- `{USERNAME}` - your user account's non-changeable username. mainly applies to WSL with the [supplementary notes](#supplementary-notes-for-wsl).
- `{OUTPUTDIR}` - an output directory to export your MP4 file. only applies to WSL.

# installation

installing these dependencies require that you know which operating system you're using.

## installing on Windows

you have two options:

### ZIP file option

you can download the following [ZIP file](https://cdn.discordapp.com/attachments/1133239175609581638/1143432856455090186/yt-dlp.zip) I provided and place it in any directory you want. note that this will be your working directory moving forward.

- for file integrity purposes:
  - MD5 hash is `00322b37e9a398e8fe14172c583f7b60`.
  - SHA256 hash is `1d7d2f1fd5a4b488c7a72c12e6ab48fa09c37e2b01b763004ec93ac3f1d1aae7`.
- note that this requires Python to be installed beforehand. visit the [download page](https://python.org/downloads/windows) to download the latest version.

### GitHub Releases option (Windows)

download the latest `yt-dlp_win.zip` from the [Releases](https://github.com/yt-dlp/yt-dlp/releases) screen, and `ffmpeg Essentials` from [gyan.dev](https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-essentials.7z). you will only need the `ffmpeg.exe` file for this operation.

- extract the ZIP contents to the `{WORKDIR}\app` directory, along with `ffmpeg.exe`.
- note that you won't need to install Python, as the frameworks are already in the app.

working on a 32-bit (x86) PC? download `yt-dlp_x86.exe` from the Releases screen and move it to `{WORKDIR\app}`.

## installing on MacOS

_note that this section might need further validation as I personally don't have a Mac to test this with. if you have one and are willing to test this out, reach out to me on VStream [Discord](https://discord.gg/vstream) -- just mention **@thebelovedmoon**._

### `homebrew` option

1. set up `homebrew` first. go to [brew.sh](https://brew.sh) to install the package manager.
    - afterwards, you can install the packages using `brew install {PACKAGENAME}`.
2. install `yt-dlp`, `ffmpeg` and `python3` at the same time, and wait for the process to finish.

### GitHub Releases option (MacOS)

1. download the latest `yt-dlp_macos.zip` from the [Releases](https://github.com/yt-dlp/yt-dlp/releases). extract the files to `{WORKDIR}/app`.
2. download `ffmpeg` for MacOS from [evermeet.cx](https://evermeet.cx/ffmpeg), and follow the instructions. alternatively, you can install `ffmpeg` using `homebrew`.
    - just like on Windows, Python files are already included in the ZIP so you don't have to install the package itself.

## installing on Linux

there are multiple ways to install and operate on multiple Linux/UNIX distributions. refer to the following below:

1. [Debian](#debian-based)
2. [Arch](#arch-based)
3. [RHEL](#rhel-based)
4. [supplementary notes](#supplementary-notes-for-installation)

### Debian-based

most distributions and derivatives rely on the Debian framework as it's user-friendly and intuitive at best. above all, they mainly use `apt` as their package manager. _in this context, I'll be showing you the steps as I've tested them on a Debian-based (mainly Ubuntu-based) environment._

you have two ways to obtain the dependencies:

#### `apt-get` option

1. launch the command shell either by launching from the Apps section, or pressing `Ctrl-Alt-T`.
    - in GNOME, they are called Terminal; while in KDE, they are called Konsole. app names vary by their display managers.
2. launch the following command: `sudo apt-get update && sudo apt-get -y install yt-dlp ffmpeg python3`.
    - as you're in `sudo` mode, enter your account password to continue.
3. wait for the installation to finish, and prepare your `{WORKDIR}`.

#### GitHub Releases option (Linux Debian)

1. launch the command shell either by launching from the Apps section, or pressing `Ctrl-Alt-T`.
2. prepare `{WORKDIR}`, and create the folder `app` inside it.
3. download the latest release with `wget https://github.com/yt-dlp/yt-dlp/releases/download/{LATESTVERSION}/yt-dlp_linux.zip`. wait for the download to finish.
    - for more information, refer to the section [GitHub Releases for Windows](#github-releases-option-windows).
    - if you don't have `wget` beforehand, install it via `sudo apt-get -y install wget`.
    - to check if `wget` is installed, do `wget --version`.
4. `unzip` the file with the command `unzip yt-dlp_linux.zip -d {WORKDIR}/app/`. if you wish, you can delete the ZIP file afterwards.
    - if you don't have the program, install it with `sudo apt-get -y install unzip`.
5. install `ffmpeg` with the command `sudo apt-get -y install ffmpeg`.
    - I usually don't require installing `python3` since you already have the necessary files needed to operate, but if you want, you can install it alongside `ffmpeg`.

### Arch-based

Arch Linux and its derivatives utilize the `pacman` as their package manager. (not to be confused with Pac-man, a hit arcade game.) Arch Linux natively doesn't have a window manager, but it will be the same as everything else. however, I do recommend to install a window manager before proceeding with the installation. check out this [documentation](https://wiki.archlinux.org/title/window_manager) by Arch Linux or this [video](https://youtu.be/_JYIAaLrwcY) by SomeOrdinaryGamers.

once you're done, you can follow either these options below:

#### `pacman` option

1. launch the command shell.
2. install the dependencies using `sudo pacman -S {PACKAGENAME}`. wait for the installation to finish.
3. prepare your `{WORKDIR}`.

#### GitHub Releases option (Linux Arch)

steps intended for this section are the same as the [Debian](#github-releases-option-linux-debian) side, just note the following:

- replace `apt-get -y install` with `pacman -S`.
- ensure that you have `wget` installed beforehand, as in some cases it's not installed by default.
  - do `wget --version` to determine if the package is installed.

### RHEL-based

nowadays, RHEL and its derivatives mainly utilize `dnf` as its package manager, although one can also use `yum`. with this, you'll have many options regarding this section.

_some of the steps here are still untested as I don't have experience with RHEL yet. will update this documentation with proper steps if necessary._

before tackling one of these steps below, make sure that you have provisioned a `{WORKDIR}` beforehand.

#### `dnf` option

1. launch the commandline utility.
2. execute `sudo dnf -y install yt-dlp ffmpeg python3`.
3. wait for the installaion to finish.

if one of the packages can't be found, skip this whole section and proceed to the next.

refer to the following [documentation](https://redhat.com/sysadmin/install-software-packages-rhel) on the basic steps for installing packages via this platform.

#### `yum` option

1. launch the commandline utility.
2. execute `sudo yum -y install yt-dlp ffmpeg python3`.
3. wait for the installaion to finish.

if one of the packages can't be found, skip this whole section and proceed to the next.

check out this [cheatsheet](https://access.redhat.com/articles/yum-cheat-sheet) to learn more about this platform.

#### `rpm` option

sometimes, when all else fails, you'll just need to do the `rpm` option as most RHEL packages are exported in this format. for this, we'll need either `dnf` or `yum`.

to install the rpm packages locally, download them first from your browser, or use `wget` to fetch the files. once that's done, execute either:

- `sudo dnf -y install {PACKAGEFILE}`, or
- `sudo yum -y localinstall {PACKAGEFILE}`.
  - alternatively, you can use `sudo yum -y localinstall {PACKAGEWEBFILE}` to install the package without the need of `wget`, but the latter will come in handy later.

here are the repositories, courtesy of rpmfind:

- [`wget`](http://www.rpmfind.net/linux/rpm2html/search.php?query=wget)
- [`yt-dlp`](https://rpmfind.net/linux/rpm2html/search.php?query=yt-dlp)
- [`ffmpeg`](https://rpmfind.net/linux/rpm2html/search.php?query=ffmpeg)
- [`python3`](https://rpmfind.net/linux/rpm2html/search.php?query=python3)

#### GitHub Release option (Linux RHEL)

same as the [Debian](#github-releases-option-linux-debian) option, but note the following:

- ensure that you have `wget` installed beforehand.
- `python3` is not required, so you'll just need `ffmpeg` to continue with the operation.

### supplementary notes for installation

#### regarding the binaries from GitHub

although I recommend that the GitHub Release will be at the latest vesion, you can only download it **once**. that is because embedded within the app is a self-service mechanism that detects if there is the latest version available. depending on where you obtained the app, most instances only require that you update through `yt-dlp -U`.

however, in some cases, Debian-based distributions will prevent you from updating through the self-update mechanism if you installed them through `apt`. in that case, follow the instructions to allow updating the app.

#### regarding WSL (Windows Subsystem for Linux)

starting with Windows 10 1903 (x64) or 2004 (ARM), you can take advantage of **Windows Subsystem for Linux** without switching OSes or PCs!! most operations involved in this main section will also work with WSL -- it will only depend on what distribution you're using. for an overview of this new platform, visit this [article](https://learn.microsoft.com/en-us/windows/wsl/about) from Microsoft Docs.

#### regarding other package managers

if you feel that you're comfortable with other package managers regardless of distribution or environment, then google the name of your package manager for details and how to install packages.

however, ensure that your package manager has `yt-dlp` so that you can efficiently work on your options. want to chip in? [contribute](https://github.com/thebelovedmoon/vstream-vod-download/fork) to this repository and send a pull request regarding your package manager of choice!! I'm always happy to accept your requests^^~

#### regarding `snapd`

you can also install `yt-dlp` through `snapd`!! follow the steps below:

1. if you don't have `snapd` installed, follow the steps aligned with your Linux distribution to install it.
2. do `sudo snap install yt-dlp` and wait for the installation to finish.

# instantiating the working directory

before you can proceed to the next step, ensure that `git` is installed if you're working from a commandline. otherwise, consider the following steps below:

## fetching this repository with `git`

if you don't have `git` installed, follow the instructions over at [installation](#installation).

1. on your commandline utility, do `git clone https://github.com/thebelovedmoon/vstream-vod-download.git`.
2. once it finishes downloading, go to the `vstream-vod-download` directory. depending on your distribution, copy the shell to where your `{WORKDIR}` is located.

### supplementary notes

- installing `git` on Windows? refer [here](https://git-scm.com/downloads).
- RPMs for this utility (RHEL only) are sourced [here](https://rpmfind.net/linux/rpm2html/search.php?query=git).

## fetching this repository without `git`

fetching the repository without the need of `git`? you can either interact from a browser or use `wget` from the commandline.

### the browser (GUI) option

1. go to `https://github.com/thebelovedmoon/vstream-vod-download` on your preferred browser.
2. click the green button labeled `Code`, then click `Download ZIP`.
    - it will display as `vstream-vod-download-clonethis.zip` due to GitHub's naming mechanism.
3. when it's done downloading, unzip the file to any location (recommended is close to your `{WORKDIR}`).
4. go to your extracted directory, pick a file that suits your distribution, then copy to `{WORKDIR}`.

### the `wget` option

1. on a commandline, do `wget https://github.com/thebelovedmoon/vstream-vod-download/archive/refs/heads/clonethis.zip`.
2. when it finishes, unzip the file using `unzip clonethis.zip`.
    - the folder will show up as `vstream-vod-download-clonethis` due to GitHub's naming mechanism.
    - if you don't have `unzip`, install it using the steps outlined in [installation](#installation) section. RPMs for this utility (RHEL only) are sourced [here](https://rpmfind.net/linux/rpm2html/search.php?query=unzip).
3. go to your extracted directory, and list the files using either `ls` (UNIX) or `dir` (Windows).
4. choose a file which suits your distribution, and copy to `{WORKDIR}`.

# downloading VStream VODs

**[now we're getting to the exciting part](https://youtu.be/p5dbCoei7LU&t=27s): downloading the VODs**!! most instructions shown here apply to all OSes, but be minded that depending on the instructions you follow in the [installation](#installation) section, you'll only be working in your `{WORKDIR}`.

1. switch to `{WORKDIR}` on your commandline. you can do it in two ways:
    - within the commandline, find your `{WORKDIR}` using either `ls` (UNIX) or `dir` (Windows), then `cd` to it.
    - within your GUI, look for your `{WORKDIR}`, then launch your commandline utility within that folder.
2. (for UNIX only!! for Windows, skip to step 3.) ensure that your script is executable, as they aren't by default. to do this, execute `chmod +x {EXECUTABLE}`.
3. with the script inside your root directory, execute the `{EXECUTABLE}` file.
    - for Windows commandline, just launch by typing the filename. for added confidence and security, append it with `.bat`.
    - for UNIX commandline, prefix your script with `./`. otherwise, prefix with `/bin/sh` and a space.
4. follow the on-screen instructions.
    - it will ask for your VStream VOD url first. go to your channel at `https://vstream.com/c/{YOURCHANNEL}` and copy the url of your VOD. then paste it to the first question with either `Ctrl-V` (for Windows Command Prompt) or `Ctrl-Shift-V` (for UNIX or Windows Terminal).
    - it will ask for your filename next. type in your preferred name before pressing `Enter`. due to the nature the scripts are constructed, it will be rendered as `vstream_{FILENAME}`.
5. sit back and relax. depending on your internet connection, this may take a while depending on the length of your VOD.
    - `yt-dlp` will begin fetching `m3u8`s that make up the fragments of your VOD. after all the fragments have finished with respect to your VOD length, it will compile them altogether render your file as MKV.
    - `ffmpeg` then kicks in, remuxing your MKV file. like on the previous instance, elapsed time is dependent on your video length. when it's done, it will write to disk as MP4.
    - in order to avoid duplication and confusion, the delete utility (`rm -rf` for UNIX, `del /s` for Windows) takes care of deleting the MKV file, leaving you with an MP4 file ready to view.
    - **if in case your download hangs in the middle of downloading in `yt-dlp`: do `Ctrl-C`, `Ctrl-Z`, or close the window; then try again from step 3. don't forget to delete the `.part` file before trying again.**
6. when the download and conversion is done, view the output file using your default video player.

## supplementary notes for WSL

if you've downloaded the VOD through WSL (Windows Subsystem for Linux), don't worry -- these steps will help you in moving to your Windows directory:

1. in your `{WORKDIR}` containing the outputted MP4 file, do `mv *.mp4 /mnt/c/users/{USERNAME}/{OUTPUTDIR}/`.
    - to determine what your account username is, on `cmd.exe`, do `whoami`. it will display your PC name and account username as `{PCNAME}\{USERNAME}`.
    - be minded about the slash `/` at the end as without it will cause your VOD to render as a single non-extension file. if you have multiple VODs in one directory, it will overwrite them.
      - this is caused when there are no existing directory in its parent. if you don't want the slash symbol, ensure that `{OUTPUTDIR}` is provisioned beforehand.
2. view the output file using your default video player.

# tutorial video

[![](https://i.ytimg.com/vi/LotQD6lhUWQ/hq720.jpg)](https://youtu.be/LotQD6lhUWQ)

if you did the instructions via this documentation or the tutorial video, then congrats!!:tada: you have successfully downloaded a VStream VOD and now you can upload it elsewhere at your own convenience!!

# FAQ

here are some frequently-asked questions that might answer your common issues. for more assistance, dm me on Discord at **@thebelovedmoon**!!

**NEW** <br>
**Q:** will this work on private videos? <br>
**A:** as per VStream's policies and the way they handle VODs, you can only work on public and unlisted videos!! in the future, we might add more procedures (like OAuth) to allow you to download private VODs, but we'll leave it to VStream's backend for options.

**NEW** <br>
**Q:** my VOD won't fit on my storage device!! <br>
**A:** keep in mind that we'll be downloading the highest quality VOD so that you can upload it anywhere with ease!! refer to the FORMAT SELECTON on [`yt-dlp`'s README](https://github.com/yt-dlp/yt-dlp#format-selection) for details. we recommend that your storage device of choice is no less than 4GB!! (tested on a 30-min 1080p30 VOD)

**Q:** slow download has been detected, and sometimes it hangs in the middle of the download. <br>
**A:** as per [downloading VStream VODs](#downloading-vstream-vods), interrupt the operation, delete the `.part` file, and try again.

**Q:** download seems to be freezing on Windows, yet is working on other environments. <br>
**A:** if your download doesn't work, switch to a different environment. but if you still want to stick with Windows, then ensure that the WSL is installed along with your preferred distrubution. see [regarding WSL](#regarding-wsl-windows-subsystem-for-linux) for info.

**Q:** can you test for other distributions not included in this distribution? <br>
**A:** I can, but it'll take time and effort to make this work. if you can, refer to [regarding other package managers](#regarding-other-package-managers) and send a pull request!!

**Q:** there's too many `.sh` files!! which one should I choose? <br>
**A:** `.sh` files are distinguished according to their package manager option. to determine which file to choose:

- `arch` regards to Arch-based distributions. they utilize the `pacman` package manager.
- `debian` regards to Debian-based distributions. they utilize the `apt` package manager.
- `macos` regards to the MacOS platform. primarily, this utilizes the `brew` package manager. see [installing on MacOS](#installing-on-macos) for info.
- `snap` regards to Linux platforms utilizing the `snapd` package manager. use your default package manager to install `snapd`.
- `unix` regards to Linux platforms utilizing the [GitHub Releases option](#github-releases-option-linux-debian), requiring the binaries to be downloaded and extracted beforehand.

**Q:** what about the `.bat` files? <br>
**A:** as per [installing on Windows](#installing-on-windows) clause, they are provided assuming your work environment is on the Windows platform. there are two categories:

- `full` means that you need the full ZIP from `yt-dlp` as outlined in the [GitHub Releases option](#github-releases-option-windows).
- `min` means that you'll need just the ZIP I provided as outline in the [ZIP option](#zip-file-option).

**Q:** can I change the name of `{WORKDIR}`? <br>
**A:** you can!! just note that you can't rename the `app` directory as the script will fail to forward the arguments to.

**Q:** what does the MD5 and SHA256 hashfiles mean? <br>
**A:** these hashfiles determine the authenticity of the files to avoid downloading any potential malware. as a precaution, **execute the commands at your own risk!!** some of them are still yet to be tested and results may vary.

**Q:** how can I reach you for any inquiries? <br>
**A:** you can shoot me a dm on Discord at **@thebelovedmoon**, mention me on [**VStream Discord**](https://discord.gg/vstream), or send me an [**email**](mailto:jelsa14018@gmail.com)!!

# file checksums

_updated 27 Sep 2023_

these signatures are provided in `MD5` and `SHA256` to ensure that your files are safe to download.

| file                                | md5                                      | sha256                                                                   |
|-------------------------------------|------------------------------------------|--------------------------------------------------------------------------|
| `dl-vstream-arch.sh`                | `2dd88022d792776e37893164078796f5`       | `0782b1786cc38e1691f8fce032665f02c0ff5df5d11458cafc6e64e5f3a8da9f`       |
| `dl-vstream-debian.sh`              | `7fb4e89fe3edabc54cc467e7bb8372a5`       | `b21a976393885ac27da30c7792e0ad1b6b1ffa610ef9963e87341b1042fd874a`       |
| `dl-vstream-macos.sh`               | `8bb8cc6cffd66b220e57caeee2bf9bc1`       | `68c0806767cf38f47a0a299c674ed4ef878616f188ba25c7d94f96f962a3ab1d`       |
| `dl-vstream-snap.sh`                | `1fe0a372305b47610971c4dfe20c58ee`       | `d794ef02be549aa9373f26a3de1d461cad67137375e1e6ed7417f45c2b2fb6e4`       |
| `dl-vstream-unix.sh`                | `4ebf16b2d53d218f9dfb02d22806da6c`       | `150d59b0599e69de662bc4dbe2512ee30102df465fa5adbd2c2ce48334873cd4`       |
| `dl-vstream-windows-full.bat`       | `85686af1b92c0677b23938f1c2e80df6`       | `472ecb7b69ca59e144b1c2550b9181701789f57b1594f9cfd6c01227677d1176`       |
| `dl-vstream-windows-min.bat`        | `bff2c6cfc03117945cf4974cf21105a6`       | `1f7193b4ad582c3ee5837792cb560274e2da18355819c5d7364718865056b374`       |

## verifying file checksums

for this, you'll need a text editor and a commandline utility. and make sure to copy-paste what hashfiles were displayed above before performing this commandline operation.

### Windows

1. `cd` to the folder which contains the files you cloned beforehand.
    - for a quicker approach, open the folder which contains the files in File Explorer, press `F4` to open the address bar, `Ctrl-A` to select all the strings, type `cmd` then press `Enter`.
2. do `certutil -hashfile {EXECUTABLE} md5` to output its MD5 hash. repeat the same process but replacing `md5` with `sha256`.
3. copy-paste what was outputted in the commandline to your text editor, and do a visual inspection of them. if you find any inconsistency, clean the folder and re-clone the repository.

### UNIX (MacOS, Linux and/or WSL)

1. `cd` to the folder which contains the files you cloned beforehand.
    - for a quicker approach, open the folder which the files in your display manager's File Manager, then right-click and select `Open Terminal`. in some display managers like KDE, press `Shift-F4` to open the commandline utility.
2. do `md5sum {EXECUTABLE}`, then `sha256sum {EXECUTABLE}`.
3. copy-paste what was outputted in the commandline to your text editor, and do a visual inspection of them. if you find any inconsistency, clean the folder and re-clone the repository. see [instantiating the working directory](#instantiating-the-working-directory) for more info.