#! /bin/sh

read -p "enter a VStream URL here: " url
read -p "enter a file name to save to: " file

echo
echo "updating yt-dlp and downloading file. standby..."
sudo apt-get update
sudo apt-get -y install yt-dlp
sudo apt-get -y autoremove
sudo apt-get clean
sudo apt-get -y autoclean
yt-dlp -o "vstream_$file.mkv" --downloader ffmpeg $url --verbose

echo
echo "converting file to MP4. standby..."
ffmpeg -loglevel debug -i "vstream_$file.mkv" -codec copy "vstream_$file.mp4"

echo
echo "deleting MKV file. standby..."
rm -rf "vstream_$file.mkv"

echo
echo "download completed and converted successfully."