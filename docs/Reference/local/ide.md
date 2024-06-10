{% include-markdown './ide.gen.md' %}

## How It Works

The `quix local ide` command sets up your development environment for a specified application by generating all necessary IDE-dependent files. This integration allows you to run and debug your application directly from your chosen IDE.

Each time you run or debug your code using the generated run configuration, the command exports variables from the `app.yaml` file to a `.env` file or a devcontainer configuration. This ensures that the environment is correctly set up before you begin editing and debugging.

This command is particularly useful the first time you edit an application, as it automates the setup process. While you can run it multiple times, its primary benefits are realized during the initial setup.

You need to have [VS Code](https://code.visualstudio.com/) or [PyCharm](https://www.jetbrains.com/pycharm/) installed for this command to be effective.

!!! warning
    Ensure you have a local broker configured or a Quix Cloud workspace set up. Without these, you won't have a Kafka instance to run your application against, and the command will not function properly.


??? info "Generated files"

    === "VS Code"
    
        The `launch.json` file configures the Python debugger to use the integrated terminal and ensures that environment variables are set correctly by running the `quix-variables-export` task before debugging starts.
        
        ``` json title=".vscode\launch.json"
        {
            "version": "0.2.0",
            "configurations": [
                {
                    "name": "Python Debugger: Current File",
                    "type": "debugpy",
                    "request": "launch",
                    "program": "${file}",
                    "console": "integratedTerminal",
                    "preLaunchTask": "quix-variables-export",
                    "envFile": "${workspaceFolder}/.env"
                }
            ]
        }
        ```
        
        The `tasks.json` file defines a custom task to export the application variables from the `app.yaml` file to a `.env` file. This task is executed before running the debugger.
        
        ``` json title=".vscode\tasks.json"
        {
          "version": "2.0.0",
          "tasks": [
            {
              "label": "quix-variables-export",
              "type": "shell",
              "problemMatcher": [],
              "command": "quix",
              "args": [ "local", "application", "variables", "export" ]
            }
          ]
        }
        ```

    === "PyCharm"
    
        The `Quix.xml` file configures a run configuration in PyCharm, specifying how to execute and debug the application. It includes a pre-launch task to export environment variables using the `quix-variables-export` external tool.
        
        ``` xml title=".idea\runConfigurations\Quix.xml"
        <component name="ProjectRunConfigurationManager">
          <configuration default="false" name="Quix" type="PythonConfigurationType" factoryName="Python">
            <module name="{{appId}}" />
            <!-- ... -->
            <method v="2">
              <option name="ToolBeforeRunTask" enabled="true" actionId="Tool_External Tools_quix-variables-export" />
            </method>
          </configuration>
        </component>
        ```

        The `External Tools.xml` file defines an external tool in PyCharm to export the application variables from the `app.yaml` file to a `.env` file. This tool is run before the main application execution starts.

        ``` xml title="~/JetBrains/External Tools.xml"
        <tool name="quix-variables-export" description="Quix Variables Export" showInMainMenu="false" showInEditor="false" showInProject="false" showInSearchPopup="false" disabled="false" useConsole="true" showConsoleOnStdOut="false" showConsoleOnStdErr="false" synchronizeAfterRun="true">
          <exec>
            <option name="COMMAND" value="quix" />
            <option name="PARAMETERS" value="local application variables export" />
            <option name="WORKING_DIRECTORY" value="$ProjectFileDir$" />
          </exec>
        </tool>
        ```

### Dev Containers

Dev Containers provide an isolated and consistent development environment. By using the `--devcontainer` option, the command sets up the necessary configurations for Dev Containers, which is particularly useful for ensuring your development environment matches your production environment. This helps to avoid "it works on my machine" issues by creating a reproducible setup.

For more information on Dev Containers, visit [Dev Containers](https://containers.dev/).

## Example usage

When you execute the local ide command without any options:

```bash
$ quix local ide
```

The interactive command starts. If your current directory is not an application directory, you are prompted to select the application you want to edit and debug in your IDE:

```text
? Select application:

  Event Detection Transformation        \Event Detection Transformation
> Starter Source                        \Starter Source
  ✗ Cancel
```

After selecting the application, the command performs several checks to ensure that you can debug the application locally:

```text
✓ Found application 'Starter Source'
✓ Using localhost:9092
✓ VS Code is installed
✓ PyCharm is installed
```

If you have more than one supported IDE installed, you are asked to select which one to use:

```text
? Select IDE:

> VS Code
  PyCharm
  ✗ Cancel
```

Finally, your selected IDE starts:

```text
✓ VS Code started
```