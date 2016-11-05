# docker-java-wkhtmltopdf
A docker image with openjdk 8 jre and wkhtmltopdf

With this docker image you have both openjdk jre 8 and wkhtmltopdf available (that's what I need now).

## Why?
Because Debian jessie, the base image for openjdk images, has some problems with the [included wkhtmltopdf](https://packages.debian.org/jessie/wkhtmltopdf):

- http://unix.stackexchange.com/questions/192642/wkhtmltopdf-qxcbconnection-could-not-connect-to-display
- https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2037

### Why not use jre-alpine as a base?
[I've make a five minutes try](https://gist.github.com/lifeisfoo/31acf58950a5ff280e5c6cd366bd052c) without success.
That gist is only a port of the [Docker-Alpine-wkhtmltopdf](https://github.com/alloylab/Docker-Alpine-wkhtmltopdf) base image to the jre-alpine base image. The difference, and probably the cause of the errors, is the alpine version in use.

Some useful links about alpine and wkhtmltopdf:
- https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2554 
- https://github.com/madnight/docker-alpine-wkhtmltopdf (it includes a custom built binary, not very security-friendly)
