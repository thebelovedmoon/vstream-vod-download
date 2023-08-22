# VStream download scripts

![windows](https://img.shields.io/badge/tentative_on_Windows-9747ff?logo=windows&logoColor=fff)
![mac](https://img.shields.io/badge/tentative_on_Mac-f31f1f?logo=apple&logoColor=fff)
![linux](https://img.shields.io/badge/works_on_Linux%2FWSL-1476ff?logo=linux&logoColor=fff)

this is the repository reponsible for a one-stop download of scripts designated to efficiently download your VStream VODs!!

this repository has been as the VStream backend has no direct implementation of downloading the VODs from the website yet.

## what this repository contains

we've provided the scripts that works on their designated operating systems:

- `.sh` applies to Linux/Unix, and WSL (Windows Subsystem for Linux) commandline operations.
- `.bat` covers the Windows commandline operations.

## dependencies

the scripts depend on the following:

- `yt-dlp` for download operations
- `ffmpeg` for video processing and conversion

refer to the section below on how to download these dependencies.

<details>

<summary><h1>installing dependencies</h1></summary>

installing these dependencies require that you know which operating system you're using.

## installing on Windows

- download the following [ZIP file](https://cdn.discordapp.com/attachments/1133239175609581638/1143432856455090186/yt-dlp.zip) and put it in any directory you want. be minded that the `yt-dlp` directory will be the working directory moving forward.
  - for file integrity purposes, the ZIP's MD5 hash is `00322b37e9a398e8fe14172c583f7b60`. on Windows, you can re-verify the integrity by executing `certutil -hashfile yt-dlp.zip MD5` in Command Prompt.
- alternatively, you can download `yt-dlp` from the [Releases](https://github.com/yt-dlp/yt-dlp/releases) screen, and `ffmpeg Essentials` from [gyan.dev](https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-essentials.7z). you will only need the `ffmpeg.exe` file for this operation.
  - ensure that there is a workspace directory provisioned beforehand, and that the program files MUST be placed in the `app` directory.

## installing on Linux/WSL (Debian-based, more to come)

- prepare a working directory to place your VODs. do `cd {DIRECTORY}` to begin preparation.
- if you're installing the app from `apt`:
  - `sudo apt-get update` to update the repository files. you will need to enter your password if you have one.
  - `sudo apt-get -y install yt-dlp ffmpeg` to install the app and its dependency.
- if you're installing the app directly from the repository:
  - `wget https://github.com/yt-dlp/yt-dlp/releases/download/{LATESTVERSION}/yt-dlp` where `{LATESTVERSION}` refers to the latest release. for more info, check out the yt-dlp repository on GitHub.
  - `sudo apt-get update && sudo apt-get -y install ffmpeg` to install its dependency.
  - `chmod +x yt-dlp` to make the app executable.

</details>

<details>

<summary><h1>downloading VStream VODs</h1></summary>

once you're done with the steps above, it's time for the main event: downloading your VODs!! follow the steps below:

- find an executable from this repository that is suited for your operating system, and download the file of your choice to the `{DIRECTORY}` working directory.
  - alternatively, use `git clone https://github.com/thebelovedmoon/vstream-vod-download.git` in another directory, and copy your file of choice to the `{DIRECTORY}` working directory.
- (for Linux/WSL only) `chmod +x {EXECUTABLE}` to make the script executable. `{EXECUTABLE}` refers to the file you recently downloaded/copied.
- execute the program.
  - for Windows or Linux with GUI, double-click on the executable.
  - alternatively, in your working directory:
    - for Windows, type the name of the executable. for added context, suffix with `.bat` at the end of the query.
    - for Linux/WSL, prefix `./` before typing your executable.
- follow the instructions.
  - go to your channel at `https://vstream.com/c/@{YOURCHANNEL}`, and copy the URL to your VOD. paste it on the commandline by right-clicking, `Ctrl-V` (for Windows), or `Ctrl-Shift-V` (for Linux/WSL).
  - specify a name for your downloaded VOD. output filename will be rendered as `vstream_{FILENAME}`.
  - sit back and relax. depending on your internet connection and CPU speed, `yt-dlp` will go through the process of updating and downloading the video, and `ffmpeg` will take care of the conversion from MKV to MP4.
    - if you're experiencing slow network speeds, terminate the operation by `Ctrl-C` or `Ctrl-Z`, delete the PART file with `del /s *.part` (Windows) or `rm -rf *.part` (Linux/WSL), and try again from bullet 3.
- after all the operations are completed, view the outputted file.

## supplementary notes for users running WSL

if you did this steps over on WSL (Windows Subsystem for Linux), you can also use the following instructions below:

- in your working directory, do `mv *.mp4 /mnt/c/Users/{USERNAME}/{OUTPUTDIR}/`, where `{USERNAME}` refers to your current username, and `{OUTPUTDIR}` refers to your export directory.
  - to find out what your username is, launch `cmd` and type `whoami`. it will display your PC name and your username as `{PCNAME}\{USERNAME}`.
  - don't forget the last slash `/` as without it will cause your VOD to render as a single file, and overwrite if there are multiple files. this is caused when there are no existing directory in its parent. if you don't want the backslash, ensure that the intended directory is prepared beforehand.

</details>

# tutorial video

_below is a sample video that will be replaced when the tutorial video is published._

[![](https://i.ytimg.com/vi/MNCjEx_yhCU/hq720.jpg)](https://youtu.be/MNCjEx_yhCU)

<details>

<summary><h1>MD5 hashes</h1></summary>

the MD5 hashes are provided for file integrity purposes to prevent you from downloading malware. for more info, check out these articles from [Autodesk](https://autodesk.com/support/technical/article/caas/sfdcarticles/sfdcarticles/Checking-the-MD5-checksum-of-a-Downloaded-File.html) and [La De Du](https://ladedu.com/how-to-verify-a-md5-or-sha-checksum-on-windows-10).

- `dl-vstream-apt.sh`: `e4715cd41b8f6793d7b4167355bc25e8`
- `dl-vstream-selfupdate.sh`: `08ae25308df725bb0dcff927fd0dbf14`
- `dl-vstream.bat`: `0480656fb227bfee49f5ba02b0bc797a`

</details>