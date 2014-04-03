#!/bin/bash
# Script para emitir en directo usando youtube
# Script original de Juanjo2

url1="rtmp://a.rtmp.youtube.com/live2/ENDPOINT"

#watermark="watermark-new.png"
ffmpeg="/usr/bin/ffmpeg"

$ffmpeg \
-f alsa -i hw:0,0 \
-f x11grab -s 854x480 \
-vcodec libx264 -preset ultrafast -threads 2 -b:v 750k \
-acodec aac -async 1 -strict experimental -g 2 \
-r 30 -f flv "$url1" 

#        -vf "movie=$watermark [watermark]; \
#        [in] [watermark] overlay=5:5 [out]" \

# -acodec libfdk_aac -force_key_frames "expr:gte(t,n_forced*2)"

#-vf scale=-1:360 \

#-vcodec libx264 -force_key_frames "expr:gte(t,n_forced*2)"  -preset ultrafast \
#-acodec libmp3lame -async 1 \
#   -f flv "$url1" \

#-f mpegts - | \
#    $ffmpeg -f mpegts -i - \
#	-c copy -f flv "$url1"
#	-c copy -f flv "$url2"

