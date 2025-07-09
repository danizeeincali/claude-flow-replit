#!/bin/bash

echo "🧪 Testing Claude Flow + Claude Installation"
echo "==========================================="

# Test Claude CLI
echo "Testing Claude CLI..."
if claude --version; then
    echo "✅ Claude CLI is working"
else
    echo "❌ Claude CLI failed"
    exit 1
fi

# Test Claude Flow
echo "Testing Claude Flow..."
if npx claude-flow@alpha --help > /dev/null 2>&1; then
    echo "✅ Claude Flow is working"
else
    echo "❌ Claude Flow failed"
    exit 1
fi

# Test Node.js
echo "Testing Node.js..."
if node --version; then
    echo "✅ Node.js is working"
else
    echo "❌ Node.js failed"
    exit 1
fi

# Test Python
echo "Testing Python..."
if python3 --version; then
    echo "✅ Python is working"
else
    echo "❌ Python failed"
    exit 1
fi

# Test secrets
echo "Testing secrets configuration..."
python3 scripts/setup-secrets.py

echo "🎉 All tests passed! Claude Flow is ready to use."