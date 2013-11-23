# FFmpeg Thumbnailer on Heroku

Sample project with vendored ffmpeg + ffmpegthumbnailer that will run on Heroku's cedar stack


## Configure Rails app

1. Add vendor/ffmpeg
2. Add vendor/ffmpegthumbnailer
3. Config PATH var: 
```heroku config:set PATH=bin:vendor/ffmpeg/bin:vendor/ffmpegthumbnailer/bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin -a <<app_name>>```
5. Config LD_LIBRARY_PATH bar: ```heroku config:set LD_LIBRARY_PATH=vendor/ffmpeg/lib:vendor/ffmpegthumbnailer/lib:/usr/local/lib -a <<app_name>>```

# How to compile libs
Use Vulcan if you're brave enough to compile a ffmpeg and ffmpegthumbnailer yourself. The steps are the same as outlined in www.ryandaigle.com/a/using-vulcan-to-build-binary-dependencies-on-heroku

ffmpeg

1. ```wget http://www.ffmpeg.org/releases/ffmpeg-1.2.tar.gz```
2. ```cd ffmpeg-1.2 ```
3. ```vulcan build -v -s . -c "./configure --enable-shared --disable-asm --prefix=/app/vendor/ffmpeg && make && make install" ```

Now, for ffmpegthumbnailer

1. ```wget http://ffmpegthumbnailer.googlecode.com/files/ffmpegthumbnailer-2.0.8.tar.gz ```
2. ```cd ffmpegthumbnailer-2.0.8 ```
3. ```PKG_CONFIG_PATH=/app/vendor/ffmpeg/lib/pkgconfig/ ./configure --prefix=/app/vendor/ffmpegthumbnailer --enable-png --enable-jpeg --enable-static --with-pic ```
4. Now you have both archives, just copy to your app's vendor/