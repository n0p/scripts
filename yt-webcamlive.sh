#!/bin/bash
# Script para emitir en directo una webcam usando youtube
# Script original de Juanjo2

url1="rtmp://a.rtmp.youtube.com/live2/$1"

#watermark="watermark-new.png"
ffmpeg="/usr/bin/ffmpeg"

$ffmpeg \
-f alsa -i hw:0,0 \
-f video4linux2 -s 1280x720 -i /dev/video1 \
-vcodec libx264 -preset ultrafast -threads 2 -b:v 5000k \
-acodec aac -async 1 -strict experimental -g 2 -ar 44100 -bufsize 512k -b:a 128k \
-r 30 -f flv "$url1" 

#        -vf "movie=$watermark [watermark]; \
#        [in] [watermark] overlay=5:5 [out]" \

#-vf scale=-1:360 \

#-vcodec libx264 -force_key_frames "expr:gte(t,n_forced*2)"  -preset ultrafast \
#-acodec libmp3lame -async 1 \
