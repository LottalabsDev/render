FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    xfce4 xfce4-goodies xterm tigervnc-standalone-server \
    novnc websockify firefox && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Set up VNC password
RUN mkdir -p /root/.vnc && \
    echo "123456" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Set environment
ENV DISPLAY=:1
ENV RESOLUTION=1366x768

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose web port
EXPOSE 8080

# Run the startup
CMD ["/start.sh"]
