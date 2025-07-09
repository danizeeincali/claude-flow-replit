#!/bin/bash

# Minimal Claude Flow installation script for environments with issues
# This skips interactive components and focuses on core installation

set -e

echo "🚀 Minimal Claude Flow Installation"
echo "=================================="

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check Node.js (simplified)
print_status "Checking Node.js..."
if ! command -v node &> /dev/null; then
    print_error "Node.js not found. Please install Node.js >= 20.0.0"
    exit 1
fi

NODE_VERSION=$(node --version)
print_status "Node.js version: $NODE_VERSION"

# Check npm
if ! command -v npm &> /dev/null; then
    print_error "npm not found"
    exit 1
fi

print_status "npm version: $(npm --version)"

# Install Claude Flow only (skip Claude CLI to avoid interactive issues)
print_status "Installing Claude Flow..."
if npx --y claude-flow@alpha init --force; then
    print_status "Claude Flow installed successfully ✓"
else
    print_error "Claude Flow installation failed"
    exit 1
fi

# Test Claude Flow
print_status "Testing Claude Flow..."
if npx claude-flow@alpha --help &> /dev/null; then
    print_status "Claude Flow is working ✓"
else
    print_warning "Claude Flow may have issues"
fi

# Create minimal configuration
print_status "Creating minimal configuration..."
mkdir -p .claude

cat > .claude/settings.json << 'EOF'
{
  "environment": {
    "platform": "replit",
    "minimal_mode": true
  },
  "claude_flow": {
    "auto_spawn": true,
    "max_agents": 4
  }
}
EOF

print_status "✅ Minimal installation complete!"
echo ""
echo "📋 What was installed:"
echo "  ✅ Claude Flow v2.0.0-alpha"
echo "  ✅ Basic configuration"
echo ""
echo "⚠️  What was skipped:"
echo "  ❌ Claude CLI (due to interactive mode issues)"
echo "  ❌ Full permissions setup"
echo ""
echo "🚀 You can now use Claude Flow directly:"
echo "  npx claude-flow@alpha --help"
echo "  npx claude-flow@alpha hive-mind wizard"
echo ""
echo "📚 For Claude CLI, install it separately when in an interactive environment"