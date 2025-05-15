# Secoda MCP

[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Code style: ruff](https://img.shields.io/badge/code%20style-ruff-000000.svg)](https://github.com/astral-sh/ruff)

Secoda MCP is a custom server built with FastMCP that provides access to Secoda's data tools and functionalities.

## Features

- Access to Secoda's data assets search
- Access to documentation search
- Ability to run SQL queries directly
- Integration with Secoda's data catalog
- Entity lineage visualization
- Glossary term retrieval

## Getting Started

### Prerequisites

- Python 3.8 or higher
- Access to Secoda's API
- API token for authentication with the Secoda API (can be generated at https://app.secoda.co/settings/api if you're an admin)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/secoda/secoda-mcp.git
   cd secoda-mcp
   ```

2. Install dependencies:
   ```bash
   # Install runtime dependencies
   pip install -r requirements.txt
   
   # For development, install additional dependencies
   pip install -r requirements.txt[dev]
   ```

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `API_TOKEN` | Required token for API authentication | None (Required) |
| `API_URL` | URL of the Secoda API endpoint | https://app.secoda.co/api/v1/ |

### Instance URL Note

If you're using a regional instance or self-hosted deployment of Secoda, replace `app.secoda.co` with your specific instance URL:

- EU region: `eu.secoda.co`
- APAC region: `apac.secoda.co`
- Self-hosted: Your custom domain (e.g., `secoda.yourcompany.com`)

## Integration with Tools

### Using with Cursor

To integrate Secoda MCP with Cursor, add the following configuration to your `~/.cursor/mcp.json` file:

```json
{
    "mcpServers": {
        "secoda-mcp": {
            "command": "python",
            "args": [
                "/path/to/secoda-mcp/server.py"
            ],
            "env": {
                "API_TOKEN": "your-api-token",
                "API_URL": "https://app.secoda.co/api/v1/"
            }
        }
    }
}
```

Replace `/path/to/secoda-mcp/server.py` with the actual path to your server.py file, set your API token, and update the API_URL with your Secoda instance URL if not using app.secoda.co.

### Using with Claude

To integrate Secoda MCP with Claude Desktop, add the following to your Claude Desktop configuration file:

#### macOS: ~/Library/Application Support/Claude/claude_desktop_config.json
#### Windows: %APPDATA%\Claude\claude_desktop_config.json

```json
{
  "mcpServers": {
    "secoda-mcp": {
      "command": "python",
      "args": [
        "/path/to/secoda-mcp/server.py"
      ],
      "env": {
        "API_TOKEN": "your-api-token",
        "API_URL": "https://app.secoda.co/api/v1/"
      }
    }
  }
}
```

Replace `/path/to/secoda-mcp/server.py` with the actual path to your server.py file, set your API token, and update the API_URL with your specific Secoda instance URL if not using app.secoda.co. To access the Claude Desktop configuration file, open the Claude menu, go to "Settings", click on "Developer" in the left-hand bar, and then click on "Edit Config".

After updating the configuration, restart Claude Desktop to apply the changes.

### Using with Other Tools

Secoda MCP can be integrated with various other tools:

- **VS Code**: Use the VS Code extension for MCP servers
- **JetBrains IDEs**: Install the MCP plugin from the marketplace
- **Command Line**: Access MCP functionalities directly via the CLI
- **Web Applications**: Embed MCP capabilities in web apps through the REST API

## Troubleshooting

- If you encounter connection issues, ensure Secoda's API is running at the configured URL
- If you get authorization errors, verify your API token is correct and properly set as an environment variable
- For permission errors, check your authentication settings in your Secoda account

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Security

If you discover any security related issues, please email security@secoda.co instead of using the issue tracker.

