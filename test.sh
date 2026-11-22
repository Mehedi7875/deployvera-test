#!/bin/bash
echo "=== DeployVera environment test ==="
echo "date: $(date)"
echo "cpu cores: $(nproc)"
free -m
python3 --version
node --version
echo "--- baw CLI ---"
baw --version 2>&1 || baw version 2>&1 || echo "baw version command unclear, binary present: $(which baw)"
echo "--- outbound connectivity ---"
curl -s -o /dev/null -w "api.telegram.org -> HTTP %{http_code}\n" https://api.telegram.org
curl -s -X POST https://bsc-dataseed.binance.org -H 'Content-Type: application/json' -d '{"jsonrpc":"2.0","id":1,"method":"eth_blockNumber","params":[]}' ; echo " <- BSC RPC eth_blockNumber"
curl -s -o /dev/null -w "sourcify.dev -> HTTP %{http_code}\n" https://sourcify.dev
curl -s -o /dev/null -w "bscscan.com -> HTTP %{http_code}\n" https://bscscan.com
echo "=== test done, staying alive ==="
while true; do echo "alive $(date)"; sleep 300; done
