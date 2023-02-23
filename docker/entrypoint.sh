#!/bin/bash
PATH_TO_CHAINS="/home/${USR_NAME}/src/chains/"
DEFAULT_CHAIN_NAME="arabica"

whoami

# check if the chains folder is empty, if so, we generate a default one
if [ -z "$(ls -A $PATH_TO_CHAINS/mainnet/)" ]; then
    echo "================================================"
    echo "Not found any file, creating the default one..."
    echo "================================================"
    mkdir -p ${PATH_TO_CHAINS}/mainnet/
    cat <<EOF > ${PATH_TO_CHAINS}/mainnet/${DEFAULT_CHAIN_NAME}.json
{
  "chain_name": "arabica",
  "coingecko": "",
  "api": ["https://api.limani.celestia-devops.dev"],
  "rpc": ["https://rpc.limani.celestia-devops.dev"],
  "sdk_version": "0.46.1",
  "coin_type": "118",
  "min_tx_fee": "300",
  "addr_prefix": "utia",
  "logo": "/logos/androma.png",
  "assets": [
    {
      "base": "uandr",
      "symbol": "ANDR",
      "exponent": "6",
      "coingecko_id": "",
      "logo": "/logos/celestia.png"
    }
  ]
}
EOF
cp ${PATH_TO_CHAINS}/mainnet/arabica.json ${PATH_TO_CHAINS}/testnet/arabica.json
fi

echo "================================================"
echo "[INFO] Installing packages..."
echo "================================================"
yarn
echo "================================================"
echo "[INFO] Building the app..."
echo "================================================"
yarn build
echo "================================================"
echo "[INFO] The service has been built"
echo "================================================"
echo "[INFO] Copying the dist folder to the nginx"
echo "================================================"
cp -R dist/* /usr/share/nginx/html/

echo "================================================"
echo "[INFO] Starting Nginx..."
echo "================================================"
nginx -g "daemon off;"
