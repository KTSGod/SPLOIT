-- services

local players=game:GetService("Players")
local tweenservice=game:GetService("TweenService")
local runservice=game:GetService("RunService")
local coreUI=game:GetService("CoreGui")
local uis=game:GetService("UserInputService")

--vars

local viewport=workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local lp = players.LocalPlayer

local Premium=false
local Library={}
local mouse = lp:GetMouse()

function Library:validate(defaults, options)
	-- local options=options or {}
	for i,v in pairs(defaults) do
		if options[i]==nil then
			options[i]=v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = tweenservice:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:Init(options)
	local options=options or {}
	options = Library:validate({
		Name="Sploit UI Library";
	},options)
	local UI={
		CurrentTab=nil;
	}
	do --// Main Frame
		-- StarterUI.
		UI["1"] = Instance.new("ScreenGui", runservice:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreUI);
		UI["1"]["IgnoreGuiInset"] = true;
		UI["1"]["DisplayOrder"] = 69;
		UI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
		UI["1"]["Name"] = [[]];
		UI["1"]["ResetOnSpawn"] = false;

		-- StarterUI..main
		UI["2"] = Instance.new("Frame", UI["1"]);
		UI["2"]["BackgroundColor3"] = Color3.fromRGB(12, 12, 12);
		UI["2"]["AnchorPoint"] = Vector2.new(.5, .5);
		UI["2"]["Size"] = UDim2.new(0.463, 0,0.586, 0);
		UI["2"]["Position"] = UDim2.fromOffset((viewport.X/2) - (UI["2"].Size.X.Offset / 2), (viewport.Y/2) - (UI["2"].Size.Y.Offset / 2)); --// UDim2.new(0.268, 0,0.207, 0) -- Center 
		UI["2"]["Name"] = [[main]];
		UI["2"]["Draggable"]=true

		-- StarterUI..main.UICorner
		UI["3"] = Instance.new("UICorner", UI["2"]);

		-- StarterUI..main.Shadow
		UI["6a"] = Instance.new("ImageLabel", UI["2"]);
		UI["6a"]["ZIndex"] = 0;
		UI["6a"]["BorderSizePixel"] = 0;
		UI["6a"]["SliceCenter"] = Rect.new(100, 100, 400, 400);
		UI["6a"]["ScaleType"] = Enum.ScaleType.Slice;
		UI["6a"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
		UI["6a"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
		UI["6a"]["ImageTransparency"] = 0.6899999976158142;
		UI["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		UI["6a"]["Image"] = [[rbxassetid://11162370676]];
		UI["6a"]["Size"] = UDim2.new(1.241391658782959, 0, 1.3439505100250244, 0);
		UI["6a"]["Name"] = [[Shadow]];
		UI["6a"]["BackgroundTransparency"] = 1;
		UI["6a"]["Position"] = UDim2.new(0.499180406332016, 0, 0.4937167167663574, 5);

		-- StarterUI..main.Window.Fade.UIGradient
		UI["59"] = Instance.new("UIGradient", UI["58"]);
		UI["59"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(0.521, 0),NumberSequenceKeypoint.new(1.000, 0.6187499761581421)};
		UI["59"]["Rotation"] = 90;
		UI["59"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(9, 9, 9)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(9, 9, 9))};



		-- StarterUI..main.Glow
		UI["12"] = Instance.new("Frame", UI["2"]);
		UI["12"]["ZIndex"] = 0;
		UI["12"]["BackgroundColor3"] = Color3.fromRGB(35, 6, 255);
		UI["12"]["BackgroundTransparency"] = 1;
		UI["12"]["Size"] = UDim2.new(1, 0, 0.9873684048652649, 0);
		UI["12"]["Position"] = UDim2.new(0.001497006043791771, 0, 0.0063157896511256695, 0);
		UI["12"]["Name"] = [[Glow]];

		-- StarterUI..main.Glow.umbraShadow
		UI["13"] = Instance.new("ImageLabel", UI["12"]);
		UI["13"]["ZIndex"] = 0;
		UI["13"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
		UI["13"]["ScaleType"] = Enum.ScaleType.Slice;
		UI["13"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
		UI["13"]["ImageTransparency"] = 0.8600000143051147;
		UI["13"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		UI["13"]["Image"] = [[rbxassetid://1316045217]];
		UI["13"]["Size"] = UDim2.new(1.022455096244812, 0, 1.0428144931793213, 0);
		UI["13"]["Name"] = [[umbraShadow]];
		UI["13"]["BackgroundTransparency"] = 1;
		UI["13"]["Position"] = UDim2.new(0.49925145506858826, 0, 0.49999991059303284, 0);

		-- StarterUI..main.Glow.penumbraShadow
		UI["14"] = Instance.new("ImageLabel", UI["12"]);
		UI["14"]["ZIndex"] = 0;
		UI["14"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
		UI["14"]["ScaleType"] = Enum.ScaleType.Slice;
		UI["14"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
		UI["14"]["ImageTransparency"] = 0.8799999952316284;
		UI["14"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		UI["14"]["Image"] = [[rbxassetid://1316045217]];
		UI["14"]["Size"] = UDim2.new(1.022455096244812, 0, 1.0428144931793213, 0);
		UI["14"]["Name"] = [[penumbraShadow]];
		UI["14"]["BackgroundTransparency"] = 1;
		UI["14"]["Position"] = UDim2.new(0.49925145506858826, 0, 0.49999991059303284, 0);

		-- StarterUI..main.Glow.ambientShadow
		UI["15"] = Instance.new("ImageLabel", UI["12"]);
		UI["15"]["ZIndex"] = 0;
		UI["15"]["SliceCenter"] = Rect.new(10, 10, 118, 118);
		UI["15"]["ScaleType"] = Enum.ScaleType.Slice;
		UI["15"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
		UI["15"]["ImageTransparency"] = 0.8799999952316284;
		UI["15"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		UI["15"]["Image"] = [[rbxassetid://1316045217]];
		UI["15"]["Size"] = UDim2.new(1.022455096244812, 0, 1.0428144931793213, 0);
		UI["15"]["Name"] = [[ambientShadow]];
		UI["15"]["BackgroundTransparency"] = 1;
		UI["15"]["Position"] = UDim2.new(0.49925145506858826, 0, 0.49999991059303284, 0);

		-- StarterUI..main.Topbar
		UI["5a"] = Instance.new("Frame", UI["2"]);
		UI["5a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		UI["5a"]["BackgroundTransparency"] = 0.699999988079071;
		UI["5a"]["Size"] = UDim2.new(0.7305389046669006, 0, 0.10105263441801071, 0);
		UI["5a"]["Position"] = UDim2.new(0.2559880316257477, 0, 0.012631579302251339, 0);
		UI["5a"]["Name"] = [[Topbar]];

		-- StarterUI..main.Topbar.UIStroke
		UI["5b"] = Instance.new("UIStroke", UI["5a"]);
		UI["5b"]["Color"] = Color3.fromRGB(255, 255, 255);
		UI["5b"]["Thickness"] = 0.30000001192092896;
		UI["5b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterUI..main.Topbar.UICorner
		UI["5c"] = Instance.new("UICorner", UI["5a"]);


		-- StarterUI..main.Topbar.PlayersName
		UI["5d"] = Instance.new("TextLabel", UI["5a"]);
		UI["5d"]["TextWrapped"] = true;
		UI["5d"]["TextScaled"] = true;
		UI["5d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		UI["5d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		UI["5d"]["TextSize"] = 14;
		UI["5d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		UI["5d"]["Size"] = UDim2.new(0.4139344394207001, 0, 0.625, 0);
		UI["5d"]["Text"] = players.LocalPlayer.Name;
		UI["5d"]["Name"] = players.LocalPlayer.DisplayName	--//[[PlayersName]];
		UI["5d"]["BackgroundTransparency"] = 0.9200000166893005;
		UI["5d"]["Position"] = UDim2.new(0.012295082211494446, 0, 0.1875, 0);

		-- StarterUI..main.Topbar.PlayersName.UICorner
		UI["5e"] = Instance.new("UICorner", UI["5d"]);


		-- StarterUI..main.Topbar.PlayersName.UIStroke
		UI["5f"] = Instance.new("UIStroke", UI["5d"]);
		UI["5f"]["Color"] = Color3.fromRGB(255, 255, 255);
		UI["5f"]["Thickness"] = 0.30000001192092896;
		UI["5f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterUI..main.Topbar.PlayerImage
		UI["60"] = Instance.new("ImageLabel", UI["5a"]);
		UI["60"]["ScaleType"] = Enum.ScaleType.Fit;
		UI["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		UI["60"]["Image"] = [[http://www.roblox.com/asset/?id=7792025253]];
		UI["60"]["Size"] = UDim2.new(0.069672130048275, 0, 0.7083333134651184, 0);
		UI["60"]["Name"] = [[PlayerImage]];
		UI["60"]["BackgroundTransparency"] = 1;
		UI["60"]["Position"] = UDim2.new(0.4651639461517334, 0, 0.1458333283662796, 0);

		-- StarterUI..main.Topbar.PlayerImage.UICorner
		UI["61"] = Instance.new("UICorner", UI["60"]);
		UI["61"]["CornerRadius"] = UDim.new(0, 69);

		-- StarterUI..main.Topbar.Premium
		UI["62"] = Instance.new("TextLabel", UI["5a"]);
		UI["62"]["TextWrapped"] = true;
		UI["62"]["TextScaled"] = true;
		UI["62"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		UI["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		UI["62"]["TextSize"] = 14;
		UI["62"]["TextColor3"] = Color3.fromRGB(0, 255, 0);
		UI["62"]["Size"] = UDim2.new(0.4098360538482666, 0, 0.625, 0);
		UI["62"]["Text"] = "Premium";
		UI["62"]["Name"] = [[Premium]];
		UI["62"]["BackgroundTransparency"] = 0.9200000166893005;
		UI["62"]["Position"] = UDim2.new(0.5758196711540222, 0, 0.1875, 0);

		-- StarterUI..main.Topbar.Premium.UICorner
		UI["63"] = Instance.new("UICorner", UI["62"]);


		-- StarterUI..main.Topbar.Premium.UIStroke
		UI["64"] = Instance.new("UIStroke", UI["62"]);
		UI["64"]["Color"] = Color3.fromRGB(255, 255, 255);
		UI["64"]["Thickness"] = 0.3;
		UI["64"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	end
	--// Navigation
	do
		-- StarterGui..main.SideBar
		UI["4"] = Instance.new("Frame", UI["2"]);
		UI["4"]["BorderSizePixel"] = 0;
		UI["4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
		UI["4"]["BackgroundTransparency"] = 0.699999988079071;
		UI["4"]["Size"] = UDim2.new(0.23802395164966583, 0, 0.9621052742004395, 0);
		UI["4"]["BorderColor3"] = Color3.fromRGB(47, 253, 255);
		UI["4"]["Position"] = UDim2.new(0.008982036262750626, 0, 0.0147368423640728, 0);
		UI["4"]["Name"] = [[SideBar]];

		-- StarterGui..main.SideBar.UICorner
		UI["5"] = Instance.new("UICorner", UI["4"]);


		-- StarterGui..main.SideBar.UIStroke
		UI["6"] = Instance.new("UIStroke", UI["4"]);
		UI["6"]["Color"] = Color3.fromRGB(255, 255, 255);
		UI["6"]["Thickness"] = 0.30000001192092896;
		UI["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterGui..main.SideBar.GameName
		UI["7"] = Instance.new("TextLabel", UI["4"]);
		UI["7"]["TextWrapped"] = true;
		UI["7"]["TextScaled"] = true;
		UI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		UI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
		UI["7"]["TextSize"] = 14;
		UI["7"]["TextColor3"] = Color3.fromRGB(4, 23, 142);
		UI["7"]["Size"] = UDim2.new(0.9119496941566467, 0, 0.043763674795627594, 0);
		UI["7"]["Text"] = game.Name;
		UI["7"]["Name"] = game.Name;
		UI["7"]["BackgroundTransparency"] = 1;
		UI["7"]["Position"] = UDim2.new(0.041, 0,0.062, 0);

		-- StarterGui..main.SideBar.Title
		UI["8"] = Instance.new("TextLabel", UI["4"]);
		UI["8"]["TextWrapped"] = true;
		UI["8"]["TextScaled"] = true;
		UI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		UI["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Normal);
		UI["8"]["TextSize"] = 14;
		UI["8"]["TextColor3"] = Color3.fromRGB(4, 23, 142);
		UI["8"]["Size"] = UDim2.new(0.9119496941566467, 0, 0.07877461612224579, 0);
		UI["8"]["Text"] = options["Name"]	--[[Title]];
		UI["8"]["Name"] = options["Name"]	--[[Title]];
		UI["8"]["BackgroundTransparency"] = 1;
		UI["8"]["Position"] = UDim2.new(0.04136820137500763, 0, -0.002114163711667061, 0);

		-- StarterGui..main.SideBar.ButtonsContainer
		UI["9"] = Instance.new("ScrollingFrame", UI["4"]);
		UI["9"]["BorderSizePixel"] = 0;
		UI["9"]["CanvasSize"] = UDim2.new(0, 0, 1, 0);
		UI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		UI["9"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always;
		UI["9"]["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left;
		UI["9"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
		UI["9"]["BackgroundTransparency"] = 1;
		UI["9"]["Size"] = UDim2.new(0.9748427867889404, 0, 0.8249452710151672, 0);
		UI["9"]["Selectable"] = false;
		UI["9"]["ScrollBarThickness"] = 0;
		UI["9"]["Position"] = UDim2.new(0.006289307959377766, 0, 0.11627905070781708, 0);
		UI["9"]["Name"] = [[ButtonsContainer]];
		UI["9"]["SelectionGroup"] = false;

		-- StarterGui..main.SideBar.ButtonsContainer.UICorner
		UI["a"] = Instance.new("UICorner", UI["9"]);


		-- StarterGui..main.SideBar.ButtonsContainer.UIListLayout
		UI["b"] = Instance.new("UIListLayout", UI["9"]);
		UI["b"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		UI["b"]["Padding"] = UDim.new(0, 5);
		UI["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui..main.SideBar.ButtonsContainer.UIStroke
		UI["c"] = Instance.new("UIStroke", UI["9"]);
		UI["c"]["Color"] = Color3.fromRGB(255, 255, 255);
		UI["c"]["Transparency"] = 0.949999988079071;
		UI["c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


		-- StarterGui..main.SideBar.ButtonsContainer.Template.UIStroke
		UI["f"] = Instance.new("UIStroke", UI["d"]);
		UI["f"]["Color"] = Color3.fromRGB(255, 255, 255);
		UI["f"]["Thickness"] = 0.30000001192092896;
		UI["f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterGui..main.SideBar.ButtonsContainer.UIPadding
		UI["10"] = Instance.new("UIPadding", UI["9"]);
		UI["10"]["PaddingTop"] = UDim.new(0, 5);

		-- StarterGui..main.SideBar.SettingsButton
		UI["11"] = Instance.new("ImageLabel", UI["4"]);
		UI["11"]["ScaleType"] = Enum.ScaleType.Fit;
		UI["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		UI["11"]["Image"] = [[rbxasset://studio_svg_textures/Shared/Navigation/Dark/Standard/Settings.png]];
		UI["11"]["Size"] = UDim2.new(0.11949685215950012, 0, 0.05689277872443199, 0);
		UI["11"]["Name"] = [[SettingsButton]];
		UI["11"]["BackgroundTransparency"] = 1;
		UI["11"]["Position"] = UDim2.new(0.43396222591400146, 0, 0.942843496799469, 0);

	end


	do --// Open/Close UI
		uis.InputBegan:Connect(function(input, gpe)
			if gpe then return end

			if input.KeyCode == Enum.KeyCode.RightAlt then
				UI["1"]["Enabled"] = not UI["1"]["Enabled"]
			end
		end)

		--// Notify the player.
	end	

	function UI:CreateTab(options)

		local options=options or {}
		options = Library:validate({
			Name="Preview Tab";
		},options)

		local Tab={
			Hover=false;
			Active=false;
		}

		do --// Render
			-- StarterGui..main.SideBar.ButtonsContainer.Template
			Tab["d"] = Instance.new("TextLabel", UI["9"]);
			Tab["d"]["TextWrapped"] = true;
			Tab["d"]["RichText"] = true;
			Tab["d"]["TextScaled"] = true;
			Tab["d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Tab["d"]["TextSize"] = 14;
			Tab["d"]["TextColor3"] = Color3.fromRGB(0, 116, 255);
			Tab["d"]["Size"] = UDim2.new(0, 137, 0, 34);
			Tab["d"]["Text"] = options["Name"];
			Tab["d"]["Name"] = [[Template]];
			Tab["d"]["BackgroundTransparency"] = 0.699999988079071;
			Tab["d"]["Position"] = UDim2.new(0.05806451290845871, 0, 0, 0);

			-- StarterGui..main.SideBar.ButtonsContainer.Template.UICorner
			Tab["e"] = Instance.new("UICorner", Tab["d"]);

			-- StarterGui..main.SideBar.ButtonsContainer.Template.UIStroke
			Tab["f"] = Instance.new("UIStroke", Tab["d"]);
			Tab["f"]["Color"] = Color3.fromRGB(255, 255, 255);
			Tab["f"]["Thickness"] = 0.30000001192092896;
			Tab["f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui..main.Window
			Tab["16"] = Instance.new("Frame", UI["2"]);
			Tab["16"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Tab["16"]["BackgroundTransparency"] = 0.699999988079071;
			Tab["16"]["Size"] = UDim2.new(0.7305389046669006, 0, 0.8505262732505798, 0);
			Tab["16"]["Position"] = UDim2.new(0.621257483959198, 0, 0.5505264401435852, 0);
			Tab["16"]["Name"] = options["Name"];
			Tab["16"]["Visible"]=false;

			-- StarterGui..main.Window.UICorner
			Tab["17"] = Instance.new("UICorner", Tab["16"]);


			-- StarterGui..main.Window.ElementsContainer
			Tab["18"] = Instance.new("ScrollingFrame", Tab["16"]);
			Tab["18"]["BorderSizePixel"] = 0;
			Tab["18"]["CanvasSize"] = UDim2.new(0, 0, 1, 0);
			Tab["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["18"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always;
			Tab["18"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
			Tab["18"]["BackgroundTransparency"] = 1;
			Tab["18"]["Size"] = UDim2.new(0, 435, 0, 388);
			Tab["18"]["Selectable"] = false;
			Tab["18"]["ScrollBarThickness"] = 1;
			Tab["18"]["Position"] = UDim2.new(0, 6, 0, 5);
			Tab["18"]["Name"] = [[ElementsContainer]];
			Tab["18"]["SelectionGroup"] = false;

			-- StarterGui..main.Window.ElementsContainer.UIStroke
			Tab["19"] = Instance.new("UIStroke", Tab["18"]);
			Tab["19"]["Color"] = Color3.fromRGB(255, 255, 255);
			Tab["19"]["Transparency"] = 0.949999988079071;
			Tab["19"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui..main.Window.ElementsContainer.UICorner
			Tab["1a"] = Instance.new("UICorner", Tab["18"]);


			-- StarterGui..main.Window.ElementsContainer.UIPadding
			Tab["1b"] = Instance.new("UIPadding", Tab["18"]);
			Tab["1b"]["PaddingTop"] = UDim.new(0, 10);
			Tab["1b"]["PaddingBottom"] = UDim.new(0, 5);

			-- StarterGui..main.Window.ElementsContainer.UIListLayout
			Tab["1c"] = Instance.new("UIListLayout", Tab["18"]);
			Tab["1c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
			Tab["1c"]["Padding"] = UDim.new(0, 15);
			Tab["1c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


		end

		function Tab:Activate()
			if not Tab.Active then
				if UI.CurrentTab~=nil then
					UI.CurrentTab:Deactivate()
				end
				Tab.Active=true
				Library:tween(Tab["f"],{Color=Color3.fromRGB(255, 0, 0)})
				Library:tween(Tab["d"],{BackgroundColor3=Color3.fromRGB(40, 40, 40)})
				Tab["16"]["Visible"]=true
				UI.CurrentTab=Tab
			end

		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active=false
				Library:tween(Tab["f"],{Color=Color3.fromRGB(255,255,255)})
				Library:tween(Tab["d"],{BackgroundColor3=Color3.fromRGB(0,0,0)})
				Tab["16"]["Visible"]=false
			end
		end

		do --// Logic
			Tab["d"].MouseEnter:Connect(function()
				Tab.Hover=true

				if not Tab.Active then
					Library:tween(Tab["f"],{Color=Color3.fromRGB(255, 0, 0)})
				end
			end)
			Tab["d"].MouseLeave:Connect(function()
				Tab.Hover=false
				if not Tab.Active then
					Library:tween(Tab["f"],{Color=Color3.fromRGB(255,255,255)})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType==Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if UI.CurrentTab==nil then
				Tab:Activate()
			end
		end

		do --// Interactables / Elements Handler

			function Tab:CreateNotification(options)
				local options=options or {}
				options = Library:validate({
					Title="Preview Notification";
					Description="Preview Description";
					Duration=10;
				},options)

				local Notification = {}


				do --// Render
					-- StarterGui..Notification
					Notification["7c"] = Instance.new("Frame", UI["2"]);
					Notification["7c"]["BorderSizePixel"] = 0;
					Notification["7c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Notification["7c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Notification["7c"]["BackgroundTransparency"] = 0.15000000596046448;
					Notification["7c"]["Size"] = UDim2.new(0.476, 0,0.15, 0);
					Notification["7c"]["Position"] = UDim2.new(1.319, 0,1.25, 0);
					Notification["7c"]["Name"] = [[Notification]];

					-- StarterGui..Notification.UICorner
					Notification["7d"] = Instance.new("UICorner", Notification["7c"]);

					-- StarterGui..Notification.UIStroke
					Notification["7e"] = Instance.new("UIStroke", Notification["7c"]);
					Notification["7e"]["Color"] = Color3.fromRGB(255, 0, 0);
					Notification["7e"]["Thickness"] = 0.4000000059604645;
					Notification["7e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..Notification.Title
					Notification["7f"] = Instance.new("TextLabel", Notification["7c"]);
					Notification["7f"]["TextWrapped"] = true;
					Notification["7f"]["TextScaled"] = true;
					Notification["7f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Notification["7f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Notification["7f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Notification["7f"]["TextSize"] = 14;
					Notification["7f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Notification["7f"]["Size"] = UDim2.new(0, 129, 0, 40);
					Notification["7f"]["Text"] = options.Title;
					Notification["7f"]["Name"] = options.Title;
					Notification["7f"]["BackgroundTransparency"] = 1;
					Notification["7f"]["Position"] = UDim2.new(0.015, 0,0, 0);

					-- StarterGui..Notification.Description
					Notification["80"] = Instance.new("TextLabel", Notification["7c"]);
					Notification["80"]["TextWrapped"] = true;
					Notification["80"]["TextScaled"] = true;
					Notification["80"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Notification["80"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Notification["80"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Notification["80"]["TextSize"] = 14;
					Notification["80"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Notification["80"]["Size"] = UDim2.new(0, 282, 0, 26);
					Notification["80"]["Text"] = options.Description;
					Notification["80"]["Name"] = options.Description;
					Notification["80"]["BackgroundTransparency"] = 1;
					Notification["80"]["Position"] = UDim2.new(0.015, 0,0.556, 0);

					-- StarterGui..Notification.Countdown
					Notification["81"] = Instance.new("TextLabel", Notification["7c"]);
					Notification["81"]["TextWrapped"] = true;
					Notification["81"]["TextScaled"] = true;
					Notification["81"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Notification["81"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Notification["81"]["TextSize"] = 14;
					Notification["81"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Notification["81"]["Size"] = UDim2.new(0, 41, 0, 45);
					Notification["81"]["Text"] = options.Duration;
					Notification["81"]["Name"] = options.Duration;
					Notification["81"]["BackgroundTransparency"] = 1;
					Notification["81"]["Position"] = UDim2.new(0.847, 0,0.181, 0);
				end


				return Notification
			end
			function Tab:CreateButton(options)
				local options=options or {}
				options = Library:validate({
					Name="Preview Button";
					Callback = function() end
				},options)

				local Button={
					Hover=false;
					MouseDown=false;
				}

				do --// Render
					-- StarterGui..main.Window.ElementsContainer.Button
					Button["59"] = Instance.new("Frame", Tab["18"]);
					Button["59"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Button["59"]["BackgroundTransparency"] = 0.699999988079071;
					Button["59"]["LayoutOrder"] = 3;
					Button["59"]["Size"] = UDim2.new(0, 299, 0, 40);
					Button["59"]["ClipsDescendants"] = true;
					Button["59"]["Position"] = UDim2.new(0.15632183849811554, 0, 0.36082473397254944, 0);
					Button["59"]["Name"] = [[Button]];
					-- StarterGui..main.Window.ElementsContainer.Button.Button
					Button["5a"] = Instance.new("TextLabel", Button["59"]);
					Button["5a"]["TextWrapped"] = true;
					Button["5a"]["TextStrokeTransparency"] = 0;
					Button["5a"]["RichText"] = true;
					Button["5a"]["TextScaled"] = true;
					Button["5a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Button["5a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Button["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Button["5a"]["TextSize"] = 14;
					Button["5a"]["TextColor3"] = Color3.fromRGB(0, 69, 255);
					Button["5a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Button["5a"]["LayoutOrder"] = 2;
					Button["5a"]["Size"] = UDim2.new(0, 267, 0, 40);
					Button["5a"]["Text"] = options["Name"];
					Button["5a"]["Name"] = options["Name"];
					Button["5a"]["BackgroundTransparency"] = 1;
					Button["5a"]["Position"] = UDim2.new(0.43979936838150024, 0, 0.4801338315010071, 0);

					-- StarterGui..main.Window.ElementsContainer.Button.Button.UITextSizeConstraint
					Button["5b"] = Instance.new("UITextSizeConstraint", Button["5a"]);
					Button["5b"]["MaxTextSize"] = 50;

					-- StarterGui..main.Window.ElementsContainer.Button.Button.UIAspectRatioConstraint
					Button["5c"] = Instance.new("UIAspectRatioConstraint", Button["5a"]);
					Button["5c"]["AspectRatio"] = 6;
					Button["5c"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;

					-- StarterGui..main.Window.ElementsContainer.Button.Button.Icon
					Button["5d"] = Instance.new("ImageLabel", Button["5a"]);
					Button["5d"]["BorderSizePixel"] = 0;
					Button["5d"]["ScaleType"] = Enum.ScaleType.Fit;
					Button["5d"]["ImageColor3"] = Color3.fromRGB(0, 69, 255);
					Button["5d"]["Image"] = [[rbxassetid://13441574158]];
					Button["5d"]["Size"] = UDim2.new(0, 30, 0, 30);
					Button["5d"]["Name"] = [[Icon]];
					Button["5d"]["BackgroundTransparency"] = 1;
					Button["5d"]["Position"] = UDim2.new(1.0291666984558105, 0, 0.17499999701976776, 0);

					-- StarterGui..main.Window.ElementsContainer.Button.UICorner
					Button["5e"] = Instance.new("UICorner", Button["59"]);


					-- StarterGui..main.Window.ElementsContainer.Button.UIStroke
					Button["5f"] = Instance.new("UIStroke", Button["59"]);
					Button["5f"]["Color"] = Color3.fromRGB(255, 255, 255);
					Button["5f"]["Thickness"] = 0.30000001192092896;
					Button["5f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				end

				do --// Methods
					function Button:SetText(text)
						Button["5a"].Text=text
					end
					function Button:SetCallback(fn)
						options.Callback=fn
					end
				end

				do --// Logic
					Button["59"].MouseEnter:Connect(function()
						Button.Hover=true
						Library:tween(Button['5f'], {Color = Color3.fromRGB(255,0,0)})

					end)

					Button["59"].MouseLeave:Connect(function()
						Button.Hover=false
						if not Button.MouseDown then
							Library:tween(Button['5f'], {Color = Color3.fromRGB(255, 255, 255)})
						end
					end)


					local debounce = false -- Initialize debounce variable

					uis.InputBegan:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover and not debounce then
							debounce = true -- Set debounce to true to prevent multiple clicks

							Button.MouseDown = true
							Library:tween(Button["5f"], {Color = Color3.fromRGB(0, 255, 0)})
							options.Callback()

							wait(1)

							debounce = false -- Reset debounce after waiting
						end
					end)

					uis.InputEnded:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType==Enum.UserInputType.MouseButton1 then
							Button.MouseDown=false
							if Button.Hover then
								--// Hover State
								Library:tween(Button["5f"], {Color = Color3.fromRGB(255,0,0)})
							else
								--// Reset
								Library:tween(Button["5f"], {Color = Color3.fromRGB(255,255,255)})
							end
						end
					end)
				end

				return Button
			end
			function Tab:CreateDropdown(options)
				options = Library:validate({
					Name = "Preview Dropdown",
					Callback = function(v) print(v) end,
					items = {}
				}, options or {})

				local Dropdown = {
					Items = {
						["id"] = { 
							"value"
						}
					},
					Open = false,
					MouseDown = false,
					Hover = false,
					HoveringItem = false
				}

				
				do --// Render
					-- StarterGui..main.Window.ElementsContainer.Dropdown
					Dropdown["29"] = Instance.new("Frame", Tab["18"]);
					Dropdown["29"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["29"]["BackgroundTransparency"] = 0.699999988079071;
					Dropdown["29"]["LayoutOrder"] = 4;
					Dropdown["29"]["Size"] = UDim2.new(0, 299, 0, 40);
					Dropdown["29"]["ClipsDescendants"] = true;
					Dropdown["29"]["Position"] = UDim2.new(0.15632183849811554, 0, 0.36082473397254944, 0);
					Dropdown["29"]["Name"] = [[Dropdown]];

					-- StarterGui..main.Window.ElementsContainer.Dropdown.Dropdown
					Dropdown["2a"] = Instance.new("TextLabel", Dropdown["29"]);
					Dropdown["2a"]["TextWrapped"] = true;
					Dropdown["2a"]["TextStrokeTransparency"] = 0;
					Dropdown["2a"]["RichText"] = true;
					Dropdown["2a"]["TextScaled"] = true;
					Dropdown["2a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["2a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Dropdown["2a"]["TextSize"] = 14;
					Dropdown["2a"]["TextColor3"] = Color3.fromRGB(0, 69, 255);
					Dropdown["2a"]["AnchorPoint"] = Vector2.new(0,0);
					Dropdown["2a"]["LayoutOrder"] = 2;
					Dropdown["2a"]["Size"] = UDim2.new(0, 259,0, 43);
					Dropdown["2a"]["Text"] = options.Title;
					Dropdown["2a"]["Name"] = [[Dropdown]];
					Dropdown["2a"]["BackgroundTransparency"] = 1;
					Dropdown["2a"]["Position"] = UDim2.new(0.012, 0,-0.017, 0);

					-- StarterGui..main.Window.ElementsContainer.Dropdown.Dropdown.Icon
					Dropdown["2b"] = Instance.new("ImageLabel", Dropdown["2a"]);
					Dropdown["2b"]["ScaleType"] = Enum.ScaleType.Fit;
					Dropdown["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["2b"]["ImageColor3"] = Color3.fromRGB(0, 69, 255);
					Dropdown["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Dropdown["2b"]["Image"] = [[http://www.roblox.com/asset/?id=6031097225]];
					Dropdown["2b"]["Size"] = UDim2.new(0.10999999940395355, 0, 0.736264169216156, 0);
					Dropdown["2b"]["Name"] = [[Icon]];
					Dropdown["2b"]["BackgroundTransparency"] = 1;
					Dropdown["2b"]["Position"] = UDim2.new(1.0791666507720947, 0, 0.5, 0);

					-- StarterGui..main.Window.ElementsContainer.Dropdown.Dropdown.Icon.UIAspectRatioConstraint
					Dropdown["2c"] = Instance.new("UIAspectRatioConstraint", Dropdown["2b"]);
					Dropdown["2c"]["AspectRatio"] = 0.8964173793792725;
					Dropdown["2c"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;

					-- StarterGui..main.Window.ElementsContainer.Dropdown.Dropdown.UITextSizeConstraint
					Dropdown["2d"] = Instance.new("UITextSizeConstraint", Dropdown["2a"]);
					Dropdown["2d"]["MaxTextSize"] = 50;

					-- StarterGui..main.Window.ElementsContainer.Dropdown.Dropdown.UIAspectRatioConstraint
					Dropdown["2e"] = Instance.new("UIAspectRatioConstraint", Dropdown["2a"]);
					Dropdown["2e"]["AspectRatio"] = 6;
					Dropdown["2e"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;

					-- StarterGui..main.Window.ElementsContainer.Dropdown.UICorner
					Dropdown["2f"] = Instance.new("UICorner", Dropdown["29"]);


					-- StarterGui..main.Window.ElementsContainer.Dropdown.UIStroke
					Dropdown["30"] = Instance.new("UIStroke", Dropdown["29"]);
					Dropdown["30"]["Color"] = Color3.fromRGB(255, 255, 255);
					Dropdown["30"]["Thickness"] = 0.30000001192092896;
					Dropdown["30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..main.Window.ElementsContainer.DropdownOpen.OptionsContainer
					Dropdown["31"] = Instance.new("ScrollingFrame", Dropdown["29"]);
					Dropdown["31"]["BorderSizePixel"] = 0;
					Dropdown["31"]["CanvasSize"] = UDim2.new(0, 0, 1, 0);
					Dropdown["31"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown["31"]["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left;
					Dropdown["31"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
					Dropdown["31"]["BackgroundTransparency"] = 0.6000000238418579;
					Dropdown["31"]["Size"] = UDim2.new(0.9464883208274841, 0, 0.6771637201309204, 0);
					Dropdown["31"]["Selectable"] = false;
					Dropdown["31"]["ScrollBarThickness"] = 0;
					Dropdown["31"]["Position"] = UDim2.new(0.020066889002919197, 0, 0.2876446843147278, 0);
					Dropdown["31"]["Name"] = [[OptionsContainer]];
					Dropdown["31"]["Visible"]=false;
					Dropdown["31"]["SelectionGroup"] = false;

					-- StarterGui..main.Window.ElementsContainer.Dropdown.OptionsContainer.UICorner
					Dropdown["32"] = Instance.new("UICorner", Dropdown["31"]);


					-- StarterGui..main.Window.ElementsContainer.Dropdown.OptionsContainer.UIStroke
					Dropdown["33"] = Instance.new("UIStroke", Dropdown["31"]);
					Dropdown["33"]["Color"] = Color3.fromRGB(255, 255, 255);
					Dropdown["33"]["Thickness"] = 0.30000001192092896;
					Dropdown["33"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..main.Window.ElementsContainer.Dropdown.OptionsContainer.UIListLayout
					Dropdown["34"] = Instance.new("UIListLayout", Dropdown["31"]);
					Dropdown["34"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
					Dropdown["34"]["Padding"] = UDim.new(0, 5);
					Dropdown["34"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


				end

				-- Methods
				do
					function Dropdown:Add(id, value)
						local Item = {
							Hover = false,
							MouseDown = false
						}

						if Dropdown.Items[id] ~= nil then
							return
						end

						Dropdown.Items[id] = {
							instance = {},
							value = value
						}
						-- StarterGui..main.Window.ElementsContainer.Dropdown.OptionsContainer.InactiveOption
						Dropdown.Items[id].instance["35"] = Instance.new("TextLabel", Dropdown["31"]);
						Dropdown.Items[id].instance["35"]["TextWrapped"] = true;
						Dropdown.Items[id].instance["35"]["TextScaled"] = true;
						Dropdown.Items[id].instance["35"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown.Items[id].instance["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
						Dropdown.Items[id].instance["35"]["TextSize"] = 14;
						Dropdown.Items[id].instance["35"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
						Dropdown.Items[id].instance["35"]["Size"] = UDim2.new(0, 200, 0, 28);
						Dropdown.Items[id].instance["35"]["Text"] = id;
						Dropdown.Items[id].instance["35"]["Name"] = [[InactiveOption]];
						Dropdown.Items[id].instance["35"]["BackgroundTransparency"] = 0.699999988079071;
						Dropdown.Items[id].instance["35"]["Position"] = UDim2.new(0.14664310216903687, 0, 0.13274335861206055, 0);

						-- StarterGui..main.Window.ElementsContainer.Dropdown.OptionsContainer.InactiveOption.UIStroke
						Dropdown.Items[id].instance["36"] = Instance.new("UIStroke", Dropdown.Items[id].instance["35"]);
						Dropdown.Items[id].instance["36"]["Color"] = Color3.fromRGB(255, 255, 255);
						Dropdown.Items[id].instance["36"]["Thickness"] = 0.30000001192092896;
						Dropdown.Items[id].instance["36"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

						-- StarterGui..main.Window.ElementsContainer.Dropdown.OptionsContainer.InactiveOption.UICorner
						Dropdown.Items[id].instance["37"] = Instance.new("UICorner", Dropdown.Items[id].instance["35"]);

						Dropdown.Items[id].instance["35"].MouseEnter:Connect(function()
							Item.Hover = true
							Dropdown.HoveringItem = true

							Library:tween(Dropdown.Items[id].instance["36"], {Color = Color3.fromRGB(255,0,0)})
						end)

						Dropdown.Items[id].instance["35"].MouseLeave:Connect(function()
							Item.Hover = false
							Dropdown.HoveringItem = false

							if not Item.MouseDown then
								Library:tween(Dropdown.Items[id].instance["36"], {Color = Color3.fromRGB(255,255,255)})
							end
						end)

						uis.InputBegan:Connect(function(input, gpe)
							if gpe then return end

							if Dropdown.Items[id] == nil then return end

							if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
								Item.MouseDown = true
								Library:tween(Dropdown.Items[id].instance["36"], {Color = Color3.fromRGB(0,255,0)})
								Library:tween(Dropdown.Items[id].instance["35"], {BackgroundColor3 = Color3.fromRGB(41, 41, 41)})
								options.Callback(value)
								Dropdown:Toggle()
							end
						end)

						uis.InputEnded:Connect(function(input, gpe)
							if gpe then return end

							if Dropdown.Items[id] == nil then return end

							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								Item.MouseDown = false

								if Item.Hover then
									Library:tween(Dropdown.Items[id].instance["36"], {Color = Color3.fromRGB(255,0,0)})
									Library:tween(Dropdown.Items[id].instance["35"], {BackgroundColor3 = Color3.fromRGB(0,0,0)})
								else
									Library:tween(Dropdown.Items[id].instance["36"], {Color = Color3.fromRGB(255,255,255)})
									Library:tween(Dropdown.Items[id].instance["35"], {BackgroundColor3 = Color3.fromRGB(0,0,0)})
								end
							end
						end)
					end

					function Dropdown:Remove(id)
						if Dropdown.Items[id] ~= nil then
							if Dropdown.Items[id].instance ~= nil then
								for i, v in pairs(Dropdown.Items[id].instance) do
									v:Destroy()
								end
							end
							Dropdown.Items[id] = nil
						end
					end

					function Dropdown:Clear()
						for i, v in pairs(Dropdown.Items) do
							Dropdown:Remove(i)
						end
					end

					function Dropdown:Toggle()
						Dropdown.Open = not Dropdown.Open
						print(Dropdown.Open)
						if not Dropdown.Open then
							Library:tween(Dropdown["29"], {Size = UDim2.new(0, 299,0, 47)}, function()
								Dropdown["31"]["Visible"] = false;
							end)
						else
							local count = 0
							for i, v in pairs(Dropdown.Items) do
								if v ~= nil then
									count += 1
								end
							end

							Dropdown["31"]["Visible"] = true;
							Library:tween(Dropdown["29"], {Size = UDim2.new(0, 299,0, 150)})
						end
					end
				end

				-- Logic
				do
					Dropdown["29"].MouseEnter:Connect(function()
						Dropdown.Hover = true

						Library:tween(Dropdown["30"], {Color = Color3.fromRGB(255,0,0)})
					end)

					Dropdown["29"].MouseLeave:Connect(function()
						Dropdown.Hover = false

						if not Dropdown.MouseDown then
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(255,255,255)})
						end
					end)

					uis.InputBegan:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
							Dropdown.MouseDown = true
							Library:tween(Dropdown["30"], {Color = Color3.fromRGB(0,255,0)})

							if not Dropdown.HoveringItem then
								Dropdown:Toggle()
							end
						end
					end)

					uis.InputEnded:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Dropdown.MouseDown = false

							if Dropdown.Hover then
								Library:tween(Dropdown["30"], {Color = Color3.fromRGB(255,0,0)})
							else
								Library:tween(Dropdown["30"], {Color = Color3.fromRGB(255,255,255)})
							end
						end
					end)
				end


				return Dropdown
			end
			function Tab:CreateToggle(options)
				local options=options or {}
				options = Library:validate({
					Name="Preview Toggle";
					Callback = function() end
				},options)

				local Toggle={
					Hover=false;
					MouseDown=false;
					State=false;
				}

				do --// Render
					-- StarterGui..main.Window.ElementsContainer.Toggle
					Toggle["4f"] = Instance.new("Frame", Tab["18"]);
					Toggle["4f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["4f"]["BackgroundTransparency"] = 0.699999988079071;
					Toggle["4f"]["LayoutOrder"] = 3;
					Toggle["4f"]["Size"] = UDim2.new(0, 299, 0, 40);
					Toggle["4f"]["ClipsDescendants"] = true;
					Toggle["4f"]["Position"] = UDim2.new(0.15632183849811554, 0, 0.36082473397254944, 0);
					Toggle["4f"]["Name"] = [[Toggle]];

					-- StarterGui..main.Window.ElementsContainer.Toggle.Toggle
					Toggle["50"] = Instance.new("TextLabel", Toggle["4f"]);
					Toggle["50"]["TextWrapped"] = true;
					Toggle["50"]["TextStrokeTransparency"] = 0;
					Toggle["50"]["RichText"] = true;
					Toggle["50"]["TextScaled"] = true;
					Toggle["50"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["50"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["50"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Toggle["50"]["TextSize"] = 14;
					Toggle["50"]["TextColor3"] = Color3.fromRGB(0, 69, 255);
					Toggle["50"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["50"]["LayoutOrder"] = 2;
					Toggle["50"]["Size"] = UDim2.new(0, 267, 0, 40);
					Toggle["50"]["Text"] = options.Name;
					Toggle["50"]["Name"] = options.Name;
					Toggle["50"]["BackgroundTransparency"] = 1;
					Toggle["50"]["Position"] = UDim2.new(0.43979936838150024, 0, 0.4801338315010071, 0);

					-- StarterGui..main.Window.ElementsContainer.Toggle.Toggle.UITextSizeConstraint
					Toggle["51"] = Instance.new("UITextSizeConstraint", Toggle["50"]);
					Toggle["51"]["MaxTextSize"] = 50;

					-- StarterGui..main.Window.ElementsContainer.Toggle.Toggle.UIAspectRatioConstraint
					Toggle["52"] = Instance.new("UIAspectRatioConstraint", Toggle["50"]);
					Toggle["52"]["AspectRatio"] = 6;
					Toggle["52"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;

					-- StarterGui..main.Window.ElementsContainer.Toggle.Toggle.Inactive
					Toggle["53"] = Instance.new("ImageLabel", Toggle["50"]);
					Toggle["53"]["BorderSizePixel"] = 0;
					Toggle["53"]["ScaleType"] = Enum.ScaleType.Fit;
					Toggle["53"]["ImageColor3"] = Color3.fromRGB(0, 69, 255);
					Toggle["53"]["ImageTransparency"]=0
					Toggle["53"]["Image"] = [[http://www.roblox.com/asset/?id=6031068433]];
					Toggle["53"]["Size"] = UDim2.new(0, 30, 0, 30);
					Toggle["53"]["Name"] = [[Inactive]];
					Toggle["53"]["BackgroundTransparency"] = 1;
					Toggle["53"]["Position"] = UDim2.new(1.0291666984558105, 0, 0.17499999701976776, 0);

					-- StarterGui..main.Window.ElementsContainer.Toggle.Toggle.Active
					Toggle["54"] = Instance.new("ImageLabel", Toggle["50"]);
					Toggle["54"]["BorderSizePixel"] = 0;
					Toggle["54"]["ScaleType"] = Enum.ScaleType.Fit;
					Toggle["54"]["ImageColor3"] = Color3.fromRGB(0, 69, 255);
					Toggle["54"]["ImageTransparency"]=1
					Toggle["54"]["Image"] = [[http://www.roblox.com/asset/?id=6031068426]];
					Toggle["54"]["Size"] = UDim2.new(0, 30, 0, 30);
					Toggle["54"]["Name"] = [[Active]];
					Toggle["54"]["BackgroundTransparency"] = 1;
					Toggle["54"]["Position"] = UDim2.new(1.0291666984558105, 0, 0.17499999701976776, 0);

					-- StarterGui..main.Window.ElementsContainer.Toggle.UICorner
					Toggle["55"] = Instance.new("UICorner", Toggle["4f"]);


					-- StarterGui..main.Window.ElementsContainer.Toggle.UIStroke
					Toggle["56"] = Instance.new("UIStroke", Toggle["4f"]);
					Toggle["56"]["Color"] = Color3.fromRGB(255, 255, 255);
					Toggle["56"]["Thickness"] = 0.30000001192092896;
					Toggle["56"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				end

				do --// Methods
					function Toggle:SetText(text)
						Toggle["50"].Text=text
					end
					function Toggle:SetCallback(fn)
						options.Callback=fn
					end
					function Toggle:Toggle(b)
						if b==nil then
							Toggle.State = not Toggle.State
						else
							Toggle.State = b
						end
						if Toggle.State then
							Library:tween(Toggle["54"], {ImageTransparency=0})
						elseif not Toggle.State then
							Library:tween(Toggle["54"], {ImageTransparency=1})

						end


						options.Callback(Toggle.State)
					end

				end

				do --// Logic
					Toggle["4f"].MouseEnter:Connect(function()
						Toggle.Hover=true
						Library:tween(Toggle['56'], {Color = Color3.fromRGB(255,0,0)})

					end)

					Toggle["4f"].MouseLeave:Connect(function()
						Toggle.Hover=false
						if not Toggle.MouseDown then
							Library:tween(Toggle['56'], {Color = Color3.fromRGB(255, 255, 255)})
						end
					end)


					local debounce = false -- Initialize debounce variable

					uis.InputBegan:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover and not debounce then
							debounce = true -- Set debounce to true to prevent multiple clicks

							Toggle.MouseDown = true
							Library:tween(Toggle["56"], {Color = Color3.fromRGB(0, 255, 0)})
							Toggle:Toggle()
							options.Callback(Toggle.State)

							wait(1)

							debounce = false -- Reset debounce after waiting
						end
					end)

					uis.InputEnded:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType==Enum.UserInputType.MouseButton1 then
							Toggle.MouseDown=false
							if Toggle.Hover then
								--// Hover State
								Library:tween(Toggle["56"], {Color = Color3.fromRGB(255,0,0)})
							else
								--// Reset
								Library:tween(Toggle["56"], {Color = Color3.fromRGB(255,255,255)})
							end
						end
					end)
				end

				return Toggle
			end
			function Tab:CreateSlider(options)
				options = Library:validate({
					Name="Preview Slider";
					Min=0;
					Max=100;
					Default=50;
					Callback = function(v) print(v) end
				},options)

				local Slider={
					Hover=false;
					MouseDown=false;
					Connection=nil;

				}

				do --// Render
					-- StarterGui..main.Window.ElementsContainer.Slider
					Slider["1d"] = Instance.new("Frame", Tab["18"]);
					Slider["1d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["1d"]["BackgroundTransparency"] = 0.699999988079071;
					Slider["1d"]["LayoutOrder"] = 5;
					Slider["1d"]["Size"] = UDim2.new(0, 299, 0, 67);
					Slider["1d"]["Position"] = UDim2.new(0.15632183849811554, 0, 0.592783510684967, 0);
					Slider["1d"]["Name"] = [[Slider]];

					-- StarterGui..main.Window.ElementsContainer.Slider.Slider
					Slider["1e"] = Instance.new("TextLabel", Slider["1d"]);
					Slider["1e"]["TextWrapped"] = true;
					Slider["1e"]["TextStrokeTransparency"] = 0;
					Slider["1e"]["RichText"] = true;
					Slider["1e"]["TextScaled"] = true;
					Slider["1e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Slider["1e"]["TextSize"] = 14;
					Slider["1e"]["TextColor3"] = Color3.fromRGB(0, 69, 255);
					Slider["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Slider["1e"]["LayoutOrder"] = 2;
					Slider["1e"]["Size"] = UDim2.new(0, 77, 0, 33);
					Slider["1e"]["Text"] = options.Text;
					Slider["1e"]["Name"] = options.Text;
					Slider["1e"]["BackgroundTransparency"] = 1;
					Slider["1e"]["Position"] = UDim2.new(0.16220736503601074, 0, 0.2836567759513855, 0);

					-- StarterGui..main.Window.ElementsContainer.Slider.Slider.UITextSizeConstraint
					Slider["1f"] = Instance.new("UITextSizeConstraint", Slider["1e"]);
					Slider["1f"]["MaxTextSize"] = 50;

					-- StarterGui..main.Window.ElementsContainer.Slider.UICorner
					Slider["20"] = Instance.new("UICorner", Slider["1d"]);


					-- StarterGui..main.Window.ElementsContainer.Slider.UIStroke
					Slider["21"] = Instance.new("UIStroke", Slider["1d"]);
					Slider["21"]["Color"] = Color3.fromRGB(255, 255, 255);
					Slider["21"]["Thickness"] = 0.30000001192092896;
					Slider["21"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..main.Window.ElementsContainer.Slider.sd
					Slider["22"] = Instance.new("Frame", Slider["1d"]);
					Slider["22"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["22"]["BackgroundTransparency"] = 0.6000000238418579;
					Slider["22"]["Size"] = UDim2.new(0.949999988079071, 0, 0.1942034661769867, 0);
					Slider["22"]["Position"] = UDim2.new(0.023333190008997917, 0, 0.6461177468299866, 0);
					Slider["22"]["Name"] = [[sd]];

					-- StarterGui..main.Window.ElementsContainer.Slider.sd.UICorner
					Slider["23"] = Instance.new("UICorner", Slider["22"]);


					-- StarterGui..main.Window.ElementsContainer.Slider.sd.UIStroke
					Slider["24"] = Instance.new("UIStroke", Slider["22"]);
					Slider["24"]["Color"] = Color3.fromRGB(255, 255, 255);
					Slider["24"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..main.Window.ElementsContainer.Slider.sd.Draggable
					Slider["25"] = Instance.new("Frame", Slider["22"]);
					Slider["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["25"]["Size"] = UDim2.new(0, 71,0, 15);
					Slider["25"]["Position"] = UDim2.new(0, 0,-0.121, 0);
					Slider["25"]["Name"] = [[Draggable]];

					-- StarterGui..main.Window.ElementsContainer.Slider.sd.Draggable.UIStroke
					Slider["26"] = Instance.new("UIStroke", Slider["25"]);
					Slider["26"]["Color"] = Color3.fromRGB(255, 255, 255);
					Slider["26"]["Thickness"] = 0.30000001192092896;
					Slider["26"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..main.Window.ElementsContainer.Slider.sd.Draggable.UICorner
					Slider["27"] = Instance.new("UICorner", Slider["25"]);


					-- StarterGui..main.Window.ElementsContainer.Slider.Percent
					Slider["28"] = Instance.new("TextLabel", Slider["1d"]);
					Slider["28"]["TextWrapped"] = true;
					Slider["28"]["TextScaled"] = true;
					Slider["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Slider["28"]["TextSize"] = 14;
					Slider["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["28"]["Size"] = UDim2.new(0.25988849997520447, 0, 0.4313431978225708, 0);
					Slider["28"]["Text"] = [[100]];
					Slider["28"]["Name"] = [[Percent]];
					Slider["28"]["BackgroundTransparency"] = 1;
					Slider["28"]["Position"] = UDim2.new(0.7367817163467407, 0, 0.05603664368391037, 0);

				end

				do --// Methods
					function Slider:SetValue(v)
						if v == nil then
							local percentage=math.clamp((mouse.X - Slider["1d"].AbsolutePosition.X) / (Slider["1d"].AbsoluteSize.X),0,1)
							local value = math.floor(((options.Max - options.Min) * percentage) + options.Min)

							Slider["28"]["Text"]=tostring(value)
							Slider["25"]["Size"] = UDim2.fromScale(percentage, 1.1)
						else
							Slider["28"]["Text"]=tostring(v)
							Slider["25"]["Size"] = UDim2.fromScale(((v - options.Min) / (options.Max - options.Min)), 1)
						end

						options.Callback(Slider.GetValue())
					end
					function Slider:GetValue()
						return tonumber(Slider["28"]["Text"])
					end
					function Slider:SetName(text)
						Slider["1e"]["Text"]=text
					end
				end

				do --// Logic
					Slider["1d"].MouseEnter:Connect(function()
						Slider.Hover=true
						Library:tween(Slider['21'], {Color = Color3.fromRGB(255,0,0)})

					end)

					Slider["1d"].MouseLeave:Connect(function()
						Slider.Hover=false
						if not Slider.MouseDown then
							Library:tween(Slider['21'], {Color = Color3.fromRGB(255, 255, 255)})
						end
					end)


					local debounce = false -- Initialize debounce variable

					uis.InputBegan:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover and not debounce then
							debounce = true -- Set debounce to true to prevent multiple clicks

							Slider.MouseDown = true
							Library:tween(Slider['21'], {Color = Color3.fromRGB(0, 255, 0)})
							options.Callback()

							if not Slider.Connection then
								Slider.Connection = runservice.RenderStepped:Connect(function()
									Slider:SetValue()
								end)
							end

							wait(1)

							debounce = false -- Reset debounce after waiting
						end
					end)

					uis.InputEnded:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType==Enum.UserInputType.MouseButton1 then
							Slider.MouseDown=false
							if Slider.Hover then
								--// Hover State
								Library:tween(Slider['21'], {Color = Color3.fromRGB(255,0,0)})
							else
								--// Reset
								Library:tween(Slider['21'], {Color = Color3.fromRGB(255,255,255)})
							end

							if Slider.Connection then Slider.Connection:Disconnect() end
							Slider.Connection=nil
						end
					end)
				end

				return Slider
			end
			function Tab:CreateWarning(options)
				local options=options or {}
				options = Library:validate({
					Message="Preview Warning";
				},options)

				local Warning={}

				do --// Render
					-- StarterGui..main.Window.ElementsContainer.Warning
					Warning["47"] = Instance.new("Frame", Tab["18"]);
					Warning["47"]["BackgroundColor3"] = Color3.fromRGB(255, 213, 57);
					Warning["47"]["BackgroundTransparency"] = 0.699999988079071;
					Warning["47"]["Size"] = UDim2.new(0, 299, 0, 40);
					Warning["47"]["ClipsDescendants"] = true;
					Warning["47"]["Position"] = UDim2.new(0.15632183849811554, 0, 0.36082473397254944, 0);
					Warning["47"]["Name"] = [[Warning]];

					-- StarterGui..main.Window.ElementsContainer.Warning.UICorner
					Warning["48"] = Instance.new("UICorner", Warning["47"]);


					-- StarterGui..main.Window.ElementsContainer.Warning.UIStroke
					Warning["49"] = Instance.new("UIStroke", Warning["47"]);
					Warning["49"]["Color"] = Color3.fromRGB(255, 255, 255);
					Warning["49"]["Thickness"] = 0.30000001192092896;
					Warning["49"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..main.Window.ElementsContainer.Warning.Warning
					Warning["4a"] = Instance.new("TextLabel", Warning["47"]);
					Warning["4a"]["TextWrapped"] = true;
					Warning["4a"]["TextStrokeTransparency"] = 0.4;
					Warning["4a"]["RichText"] = true;
					Warning["4a"]["TextScaled"] = true;
					Warning["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 213, 57);
					Warning["4a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Warning["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Warning["4a"]["TextSize"] = 14;
					Warning["4a"]["TextColor3"] = Color3.fromRGB(218, 174, 13);
					Warning["4a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Warning["4a"]["LayoutOrder"] = 1;
					Warning["4a"]["Size"] = UDim2.new(0, 272, 0, 40);
					Warning["4a"]["Text"] = options.Message;
					Warning["4a"]["Name"] = options.Message;
					Warning["4a"]["BackgroundTransparency"] = 1;
					Warning["4a"]["Position"] = UDim2.new(0.4197324514389038, 0, 0.4889175295829773, 0);

					-- StarterGui..main.Window.ElementsContainer.Warning.Warning.Icon
					Warning["4b"] = Instance.new("ImageLabel", Warning["4a"]);
					Warning["4b"]["ScaleType"] = Enum.ScaleType.Fit;
					Warning["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Warning["4b"]["ImageColor3"] = Color3.fromRGB(255, 196, 17);
					Warning["4b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Warning["4b"]["Image"] = [[http://www.roblox.com/asset/?id=6031071053]];
					Warning["4b"]["Size"] = UDim2.new(0.10999999940395355, 0, 0.736264169216156, 0);
					Warning["4b"]["Name"] = [[Icon]];
					Warning["4b"]["BackgroundTransparency"] = 1;
					Warning["4b"]["Position"] = UDim2.new(1.1166666746139526, 0, 0.5, 0);

					-- StarterGui..main.Window.ElementsContainer.Warning.Warning.Icon.UIAspectRatioConstraint
					Warning["4c"] = Instance.new("UIAspectRatioConstraint", Warning["4b"]);
					Warning["4c"]["AspectRatio"] = 0.8964173793792725;
					Warning["4c"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;

					-- StarterGui..main.Window.ElementsContainer.Warning.Warning.UITextSizeConstraint
					Warning["4d"] = Instance.new("UITextSizeConstraint", Warning["4a"]);
					Warning["4d"]["MaxTextSize"] = 50;

					-- StarterGui..main.Window.ElementsContainer.Warning.Warning.UIAspectRatioConstraint
					Warning["4e"] = Instance.new("UIAspectRatioConstraint", Warning["4a"]);
					Warning["4e"]["AspectRatio"] = 6;
					Warning["4e"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;
				end

				do --// Methods
					function Warning:SetMessage(Message)
						options.Message=Message
						Warning["4a"].Text=Message --// Warning["4a"].Text=options.Message
					end
				end


				return Warning
			end
			function Tab:CreateError(options)
				local options=options or {}
				options = Library:validate({
					Message="Preview Error";
				},options)

				local Error={}

				do --// Render
					-- StarterGui..main.Window.ElementsContainer.Error
					Error["3f"] = Instance.new("Frame", Tab["18"]);
					Error["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
					Error["3f"]["BackgroundTransparency"] = 0.699999988079071;
					Error["3f"]["Size"] = UDim2.new(0, 299, 0, 40);
					Error["3f"]["ClipsDescendants"] = true;
					Error["3f"]["Position"] = UDim2.new(0.15632183849811554, 0, 0.36082473397254944, 0);
					Error["3f"]["Name"] = [[Error]];

					-- StarterGui..main.Window.ElementsContainer.Error.UICorner
					Error["40"] = Instance.new("UICorner", Error["3f"]);

					-- StarterGui..main.Window.ElementsContainer.Error.UIStroke
					Error["41"] = Instance.new("UIStroke", Error["3f"]);
					Error["41"]["Color"] = Color3.fromRGB(255, 255, 255);
					Error["41"]["Thickness"] = 0.30000001192092896;
					Error["41"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui..main.Window.ElementsContainer.Error.Error
					Error["42"] = Instance.new("TextLabel", Error["3f"]);
					Error["42"]["TextWrapped"] = true;
					Error["42"]["TextStrokeTransparency"] = 0.23999999463558197;
					Error["42"]["RichText"] = true;
					Error["42"]["TextScaled"] = true;
					Error["42"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
					Error["42"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Error["42"]["FontFace"] = Font.new([[rbxasset://fonts/families/TitilliumWeb.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					Error["42"]["TextSize"] = 14;
					Error["42"]["TextColor3"] = Color3.fromRGB(255, 0, 0);
					Error["42"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Error["42"]["LayoutOrder"] = 1;
					Error["42"]["Size"] = UDim2.new(0, 300, 0, 26);
					Error["42"]["Text"] = options.Message;
					Error["42"]["Name"] = options.Message;
					Error["42"]["BackgroundTransparency"] = 1;
					Error["42"]["Position"] = UDim2.new(0.43979933857917786, 0, 0.4889175295829773, 0);

					-- StarterGui..main.Window.ElementsContainer.Error.Error.UITextSizeConstraint
					Error["43"] = Instance.new("UITextSizeConstraint", Error["42"]);
					Error["43"]["MaxTextSize"] = 50;

					-- StarterGui..main.Window.ElementsContainer.Error.Error.UIAspectRatioConstraint
					Error["44"] = Instance.new("UIAspectRatioConstraint", Error["42"]);
					Error["44"]["AspectRatio"] = 6;
					Error["44"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;

					-- StarterGui..main.Window.ElementsContainer.Error.Error.Icon
					Error["45"] = Instance.new("ImageLabel", Error["42"]);
					Error["45"]["ScaleType"] = Enum.ScaleType.Fit;
					Error["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Error["45"]["ImageColor3"] = Color3.fromRGB(62, 62, 62);
					Error["45"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Error["45"]["Image"] = [[rbxasset://textures/GameSettings/Error.png]];
					Error["45"]["Size"] = UDim2.new(0.10999999940395355, 0, 0.736264169216156, 0);
					Error["45"]["Name"] = [[Icon]];
					Error["45"]["BackgroundTransparency"] = 1;
					Error["45"]["Position"] = UDim2.new(1.0916666984558105, 0, 0.5, 0);

					-- StarterGui..main.Window.ElementsContainer.Error.Error.Icon.UIAspectRatioConstraint
					Error["46"] = Instance.new("UIAspectRatioConstraint", Error["45"]);
					Error["46"]["AspectRatio"] = 0.8964173793792725;
					Error["46"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;
				end

				do --// Methods
					function Error:SetMessage(Message)
						options.Message=Message
						Error["42"].Text=Message --// Error["4a"].Text=options.Message
					end
				end


				return Error
			end
		end
		return Tab
	end


	return UI
end

local lib = Library:Init({
	Name="Sploit Hub"
})

local tab=lib:CreateTab({Name="asfqasdf"})

--// Button

local Button = tab:CreateButton({Name="Button";
	Callback=function()
		print("aa")
	end,
})
local i=0
Button:SetCallback(function()
	Button:SetText("I have been clicked " .. i .. " times")
	i+=1
end)

--// Slider

local Slider = tab:CreateSlider({
	Name="Slider";
	Min=0;
	Max=50;
	Default=25;
	Callback=function(speed)
		lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=speed
	end,
})

--// Toggle

local Toggle = tab:CreateToggle({
	Name="Toggle";
	State=false;
	Callback=function(v)
		if not v then --// Off
			lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=0
		elseif v then --// On
			lp.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=99999

		end
		print(v)
	end,
})

--// Dropdown

local Dropdown = tab:CreateDropdown({
	Name="Dropdown";
	Items={"a","b","c","d","e","f","g"};
	Callback = function() print("Clicked") end;
})

Dropdown:Add("TestOption1",68)
Dropdown:Add("TestOption2",69)
Dropdown:Add("TestOption3",3)
--[[ Labels ]]

--// Warning

local Warning = tab:CreateWarning({Message="Warning",})


--// Error

local Error = tab:CreateError({Message="Error",})

--// Loop_Test

while true do
	wait(1)
	Error:SetMessage("Error")
	Warning:SetMessage("Warning")
	wait(5)
	Error:SetMessage("Error [SET_TEXT]")
	Warning:SetMessage("Warning [SET_TEXT]")
	wait(1)
end

--// Notifications

local notification = tab:CreateNotification{
	Title="ah";
	Description="ah";
	Duration=6;
}

print(notification);
