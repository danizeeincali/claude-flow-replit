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