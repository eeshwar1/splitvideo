

filepath=$1
pathname="${filepath%/*}"
fullfilename="${filepath##*/}"
filenameonly="${fullfilename%.*}"
_filenameonly=${filenameonly// /_}

echo "Split video " $fullfilename " at " $pathname

FFMPEG="/opt/homebrew/bin/ffmpeg"
$FFMPEG -i "$filepath" -c copy -map 0 -segment_time 00:00:30 -f segment -reset_timestamps 1 ~/Movies/Test/$_filenameonly%03d.mp4

