#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
mkdir -p /root/lab
if ! command -v az >/dev/null 2>&1; then
  curl -sL https://aka.ms/InstallAzureCLIDeb | bash >/dev/null 2>&1 || true
fi
# Azurite via Docker (preinstalled on the backend); fall back to npm if needed.
docker rm -f azurite >/dev/null 2>&1 || true
docker run -d --name azurite -p 10000:10000 mcr.microsoft.com/azure-storage/azurite \
  azurite-blob --blobHost 0.0.0.0 >/dev/null 2>&1 || {
    apt-get update -qq >/dev/null 2>&1 || true
    apt-get install -y -qq npm >/dev/null 2>&1 || true
    npm install -g azurite >/dev/null 2>&1 || true
    nohup azurite-blob --blobHost 0.0.0.0 >/tmp/azurite.log 2>&1 &
  }
cat > /root/lab/conn.env <<'ENV'
export AZ_CONN="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;"
ENV
echo "hello dev bench" > /root/lab/hello.txt
touch /root/.lab-ready
