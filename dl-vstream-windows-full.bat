@echo off

set /p url= "enter a VStream URL here: "
set /p file= "enter a filename to save to: "

echo:
echo updating yt-dlp and downloading file. standby...
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT app\yt-dlp_x86 -U && app\yt-dlp_x86 -o vstream_%file%.mkv --downloader ffmpeg %url% --verbose
if %OS%==64BIT app\yt-dlp -U && app\yt-dlp -o vstream_%file%.mkv --downloader ffmpeg %url% --verbose

echo:
echo converting file to MP4. standby...
app\ffmpeg -loglevel debug -i vstream_%file%.mkv -codec copy vstream_%file%.mp4

echo:
echo deleting MKV file. standby...
del /s vstream_%file%.mkv

echo:
echo "download completed and converted successfully."