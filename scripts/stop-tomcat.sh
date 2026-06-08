#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TOMCAT_DIR="$ROOT_DIR/tomcat"

if [ ! -d "$TOMCAT_DIR" ]; then
  echo "Tomcat not found at $TOMCAT_DIR."
  exit 1
fi

echo "Stopping Tomcat at $TOMCAT_DIR..."
"$TOMCAT_DIR/bin/shutdown.sh"
echo "Tomcat stop command issued." 
