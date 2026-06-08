#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TOMCAT_DIR="$ROOT_DIR/tomcat"

if [ ! -d "$TOMCAT_DIR" ]; then
  echo "Tomcat not found at $TOMCAT_DIR. Please download Tomcat into that folder or run the setup steps."
  exit 1
fi

echo "Starting Tomcat at $TOMCAT_DIR..."
"$TOMCAT_DIR/bin/startup.sh"
echo "Tomcat start command issued. Check logs: $TOMCAT_DIR/logs/catalina.out"
