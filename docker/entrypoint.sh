#!/bin/bash
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
echo "[INFO] Copying the dist resources to the nginx folder"
echo "================================================"
cp -R dist/* /usr/share/nginx/html/

echo "================================================"
echo "[INFO] Starting Nginx..."
echo "================================================"
nginx -g "daemon off;"
