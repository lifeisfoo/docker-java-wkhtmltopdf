# docker-java-wkhtmltopdf
A docker image with openjdk 8 jre and wkhtmltopdf

With this docker image you have both openjdk jre 8 and wkhtmltopdf available (that's what I need now).

## Why?
Because Debian jessie, the base image for openjdk images, has some problems the already packaged wkhtmltopdf:

- http://unix.stackexchange.com/questions/192642/wkhtmltopdf-qxcbconnection-could-not-connect-to-display
- https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2037
