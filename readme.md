# Cloud Workstation Tool in Bash

This script defines two functions:

- cw-start
- cw-stop

## Configuration

The configuration for the script is stored in a configuration file under the `$HOME` directory of the user.

The configuration definies the parameters for the specific Cloud Workstation cluster and configuration.

This is an empty Cloud Workstation Tool configuration file:

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

