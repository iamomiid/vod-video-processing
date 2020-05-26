#!/bin/bash
mkdir -p hls/video720
mkdir -p hls/video480
mkdir -p hls/video360
mkdir -p hls/video240
mkdir -p hls/audio
ffmpeg -i input.mp4 -an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 200k -minrate 200k -maxrate 500k -bufsize 400k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:240'" -pix_fmt yuvj420p -hls_time 5 -hls_key_info_file key.info -hls_playlist_type vod -hls_segment_filename hls/video240/fileSequence%d.ts hls/video240/stream.m3u8 \
-an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 400k -minrate 400k -maxrate 400k -bufsize 800k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:360'" -pix_fmt yuvj420p -hls_time 5 -hls_key_info_file key.info -hls_playlist_type vod -hls_segment_filename hls/video360/fileSequence%d.ts hls/video360/stream.m3u8 \
-an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 800k -minrate 800k -maxrate 800k -bufsize 1600k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:480'" -pix_fmt yuvj420p -hls_time 5 -hls_key_info_file key.info -hls_playlist_type vod -hls_segment_filename hls/video480/fileSequence%d.ts hls/video480/stream.m3u8 \
-an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 1500k -minrate 1500k -maxrate 1500k -bufsize 3000k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:720'" -pix_fmt yuvj420p -hls_time 5 -hls_key_info_file key.info -hls_playlist_type vod -hls_segment_filename hls/video720/fileSequence%d.ts hls/video720/stream.m3u8 \
-vn -acodec aac -ab 128k -hls_time 1 -hls_key_info_file key.info -hls_playlist_type vod -hls_segment_filename hls/audio/fileSequence%d.ts hls/audio/stream.m3u8
cp master.m3u8 hls