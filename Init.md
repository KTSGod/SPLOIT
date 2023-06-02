# __SPLOIT__
An ModernUI design made by KTS_God#8749.
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

## Create a Toggle

```lua
local SPLOIT_Toggle = SPLOIT_Tab:CreateToggle({
	Name="Toggle";
	State=false;
	Callback=function(v)
		if not v then --// Off
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=0
		elseif v then --// On
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=99999
		end
		print(v)
	end,
})
```
### :SetText()
```lua
SPLOIT_Toggle:SetText("Text")
```
### :SetCallback()
```lua
local i=0
SPLOIT_Toggle:SetCallback(function()
	print(":SetCallback()")
end)
```

## Create a Slider

```lua
local SPLOIT_Slider = SPLOIT_Tab:CreateSlider({
	Name="Slider";
	Min=0;
	Max=50;
	Default=25;
	Callback=function(speed)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=speed
	end,
})
```
### :SetValue(n)

```lua
SPLOIT_Slider:SetValue(n) --// n=number
```
### :GetValue()
```lua
SPLOIT_Slider:GetValue() --// Returns the current Slider Value
```
### :SetName()
```lua
SPLOIT_Slider:SetName("text")
```
### :SetCallback(fn)
```lua
SPLOIT_Slider:SetCallback(function()
	print("afgqwsfas")
end)
```
## Create a Dropdown
```lua
local SPLOIT_Dropdown = SPLOIT_Tab:CreateDropdown({
	Name="Dropdown";
	items={"hi};
	Callback = function(currentOption) print(currentOption) end;
})
```
### :Add(id,value)
```lua
SPLOIT_Dropdown:Add("1",1)
```
### :Remove(id)
```lua
SPLOIT_Dropdown:Remove("1")
```
### :Clear()
```lua
SPLOIT_Dropdown:Clear()
```

## TextLabels

### __Normal_Label__
```lua
local SPLOIT_Label = SPLOIT_Tab:CreateLabel({Message="Label",})
```

__SPLOIT_Label:SetText(text)__

```lua
SPLOIT_Label:SetText("Text")
```

### __Warning_Label__

```lua
local SPLOIT_Warning = SPLOIT_Tab:CreateWarning({Message="Warning",})
```

__SPLOIT_Warning:SetText(text)__
```lua
SPLOIT_Warning:SetText("Text")
```
### __Error_Label__

```lua
local SPLOIT_Error = SPLOIT_Tab:CreateError({Message="Error",})
```

__SPLOIT_Error:SetText(text)__

```lua
SPLOIT_Error:SetText("Text")
```

# End

### ! Remember, this UI_Library is In-Development, there will be added new things, like UI_Settings [ Also this is an Docs-Exampler idfk how to say it] !

### TO TURN ON/OFF THE UI PLEASE PRESS RIGHT_ALT

### [[Roblox Profile](https://www.roblox.com/users/3527498133/profile)]
### KTS_God#8749
