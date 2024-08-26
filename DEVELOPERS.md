# Getting Started

Install [VSCode](https://code.visualstudio.com/download)

Open VSCode and install the `tabletopsimulator-lua` extension.

Start Tabletop Simulator, start a single player space and load the Stellar Horizons mod.

Inside VSCode, press CTRL-ALT-L to load the scripts from the TTS instance.

From the workspace that was created, choose "Add Folder to Workspace", and browse to the repo folder and add it.

When you press CTRL-ALT-S now, VSCode should connect and upload your scripts that you are editing.

# Enabling syntax highlighting and static analysis

Install the Lua `sumneko.lua` extension.

Go to the Lua add-ons with CTRL-SHIFT-P, and choose "Open Lua Addon Manager"

In the search box, type `TTSLua`

Install the TTSLua addon


You will need to quick fix `require` to be a defined global, or you can do it manually by editing `.vscode/settings.json` and adding
```
    "Lua.diagnostics.globals": [
        "require"
    ],
```