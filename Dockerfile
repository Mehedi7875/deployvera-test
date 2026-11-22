FROM python:3.12-slim
RUN apt-get update && apt-get install -y curl ca-certificates gnupg && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs && npm install -g @binance/agentic-wallet && rm -rf /var/lib/apt/lists/*
COPY test.sh /test.sh
CMD ["bash", "/test.sh"]
