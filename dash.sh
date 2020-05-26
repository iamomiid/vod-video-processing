#!/bin/bash
mkdir -p tmp
ffmpeg -i input.mp4 -vn -acodec aac -ab 256k tmp/audio.mp4 
ffmpeg -i input.mp4 -an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 200k -minrate 200k -maxrate 200k -bufsize 400k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:240'" -pix_fmt yuvj420p tmp/video-240p.mp4 
ffmpeg -i input.mp4 -an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 400k -minrate 400k -maxrate 400k -bufsize 800k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:360'" -pix_fmt yuvj420p tmp/video-360p.mp4
ffmpeg -i input.mp4 -an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 800k -minrate 800k -maxrate 800k -bufsize 1600k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:480'" -pix_fmt yuvj420p tmp/video-480p.mp4
ffmpeg -i input.mp4 -an -c:v libx264 -preset veryslow -profile:v high -level 4.2 -b:v 1500k -minrate 1500k -maxrate 1500k -bufsize 3000k -g 96 -keyint_min 96 -sc_threshold 0 -filter:v "scale='trunc(oh*a/2)*2:720'" -pix_fmt yuvj420p tmp/video-720p.mp4
cd tmp
mp4fragment video-720p.mp4 video-720p-fragmented.mp4
mp4fragment video-480p.mp4 video-480p-fragmented.mp4
mp4fragment video-360p.mp4 video-360p-fragmented.mp4
mp4fragment video-240p.mp4 video-240p-fragmented.mp4 
mp4fragment audio.mp4 audio-fragmented.mp4 
mp4encrypt --method MPEG-CENC --key 1:617D8A125A284DF48E3C6B1866348A3F:random --property 1:KID:B326F895B6A24CC5A4DC70995728059C  --global-option mpeg-cenc.eme-pssh:true video-240p-fragmented.mp4 video-240p-fragmented-encrypted.mp4
mp4encrypt --method MPEG-CENC --key 1:617D8A125A284DF48E3C6B1866348A3F:random --property 1:KID:B326F895B6A24CC5A4DC70995728059C  --global-option mpeg-cenc.eme-pssh:true video-360p-fragmented.mp4 video-360p-fragmented-encrypted.mp4
mp4encrypt --method MPEG-CENC --key 1:617D8A125A284DF48E3C6B1866348A3F:random --property 1:KID:B326F895B6A24CC5A4DC70995728059C  --global-option mpeg-cenc.eme-pssh:true video-480p-fragmented.mp4 video-480p-fragmented-encrypted.mp4
mp4encrypt --method MPEG-CENC --key 1:617D8A125A284DF48E3C6B1866348A3F:random --property 1:KID:B326F895B6A24CC5A4DC70995728059C  --global-option mpeg-cenc.eme-pssh:true video-720p-fragmented.mp4 video-720p-fragmented-encrypted.mp4
mp4encrypt --method MPEG-CENC --key 1:617D8A125A284DF48E3C6B1866348A3F:random --property 1:KID:B326F895B6A24CC5A4DC70995728059C  --global-option mpeg-cenc.eme-pssh:true audio-fragmented.mp4 audio-fragmented-encrypted.mp4
mp4dash -o ../dash video-240p-fragmented-encrypted.mp4 video-360p-fragmented-encrypted.mp4 video-480p-fragmented-encrypted.mp4 video-720p-fragmented-encrypted.mp4 audio-fragmented-encrypted.mp4
rm -rf *