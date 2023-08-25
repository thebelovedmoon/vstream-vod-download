#! /bin/sh

read -p "enter a VStream URL here: " url
read -p "enter a file name to save to: " file

echo
echo "updating yt-dlp and downloading file. standby..."
./app/yt-dlp_linux -U
./app/yt-dlp_linux -o vstream_$file.mkv --downloader ffmpeg $url --verbose

echo
echo "converting file to MP4. standby..."
ffmpeg -loglevel debug -i vstream_$file.mkv -codec copy vstream_$file.mp4

echo
echo "deleting MKV file. standby..."
rm -rf vstream_$file.mkv

echo
echo "download completed and converted successfully."