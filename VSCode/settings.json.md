
# Example vscode settings.json for python unit testing and terminal config

<!-- settings.json file in the .vscode directory -->

```json
{
    "terminal.integrated.env.windows": {
        "PYTHONPATH": "${workspaceFolder}"
    },
    "terminal.integrated.env.linux": {
        "PYTHONPATH": "${workspaceFolder}"
    },
    "terminal.integrated.env.osx": {
        "PYTHONPATH": "${workspaceFolder}"
    },
    "python.testing.unittestArgs": [
        "-v",
        "-s",
        "./test",
        "-p",
        "test_*.py"
    ],
    "python.testing.pytestEnabled": false,
    "python.testing.unittestEnabled": true,
    "terminal.integrated.showExitAlert": false,
    "editor.formatOnSave": true,
}
```
