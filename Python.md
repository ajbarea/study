# Python

## Update flake8 max line warning

<!-- setup.cfg file in root directory -->
``` text
[flake8]
max-line-length = 120
```

## Update vscode settings for pythin unit testing and terminal config

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
    "terminal.integrated.showExitAlert": false
}
```
