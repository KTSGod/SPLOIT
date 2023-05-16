# SPLOIT
An ModernUI design made by KTS_God#8749.

! Remember, this UI_Library is In-Development, there will be added new things,like UI_Settings
## Boot up the UI_Library 

```lua
local SPLOIT_UI = loadstring(game:HttpGet(('https://raw.githubusercontent.com/KTSGod/SPLOIT/main/source.lua')))()
```
## Create a Window

```lua
local SPLOIT_Window = Library:Init {
	Name = "Window Title";
}
```

## Create a Tab

```lua
local SPLOIT_Tab = SPLOIT_Window:CreateTab()
```

## Create a Button

```lua
 local SPLOIT_Button = SPLOIT_Tab:CreateButton({
	Title="Button";
	Callback=function()
	print("aa")
	end,
})
```
### :SetText()

```lua
SPLOIT_Button:SetText("Text")
```
### :SetCallback()

```lua
local i = 0
SPLOIT_Button:SetCallback(function()
	Button:SetText("I have been clicked " .. i .. " times")
	i+=1
end)
```


