# docker-java-wkhtmltopdf
A docker image with openjdk 8 jre and [wkhtmltopdf](http://wkhtmltopdf.org)

With this docker image you have both openjdk jre 8 and wkhtmltopdf available (that's what I need now). Wkhtmltopdf is downloaded automatically from the [official binaries](http://wkhtmltopdf.org/downloads.html) during the build.

### Why not use the debiam provided wkhtmltopdf package?
Because Debian jessie, the base image for openjdk images, [has](https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2037) some [problems](http://unix.stackexchange.com/questions/192642/wkhtmltopdf-qxcbconnection-could-not-connect-to-display) with the [included wkhtmltopdf](https://packages.debian.org/jessie/wkhtmltopdf) ("_QXcbConnection: Could not connect to display_" error).

### Why not use jre-alpine as a base?
[I've make a five minutes try](https://gist.github.com/lifeisfoo/31acf58950a5ff280e5c6cd366bd052c) with oraclejdk-alpine as a base without success due to a [docker bug](https://github.com/docker/docker/issues/27940).

So, I've tried porting the [Docker-Alpine-wkhtmltopdf](https://github.com/alloylab/Docker-Alpine-wkhtmltopdf) method (wkhtmltopdf compilation from source) with a oraclejdk-alpine base image: the build was failing because initially some dependencies weren't found in `/alpine/edge/testing`:

    ERROR: unsatisfiable constraints:
      fonts-base (missing):
         required by: world[fonts-base]
      fonts-extra (missing):
         required by: world[fonts-extra]

Then I've found a way (_see notes above_) to build wkhtmltopdf from sources on oraclejdk-alpine base image, but the build take a very long time to complete.

Using (today) the Alpine provided package is also unuseful, because, like Debian, the Alpine included package [doesn't works as expected](https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2554).
Somebody also ended including a [custom built binary](https://github.com/madnight/docker-alpine-wkhtmltopdf) but from my point of view this is not very security-friendly.

## Usage

### Dockerfile

You can use this as a base image for your images, e.g.:

    FROM lifeisfoo/docker-java-wkhtmltopdf
    
    COPY build/libs/your-application-all.jar / 
    CMD java -jar your-application-all.jar

So your application can use the command to generate pdf the code.

### Standalone

You can use it as a standalone image for creating pdf directly from files:

    echo "<h1>Hello</h1><i>world</i>" > hello.html
    docker run -v `pwd`:/pages lifeisfoo/docker-java-wkhtmltopdf wkhtmltopdf file:///pages/hello.html - > hello.pdf
    
Or from URLs:

    docker run lifeisfoo/docker-java-wkhtmltopdf wkhtmltopdf github.com - > github.pdf

### Help

http://wkhtmltopdf.org/usage/wkhtmltopdf.txt

### Notes
§ It is possible to manually add single fonts as dependencies because fonts-base and fonts-extra was only meta-packages:
- http://git.alpinelinux.org/cgit/aports/tree/unmaintained/fonts-base/APKBUILD
- http://git.alpinelinux.org/cgit/aports/tree/unmaintained/fonts-base/APKBUILD
