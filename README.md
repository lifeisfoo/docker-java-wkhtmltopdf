# docker-java-wkhtmltopdf
A docker image with openjdk 8 jre and wkhtmltopdf

Debian jessie has some problem with headless wkhtmltopdf:

- http://unix.stackexchange.com/questions/192642/wkhtmltopdf-qxcbconnection-could-not-connect-to-display
- https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2037

With this docker image you have both openjdk jre 8 and wkhtmltopdf available (that's what I need now).
