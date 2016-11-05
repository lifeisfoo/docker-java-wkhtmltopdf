FROM openjdk:8u102-jre

RUN apt-get update && apt-get install -y \
		wkhtmltopdf \
                && rm -rf /var/lib/apt/lists/*

RUN curl -O http://download.gna.org/wkhtmltopdf/0.12/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz && \
    tar -xvJ -f wkhtmltox-0.12.3_linux-generic-amd64.tar.xz wkhtmltox/bin/wkhtmltopdf && \
    mv wkhtmltox/bin/wkhtmltopdf /usr/bin && \
    rm -rf wkhtmltox && \
    rm wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
