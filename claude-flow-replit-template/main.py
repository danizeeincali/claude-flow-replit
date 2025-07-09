#!/usr/bin/env python3
"""
Claude Flow Replit Template - Main Entry Point
This is the main entry point for the Claude Flow Replit template.
"""

import os
import sys
import json
from pathlib import Path

def check_environment():
    """Check if running in Replit environment"""
    return os.getenv('REPL_SLUG') is not None

def check_claude_flow_setup():
    """Check if Claude Flow is properly configured"""
    config_files = [
        '.claude/settings.json',
        'claude-flow-config.json',
        'scripts/install-claude-flow.sh'
    ]
    
    missing_files = []
    for file in config_files:
        if not Path(file).exists():
            missing_files.append(file)
    
    return missing_files

def display_welcome():
    """Display welcome message and setup instructions"""
    print("🚀 Claude Flow Replit Template")
    print("=" * 50)
    print("Welcome to the Claude Flow integration for Replit!")
    print("")
    
    if check_environment():
        print("✅ Running in Replit environment")
    else:
        print("⚠️  Not running in Replit environment")
    
    print("")
    print("📋 Setup Instructions:")
    print("1. Configure your Claude API key in Replit Secrets")
    print("2. Run: python3 scripts/setup-secrets.py")
    print("3. Test installation: ./scripts/test-installation.sh")
    print("4. Start Claude Flow: ./run.sh")
    print("")
    
    # Check if setup is complete
    missing_files = check_claude_flow_setup()
    if missing_files:
        print(f"❌ Missing configuration files: {', '.join(missing_files)}")
        print("   Please run: ./scripts/install-claude-flow.sh")
    else:
        print("✅ Claude Flow configuration is complete")
    
    print("")
    print("🔗 Resources:")
    print("- Claude Flow: https://github.com/ruvnet/claude-flow")
    print("- Claude API: https://claude.ai")
    print("- Replit Docs: https://docs.replit.com")
    print("")

def main():
    """Main entry point"""
    display_welcome()
    
    # Check for API key
    if not os.getenv('CLAUDE_API_KEY'):
        print("⚠️  CLAUDE_API_KEY not found in environment")
        print("   Please configure it in Replit Secrets")
        print("   Then run: python3 scripts/setup-secrets.py")
        return
    
    print("🎉 Claude Flow is ready to use!")
    print("   Run: npx claude-flow@alpha hive-mind wizard")
    print("   Or use the web interface via the webview")

if __name__ == "__main__":
    main()