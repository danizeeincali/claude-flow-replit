#!/bin/bash

echo "🚀 Starting Claude Flow Replit Template"
echo "======================================"

# Check if secrets are configured
python3 scripts/setup-secrets.py

# Start Claude Flow hive mind
echo "Starting Claude Flow hive mind..."
npx claude-flow@alpha hive-mind wizard

echo "✅ Claude Flow is running!"
echo "🌐 Access the webview at: https://$REPL_SLUG.$REPL_OWNER.repl.co"