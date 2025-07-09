# 🚀 Installation Guide

## Quick Installation Options

### Option 1: Full Installation (Recommended for Interactive Environments)
```bash
./scripts/install-claude-flow.sh
```

**Includes:**
- ✅ Claude Code CLI
- ✅ Claude Flow v2.0.0-alpha.37
- ✅ Full configuration
- ✅ Permissions setup

### Option 2: Minimal Installation (For Non-Interactive Environments)
```bash
./scripts/install-claude-flow-minimal.sh
```

**Includes:**
- ✅ Claude Flow v2.0.0-alpha.37
- ✅ Basic configuration
- ⚠️ Skips Claude CLI (due to interactive mode issues)

## Environment Detection

The installation scripts automatically detect your environment:

- **✅ Replit**: Full support with secrets management
- **✅ GitHub Codespace**: Auto-detects Node.js paths
- **✅ Local Development**: Standard installation
- **✅ Non-Interactive**: Falls back to minimal installation

## Post-Installation Steps

### 1. Configure API Keys
```bash
# In Replit: Use Secrets tab
# Locally: Create .env file
python3 scripts/setup-secrets.py
```

### 2. Test Installation
```bash
./scripts/test-installation.sh
```

### 3. Start Claude Flow
```bash
./run.sh
# OR
npx claude-flow@alpha hive-mind wizard
```

## Troubleshooting

### "Raw mode is not supported" Error
This happens when Claude CLI tries to use interactive mode in non-interactive environments.

**Solution:**
1. Use minimal installation: `./scripts/install-claude-flow-minimal.sh`
2. Claude Flow will work without Claude CLI
3. Set up Claude CLI later in interactive terminal

### "Node.js is not installed" Error
**Solution:**
1. Script auto-detects Node.js in common environments
2. Test with: `./scripts/test-node-setup.sh`
3. Ensure Node.js >= 20.0.0 is installed

### Permission Issues
**Solution:**
1. Run: `./scripts/setup-claude-permissions.sh`
2. Or manually: `claude --dangerously-skip-permissions`
3. Only needed for Claude CLI, not Claude Flow

## Manual Installation

If both scripts fail, you can install manually:

```bash
# 1. Install Claude Flow
npx claude-flow@alpha init --force

# 2. Install Claude CLI (optional, in interactive environment)
npm install -g @anthropic-ai/claude-code

# 3. Configure permissions (optional)
claude --dangerously-skip-permissions

# 4. Test
npx claude-flow@alpha --help
```

## What Gets Installed

### Claude Flow v2.0.0-alpha.37
- **Swarm orchestration** - Multi-agent coordination
- **Hive mind** - Collective intelligence
- **Memory system** - Persistent state management
- **MCP integration** - Model Context Protocol tools
- **GitHub integration** - Repository management
- **Neural training** - Adaptive learning

### Configuration Files
- **`.claude/settings.json`** - Claude configuration
- **`claude-flow-config.json`** - Claude Flow settings
- **`.env.example`** - Environment variables template

### Helper Scripts
- **`setup-secrets.py`** - Secrets configuration
- **`test-installation.sh`** - Installation verification
- **`setup-claude-permissions.sh`** - Claude CLI permissions

## Next Steps

After installation:

1. **Configure secrets** for API access
2. **Test with examples** in `examples/` directory
3. **Explore documentation** in `docs/` directory
4. **Start building** with Claude Flow!

## Support

- **Issues**: Check troubleshooting section in README
- **Scripts**: All installation scripts have detailed logging
- **Manual**: Fall back to manual installation if needed

Remember: Claude Flow works independently of Claude CLI, so you can use the core functionality even if CLI setup fails.