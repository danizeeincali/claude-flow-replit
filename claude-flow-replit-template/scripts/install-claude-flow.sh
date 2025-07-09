#!/bin/bash

# Claude Flow + Claude Installation Script for Replit
# This script installs Claude Code CLI and Claude Flow with Replit-optimized configuration

set -e

echo "🚀 Starting Claude Flow + Claude Installation for Replit..."
echo "=================================================="

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running in Replit
if [[ -z "$REPL_SLUG" ]]; then
    print_warning "Not running in Replit environment. Some features may not work correctly."
fi

# Check Node.js version
print_status "Checking Node.js version..."

# Source common Node.js paths
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    source "$HOME/.nvm/nvm.sh"
fi

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Check if node is available
if ! command -v node &> /dev/null; then
    # Try alternative paths
    if [ -f "/home/codespace/nvm/current/bin/node" ]; then
        export PATH="/home/codespace/nvm/current/bin:$PATH"
    elif [ -f "/usr/bin/node" ]; then
        export PATH="/usr/bin:$PATH"
    else
        print_error "Node.js is not installed. Please install Node.js >= 20.0.0"
        print_error "In Replit, Node.js should be available by default."
        print_error "Try running: nvm install 20 && nvm use 20"
        exit 1
    fi
fi

# Verify node is now available
if ! command -v node &> /dev/null; then
    print_error "Node.js is not accessible. Please check your installation."
    exit 1
fi

NODE_VERSION=$(node --version | cut -d'v' -f2)
REQUIRED_VERSION="20.0.0"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$NODE_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    print_error "Node.js version $NODE_VERSION is too old. Required: >= $REQUIRED_VERSION"
    exit 1
fi

print_status "Node.js version $NODE_VERSION is compatible ✓"

# Check Python version
print_status "Checking Python version..."
if ! command -v python3 &> /dev/null; then
    print_error "Python3 is not installed"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
print_status "Python version $PYTHON_VERSION is available ✓"

# Install Claude Code CLI
print_status "Installing Claude Code CLI..."

# Ensure npm is available
if ! command -v npm &> /dev/null; then
    print_error "npm is not available. Please check your Node.js installation."
    exit 1
fi

npm install -g @anthropic-ai/claude-code

# Verify Claude installation
if ! command -v claude &> /dev/null; then
    print_error "Claude CLI installation failed"
    exit 1
fi

print_status "Claude CLI installed successfully ✓"

# Test Claude CLI without interactive mode
print_status "Testing Claude CLI installation..."
if claude --version &> /dev/null; then
    print_status "Claude CLI is working correctly ✓"
else
    print_warning "Claude CLI may have issues in this environment"
    print_warning "This is common in non-interactive environments"
fi

# Configure Claude permissions for Replit
print_status "Configuring Claude permissions for Replit..."
# Skip permissions setup in non-interactive environments
if [ ! -t 0 ]; then
    print_status "Non-interactive environment detected, skipping permissions setup"
    print_status "You may need to run 'claude --dangerously-skip-permissions' manually later"
else
    echo "y" | claude --dangerously-skip-permissions || true
fi

# Install Claude Flow
print_status "Installing Claude Flow v2.0.0-alpha..."

# Ensure npx is available
if ! command -v npx &> /dev/null; then
    print_error "npx is not available. Please check your Node.js installation."
    exit 1
fi

npx --y claude-flow@alpha init --force

# Verify Claude Flow installation
if ! npx claude-flow@alpha --help &> /dev/null; then
    print_error "Claude Flow installation failed"
    exit 1
fi

print_status "Claude Flow installed successfully ✓"

# Create .claude directory if it doesn't exist
mkdir -p .claude

# Create Replit-optimized Claude settings
print_status "Creating Replit-optimized Claude configuration..."
cat > .claude/settings.json << 'EOF'
{
  "environment": {
    "platform": "replit",
    "auto_commit": false,
    "telemetry": true,
    "github_integration": true,
    "replit_secrets": true
  },
  "hooks": {
    "pre_edit": "npx claude-flow hooks pre-edit",
    "post_edit": "npx claude-flow hooks post-edit",
    "pre_command": "npx claude-flow hooks pre-command",
    "post_command": "npx claude-flow hooks post-command",
    "session_end": "npx claude-flow hooks session-end"
  },
  "permissions": {
    "allowed_commands": [
      "npm", "npx", "python3", "pip", "git", "curl", "wget", "tree", "ls", "cat", "mkdir", "touch", "rm", "cp", "mv"
    ],
    "blocked_commands": [
      "sudo", "su", "chmod +x", "rm -rf /", "dd", "mkfs"
    ]
  },
  "performance": {
    "max_agents": 8,
    "parallel_execution": true,
    "memory_limit": "512MB",
    "timeout": 300
  },
  "replit": {
    "webview_enabled": true,
    "secrets_integration": true,
    "auto_deploy": false,
    "debug_mode": true
  }
}
EOF

# Create Claude Flow configuration for Replit
print_status "Creating Claude Flow Replit configuration..."
cat > claude-flow-config.json << 'EOF'
{
  "version": "2.0.0-alpha.37",
  "platform": "replit",
  "features": {
    "hive_mind": true,
    "neural_training": true,
    "github_integration": true,
    "memory_persistence": true,
    "auto_scaling": true
  },
  "replit": {
    "webview_port": 3000,
    "secrets_support": true,
    "deployment_ready": true,
    "uat_testing": true
  },
  "agents": {
    "default_topology": "hierarchical",
    "max_agents": 8,
    "auto_spawn": true,
    "specializations": [
      "researcher", "coder", "analyst", "tester", "architect", "coordinator"
    ]
  },
  "memory": {
    "persistence": true,
    "cross_session": true,
    "namespace": "replit-template"
  }
}
EOF

# Create example environment file
print_status "Creating example environment configuration..."
cat > .env.example << 'EOF'
# Claude API Configuration
# Add your Claude API key to Replit Secrets as CLAUDE_API_KEY
CLAUDE_API_KEY=your_claude_api_key_here

# Claude Flow Configuration
CLAUDE_FLOW_VERSION=2.0.0-alpha.37
CLAUDE_FLOW_AUTO_SPAWN=true
CLAUDE_FLOW_MAX_AGENTS=8

# Replit Configuration
REPLIT_ENVIRONMENT=true
REPLIT_WEBVIEW_PORT=3000
REPLIT_DEBUG_MODE=true

# Optional: GitHub Integration
GITHUB_TOKEN=your_github_token_here
GITHUB_REPO=your_username/your_repo
EOF

# Create secrets setup script
print_status "Creating secrets management script..."
cat > scripts/setup-secrets.py << 'EOF'
#!/usr/bin/env python3
"""
Replit Secrets Management for Claude Flow
Helps users configure API keys and secrets through Replit's secure system
"""

import os
import sys

def check_replit_env():
    """Check if running in Replit environment"""
    return os.getenv('REPL_SLUG') is not None

def check_secrets():
    """Check if required secrets are configured"""
    required_secrets = ['CLAUDE_API_KEY']
    missing_secrets = []
    
    for secret in required_secrets:
        if not os.getenv(secret):
            missing_secrets.append(secret)
    
    return missing_secrets

def main():
    print("🔐 Claude Flow Secrets Configuration")
    print("=" * 40)
    
    if not check_replit_env():
        print("⚠️  Not running in Replit environment")
        print("   Please run this in your Replit environment")
        sys.exit(1)
    
    missing = check_secrets()
    
    if missing:
        print(f"❌ Missing required secrets: {', '.join(missing)}")
        print("\n📋 To configure secrets in Replit:")
        print("1. Click the 'Secrets' tab in the sidebar")
        print("2. Add the following secrets:")
        for secret in missing:
            print(f"   - {secret}: Your API key")
        print("3. Restart this script")
        sys.exit(1)
    
    print("✅ All required secrets are configured!")
    print("🚀 Claude Flow is ready to use")

if __name__ == "__main__":
    main()
EOF

chmod +x scripts/setup-secrets.py

# Create test script
print_status "Creating test script..."
cat > scripts/test-installation.sh << 'EOF'
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
EOF

chmod +x scripts/test-installation.sh

# Create run script
print_status "Creating run script..."
cat > run.sh << 'EOF'
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
EOF

chmod +x run.sh

# Make installation script executable
chmod +x scripts/install-claude-flow.sh

print_status "Installation completed successfully! 🎉"
echo ""
echo "📋 Next Steps:"
echo "1. Configure your Claude API key in Replit Secrets"
echo "2. Run: python3 scripts/setup-secrets.py"
echo "3. Test installation: ./scripts/test-installation.sh"
echo "4. Start Claude Flow: ./run.sh"
echo ""
echo "🔗 Resources:"
echo "- Claude Flow: https://github.com/ruvnet/claude-flow"
echo "- Claude API: https://claude.ai"
echo "- Replit Docs: https://docs.replit.com"
echo ""
echo "🚀 Happy coding with Claude Flow on Replit!"