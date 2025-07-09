# 🚀 Claude Flow Replit Template

A comprehensive Replit template for integrating Claude Code CLI and Claude Flow with best practices for development, testing, and deployment on Replit.

## 🎯 Features

- **🔧 Automated Installation**: One-click setup for Claude + Claude Flow
- **🔐 Secure Secrets Management**: Replit Secrets integration for API keys
- **🐝 Swarm Intelligence**: Multi-agent coordination and task orchestration
- **🧠 Hive Mind**: Collective intelligence for complex problem solving
- **📊 UAT Testing**: Built-in webview integration for user acceptance testing
- **🚀 Replit Optimized**: Follows Replit best practices and deployment patterns
- **⚡ Parallel Execution**: High-performance agent coordination
- **💾 Persistent Memory**: Cross-session state management

## 🚀 Quick Start

### 1. Use This Template

Click the "Use Template" button or fork this repository to your Replit account.

### 2. Install Dependencies

Run the automated installation script:

```bash
./claude-flow-replit-template/scripts/install-claude-flow.sh
```

This will install:
- Claude Code CLI
- Claude Flow v2.0.0-alpha.37
- All required dependencies
- Replit-optimized configuration

### 3. Configure Secrets

1. Click the **Secrets** tab in your Replit sidebar
2. Add your Claude API key:
   - **Key**: `CLAUDE_API_KEY`
   - **Value**: Your Claude API key from [Claude.ai](https://claude.ai)

3. Verify secrets configuration:
```bash
python3 claude-flow-replit-template/scripts/setup-secrets.py
```

### 4. Test Installation

```bash
./claude-flow-replit-template/scripts/test-installation.sh
```

### 5. Start Claude Flow

```bash
./claude-flow-replit-template/run.sh
```

Or use the hive mind wizard:
```bash
npx claude-flow@alpha hive-mind wizard
```

## 📋 Project Structure

```
claude-flow-replit-template/
├── 📄 .replit              # Replit configuration
├── 📄 replit.nix           # Nix dependencies
├── 📄 main.py              # Main entry point
├── 📄 package.json         # Node.js dependencies
├── 📄 run.sh               # Start script
├── 📄 claude-flow-config.json # Claude Flow configuration
├── 📁 scripts/
│   ├── 📄 install-claude-flow.sh  # Installation script
│   ├── 📄 setup-secrets.py       # Secrets configuration
│   └── 📄 test-installation.sh   # Test script
├── 📁 examples/
│   ├── 📄 basic-usage.py          # Basic usage examples
│   └── 📄 webview-test.html       # UAT testing interface
├── 📁 config/
│   └── 📄 .claude/settings.json   # Claude configuration
└── 📁 docs/
    └── 📄 best-practices.md       # Replit best practices
```

## 🔧 Configuration

### Replit Configuration

The template includes optimized configurations for:

- **`.replit`**: Defines run commands, language servers, and deployment settings
- **`replit.nix`**: Manages system dependencies and packages
- **Environment Variables**: Proper PATH and Python configuration

### Claude Flow Configuration

Located in `claude-flow-config.json`:

```json
{
  "version": "2.0.0-alpha.37",
  "platform": "replit",
  "features": {
    "hive_mind": true,
    "neural_training": true,
    "github_integration": true,
    "memory_persistence": true
  },
  "replit": {
    "webview_port": 3000,
    "secrets_support": true,
    "deployment_ready": true
  }
}
```

## 🐝 Using Claude Flow

### Basic Swarm Creation

```bash
# Initialize a swarm
npx claude-flow@alpha swarm init --topology mesh --max-agents 4

# Spawn specialized agents
npx claude-flow@alpha agent spawn --type researcher
npx claude-flow@alpha agent spawn --type coder
npx claude-flow@alpha agent spawn --type tester

# Check swarm status
npx claude-flow@alpha swarm status
```

### Hive Mind Collective Intelligence

```bash
# Start the hive mind wizard
npx claude-flow@alpha hive-mind wizard

# Or use the API
npx claude-flow@alpha hive-mind spawn "build me a web app" --claude
```

### Memory Management

```bash
# Store information
npx claude-flow@alpha memory store --key project/config --value "configuration data"

# Retrieve information
npx claude-flow@alpha memory retrieve --key project/config

# List all memories
npx claude-flow@alpha memory list
```

## 🧪 Testing & UAT

### Webview Integration

The template includes a built-in testing interface accessible via Replit's webview:

1. Run your application: `./claude-flow-replit-template/run.sh`
2. Open the webview panel
3. Navigate to the testing interface
4. Test Claude Flow features interactively

### Testing Scripts

```bash
# Run all tests
npm test

# Test specific components
python3 claude-flow-replit-template/examples/basic-usage.py

# Check environment
python3 claude-flow-replit-template/scripts/setup-secrets.py
```

## 📊 Replit Best Practices

### Secrets Management

✅ **DO**: Use Replit Secrets for API keys
```python
import os
api_key = os.getenv('CLAUDE_API_KEY')
```

❌ **DON'T**: Hard-code sensitive information
```python
api_key = "sk-ant-api03-..." # Never do this!
```

### Deployment

The template supports three deployment types:

1. **Static**: For frontend applications
2. **Reserved VM**: For always-on services
3. **Autoscale**: For variable-load applications

### Performance Optimization

- Uses parallel execution for multi-agent tasks
- Implements caching for repeated operations
- Optimizes memory usage with TTL-based storage
- Leverages Replit's native development tools

## 🎨 Customization

### Adding New Agent Types

1. Create a new agent configuration in `claude-flow-config.json`
2. Add spawn commands to your scripts
3. Test with the validation scripts

### Extending Functionality

- Add new examples in the `examples/` directory
- Create custom scripts in the `scripts/` directory
- Extend the webview interface in `examples/webview-test.html`

## 📚 Documentation

### Essential Reading

- [Claude Flow Documentation](https://github.com/ruvnet/claude-flow)
- [Claude API Documentation](https://docs.anthropic.com/claude/docs)
- [Replit Documentation](https://docs.replit.com)

### Advanced Topics

- [Replit Secrets Management](https://docs.replit.com/programming-ide/workspace-features/secrets)
- [Claude Flow Hive Mind](https://github.com/ruvnet/claude-flow#hive-mind)
- [Agent Coordination Patterns](https://github.com/ruvnet/claude-flow#coordination)

## 🔍 Troubleshooting

### Common Issues

**Issue**: "Node.js is not installed" error
**Solution**: 
1. The script now auto-detects Node.js in common environments (Codespace, Replit, nvm)
2. If still failing, manually run: `./claude-flow-replit-template/scripts/test-node-setup.sh`
3. In Replit, Node.js should be available by default
4. For local development, install Node.js >= 20.0.0 from [nodejs.org](https://nodejs.org)

**Issue**: Claude API key not found
**Solution**: 
1. Check Replit Secrets configuration
2. Run `python3 claude-flow-replit-template/scripts/setup-secrets.py`
3. Restart your Repl

**Issue**: Claude Flow installation fails
**Solution**:
1. Ensure Node.js >= 20.0.0 is properly detected
2. Run `./claude-flow-replit-template/scripts/install-claude-flow.sh` again
3. Check the installation logs
4. Try manually: `npx claude-flow@alpha init --force`

**Issue**: Webview not loading
**Solution**:
1. Ensure port 3000 is available
2. Check firewall settings
3. Restart the application

**Issue**: Claude CLI permissions prompt
**Solution**:
1. The script handles this automatically
2. If prompted manually, type `y` to proceed
3. This is needed for Claude CLI to work properly

### Debug Mode

Enable debug mode for detailed logging:

```bash
export DEBUG=claude-flow:*
npx claude-flow@alpha --debug
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This template is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- [Claude Flow](https://github.com/ruvnet/claude-flow) by the Claude Flow team
- [Anthropic](https://anthropic.com) for the Claude API
- [Replit](https://replit.com) for the development platform
- The open-source community for continuous improvements

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/ruvnet/claude-flow/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ruvnet/claude-flow/discussions)
- **Discord**: [Claude Flow Community](https://discord.gg/claude-flow)

---

**⚡ Ready to build amazing things with Claude Flow on Replit!**

Get started by running `./claude-flow-replit-template/scripts/install-claude-flow.sh` and let the swarm intelligence help you create incredible applications.