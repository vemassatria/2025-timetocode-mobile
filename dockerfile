# Gunakan image dengan Android SDK lengkap
FROM ghcr.io/cirruslabs/flutter:3.29.3

# Setup environment
ENV ANDROID_ADB_SERVER_ADDRESS=host.docker.internal:5037
ENV ADB_VENDOR_KEYS=/root/.android/adbkey

# Install tools
RUN yes | sdkmanager "platform-tools" && \
    apt-get update && apt-get install -y net-tools

WORKDIR /app
COPY . .

CMD ["flutter", "run", "-d", "10.252.134.205:5555"]
