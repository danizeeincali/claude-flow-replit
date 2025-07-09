#!/bin/bash

# Simple Node.js setup test script
echo "🔍 Testing Node.js setup..."

# Check if we're in a codespace
if [[ -n "$CODESPACE_NAME" ]]; then
    echo "✅ Running in GitHub Codespace"
    # Add codespace-specific Node.js paths
    if [ -f "/home/codespace/nvm/current/bin/node" ]; then
        export PATH="/home/codespace/nvm/current/bin:$PATH"
        echo "✅ Added codespace Node.js to PATH"
    fi
fi

# Check if we're in Replit
if [[ -n "$REPL_SLUG" ]]; then
    echo "✅ Running in Replit environment"
fi

# Source NVM if available
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    source "$HOME/.nvm/nvm.sh"
    echo "✅ NVM sourced"
fi

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js found: $NODE_VERSION"
    
    # Check if version is >= 20.0.0
    NODE_NUM=$(echo $NODE_VERSION | cut -d'v' -f2)
    if [ "$(printf '%s\n' "20.0.0" "$NODE_NUM" | sort -V | head -n1)" = "20.0.0" ]; then
        echo "✅ Node.js version is compatible (>= 20.0.0)"
    else
        echo "❌ Node.js version is too old. Required: >= 20.0.0"
        exit 1
    fi
else
    echo "❌ Node.js not found in PATH"
    echo "Current PATH: $PATH"
    exit 1
fi

# Check npm
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo "✅ npm found: $NPM_VERSION"
else
    echo "❌ npm not found"
    exit 1
fi

# Check npx
if command -v npx &> /dev/null; then
    echo "✅ npx found"
else
    echo "❌ npx not found"
    exit 1
fi

echo "🎉 Node.js setup test passed!"