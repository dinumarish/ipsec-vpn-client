FROM debian:bullseye

# Set the working directory
WORKDIR /opt/src

# Install system dependencies
RUN apt-get -yqq update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yqq --no-install-recommends install \
    dnsutils openssl ca-certificates kmod \
    iproute2 gawk grep sed net-tools iptables \
    bsdmainutils libcurl3-nss \
    nano strongswan rsyslog ppp libpcap0.8 \
    curl iputils-ping netcat \
    python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



# Copy the rest of the application files
COPY . /opt/src/

# Ensure that run.sh is executable
RUN chmod 755 /opt/src/run.sh

# Specify the command to run the application
CMD ["bash", "/opt/src/run.sh"]

