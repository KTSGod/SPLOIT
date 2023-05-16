# SPLOIT
An ModernUI design made by KTS_God#8749.
## Boot up the UI_Library 

```lua
local SPLOIT_UI = loadstring(game:HttpGet(('https://raw.githubusercontent.com/KTSGod/SPLOIT/main/source.lua')))()
```
## Create a Window

```lua
local SPLOIT_Window = Library:Init {
	name = "Window Title"
}
```

## Create a Tab

```lua
local SPLOIT_Tab = SPLOIT_Window:Tab()
```

## Create a button

```lua
  local btn2 = tab:Button({
  callback = function() tog:Toggle(false) 
  end})
```
