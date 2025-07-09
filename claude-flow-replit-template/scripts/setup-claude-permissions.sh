#!/bin/bash

# Separate script to handle Claude permissions setup
# This can be run manually if the main installation script fails

echo "🔐 Setting up Claude CLI permissions..."

# Check if Claude is installed
if ! command -v claude &> /dev/null; then
    echo "❌ Claude CLI is not installed. Please run the installation script first."
    exit 1
fi

# Check if we're in an interactive environment
if [ ! -t 0 ]; then
    echo "⚠️  Non-interactive environment detected"
    echo "   Please run this script in an interactive terminal"
    echo "   Or manually run: claude --dangerously-skip-permissions"
    exit 1
fi

# Set up permissions
echo "Setting up Claude CLI permissions..."
echo "This will allow Claude to run commands safely in your environment."
echo ""

# Try to configure permissions
if claude --dangerously-skip-permissions; then
    echo "✅ Claude CLI permissions configured successfully"
    echo "🚀 Claude is now ready to use!"
else
    echo "❌ Failed to configure Claude permissions"
    echo "   You may need to run this manually:"
    echo "   claude --dangerously-skip-permissions"
    exit 1
fi