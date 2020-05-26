# Video Proecessing

Server root folder by `python3 -m http.server`.

Make sure that `ffmpeg` and `Bento4` tools are installed and included in PATH.

Set audio output bitrate to maximum quality bitrate. It is currently set to `720p` quality and `256k` bitrate.

# Scripts

## DASH

Takes `input.mp4`. Generates multiple bitrate outputs. Then generates fragmented and finally encrypted outputs. The sample `mp4encrypt` command uses 1 key for encryption although multiple keys can be provided. Then deletes all `tmp` files.

## HLS

Takes `input.mp4`. Creates folders for different qualities. Then generates sequences and master files for each quality. Final master file is included in project root. Encryption can be done using either encryption key or licensing server. Current flow uses licensing server. First line of `key.info` is the server endpoint, and the second line is the name of the encryption key. The `key.bin` is a binary file representing the encryption key. Use command below to generate binary file from text file.

```bash
xxd -r -p input.txt key.bin
```

# Recommended Video and Audio Bitrates

|    Quality     | Video Bitrate | Audio Bitrate |
| :------------: | :-----------: | :-----------: |
|      144p      |     200k      |      64k      |
|      240p      |     400k      |      64k      |
|      360p      |     800k      |      96k      |
|      480p      |     1500k     |     128k      |
|    720p(HD)    |     2500k     |     256k      |
| 1080p(Full HD) |     4500k     |     320k      |
|   1440p(2K)    |     8000k     |     320k      |
|   2160p(4K)    |    18000k     |     320k      |

This chart is [ArvanCloud default profile](https://www.arvancloud.com/help/fa/article/360033982534-چگونه-در-پنل-ویدیو-آروان،-یک-پروفایل-اضافه-کنید؟). I also recommend using [YouTube recommended settings](https://support.google.com/youtube/answer/1722171?hl=en) for cases with better bandwidth.

Video height is calculated based on video ratio and width.

# License Server

Navigate to `server`. Install dependencies ( `yarn install` ) and start( `yarn start` ).

It creates a simple server and handles clearkey licensing for both MPEG DASH and HLS.

HLS endpoint handles a `GET` request and returns key in `arrayBuffer` format and `application/octet-stream` content-type.

DASH endpoint handles a `POST` request and recieves a json in `application/octet-stream` format and returns `application/json`.

For more information on DASH keySystem API, check [this link](https://www.w3.org/TR/encrypted-media/).

As an alternative, you can use `getLicense` method in player config(just DASH).

# Advanced Scripts

Current scripts are so naive. They only demonstrate vital tasks.

I'm going to add advanced scripts that cover all the needs of a VoD platform SOON.

So please either STAR or WATCH this repo.

# Contributions

Contributions, issues and feature requests are welcome.

# License

Copyright © 2020 Omid Seyfan.

This project is licensed under the MIT License - see the LICENSE file for details.
