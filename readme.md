# Cloud Workstation Tool in Bash

This script defines two functions:

- cw-start
- cw-stop

## Configuration

The configuration for the script is stored in a configuration file under the `$HOME` directory of the user, in the `$HOME/.config/cloud-workstation` folder, but it can be placed anywhere you want (as long as you update the file path in the script).

The configuration defines the parameters for the specific Cloud Workstation`s cluster and configuration.

You can use the following empty Cloud Workstation Tool configuration file for reference:

```bash
name=""
cluster=""
cluster_config=""
local_port=""
region=""
project_id=""
```

## `cw-start`

The command creates a tunnel and starts the Cloud Workstation defined in the *sourced* configuration. Once the tunnel is created (and the Cloud Workstation started), you can connect VS Code to the Cloud Workstation following the instructions on the official documentation: [Develop code using a local VS Code editor](https://docs.cloud.google.com/workstations/docs/develop-code-using-local-vscode-editor).

