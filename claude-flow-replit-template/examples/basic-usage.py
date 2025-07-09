#!/usr/bin/env python3
"""
Claude Flow Basic Usage Example
This example demonstrates how to use Claude Flow in a Replit environment
"""

import os
import subprocess
import json
from pathlib import Path

def run_command(command, description=""):
    """Run a command and return the result"""
    print(f"🔧 {description}")
    print(f"   Command: {command}")
    
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        if result.returncode == 0:
            print(f"   ✅ Success: {result.stdout.strip()}")
            return result.stdout.strip()
        else:
            print(f"   ❌ Error: {result.stderr.strip()}")
            return None
    except Exception as e:
        print(f"   ❌ Exception: {str(e)}")
        return None

def check_prerequisites():
    """Check if all prerequisites are met"""
    print("📋 Checking prerequisites...")
    
    # Check Claude API key
    if not os.getenv('CLAUDE_API_KEY'):
        print("❌ CLAUDE_API_KEY not found in environment")
        print("   Please configure it in Replit Secrets")
        return False
    
    # Check Claude CLI
    if not run_command("claude --version", "Checking Claude CLI"):
        return False
    
    # Check Claude Flow
    if not run_command("npx claude-flow@alpha --help", "Checking Claude Flow"):
        return False
    
    print("✅ All prerequisites are met!")
    return True

def example_basic_swarm():
    """Example: Create a basic swarm"""
    print("\n🐝 Example: Basic Swarm Creation")
    print("=" * 40)
    
    commands = [
        ("npx claude-flow@alpha swarm init --topology mesh --max-agents 4", "Initialize swarm"),
        ("npx claude-flow@alpha agent spawn --type researcher --name example-researcher", "Spawn researcher agent"),
        ("npx claude-flow@alpha agent spawn --type coder --name example-coder", "Spawn coder agent"),
        ("npx claude-flow@alpha swarm status", "Check swarm status"),
    ]
    
    for command, description in commands:
        result = run_command(command, description)
        if result is None:
            print("❌ Command failed, stopping example")
            return False
    
    return True

def example_memory_usage():
    """Example: Memory management"""
    print("\n🧠 Example: Memory Management")
    print("=" * 40)
    
    commands = [
        ("npx claude-flow@alpha memory store --key example/test --value 'Hello from Replit'", "Store memory"),
        ("npx claude-flow@alpha memory retrieve --key example/test", "Retrieve memory"),
        ("npx claude-flow@alpha memory list --pattern 'example/*'", "List memories"),
    ]
    
    for command, description in commands:
        result = run_command(command, description)
        if result is None:
            print("❌ Command failed, stopping example")
            return False
    
    return True

def example_task_orchestration():
    """Example: Task orchestration"""
    print("\n⚡ Example: Task Orchestration")
    print("=" * 40)
    
    commands = [
        ("npx claude-flow@alpha task create --name 'example-task' --description 'Test task for Replit'", "Create task"),
        ("npx claude-flow@alpha task status --task-id example-task", "Check task status"),
    ]
    
    for command, description in commands:
        result = run_command(command, description)
        if result is None:
            print("❌ Command failed, stopping example")
            return False
    
    return True

def example_hive_mind():
    """Example: Hive Mind usage"""
    print("\n🧠 Example: Hive Mind Collective Intelligence")
    print("=" * 40)
    
    print("Starting hive mind wizard...")
    print("This will create a collective intelligence system")
    print("Use this for complex tasks that require multiple perspectives")
    
    # Note: This is interactive, so we'll just show the command
    print("Command: npx claude-flow@alpha hive-mind wizard")
    print("Follow the prompts to create your hive mind configuration")

def main():
    """Main example runner"""
    print("🚀 Claude Flow Examples for Replit")
    print("=" * 50)
    
    if not check_prerequisites():
        print("❌ Prerequisites not met. Please run setup first.")
        return
    
    # Run examples
    examples = [
        example_basic_swarm,
        example_memory_usage,
        example_task_orchestration,
        example_hive_mind
    ]
    
    for example in examples:
        try:
            if not example():
                print(f"❌ Example {example.__name__} failed")
                break
        except KeyboardInterrupt:
            print("\n⏹️  Examples interrupted by user")
            break
        except Exception as e:
            print(f"❌ Example {example.__name__} failed with error: {str(e)}")
            break
    
    print("\n🎉 Examples completed!")
    print("Try experimenting with different Claude Flow features")
    print("Check the documentation for more advanced usage")

if __name__ == "__main__":
    main()