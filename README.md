# Video Proecessing

Start the application by `python3 -m http.server`.

Make sure that `ffmpeg` and `Bento4` tools are installed and included in PATH.

Set DASH audio output bitrate to maximum quality bitrate. Currently it is set to `720p` and `256k`.

## Recommended Video and Audio Bitrates

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

## License Server

Navigate to `server`. Install dependencies ( `yarn install` ) and start( `yarn start` ).

It creates a simple server and handles clearkey licensing for both MPEG DASH and HLS. For more information, check [this link](https://www.w3.org/TR/encrypted-media/).

As an alternative, you can use `getLicense` method in player config.
