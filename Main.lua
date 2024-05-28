local Moon = {}

local tween = game:GetService("TweenService")
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local tis = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local cg = game:GetService("CoreGui")
local ps = game:GetService("Players")
local mouse = ps.LocalPlayer:GetMouse()
Sliderdrag = false

-- utility
do
	function Moon.tween(ts, object, goal, callback)
		local tween = tween:Create(object, ts, goal)
		tween.Completed:Connect(callback or function() end)
		tween:Play()
	end

	function Moon.validate(defaults, options)
		for i, v in pairs(defaults) do
			if options[i] == nil then
				options[i] = v
			end
		end
		return options
	end

	function Moon.makeDraggable(frame)
		local dragging = false
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			local goalPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			local tween = tween:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = goalPos})
			tween:Play()
		end

		frame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and Sliderdrag == false or input.UserInputType == Enum.UserInputType.Touch and Sliderdrag == false then
				dragging = true
				dragStart = input.Position
				startPos = frame.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End and Sliderdrag == false then
						dragging = false
					end
				end)
			end
		end)

		frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and Sliderdrag == false or input.UserInputType == Enum.UserInputType.Touch and Sliderdrag == false then
				dragInput = input
			end
		end)

		input.InputChanged:Connect(function(input)
			if input == dragInput and dragging and Sliderdrag == false then
				update(input)
			end
		end)
	end
	
	function Moon.Theme(defaults, themes)
		for i, v in pairs(defaults) do
			if themes[i] == nil then
				themes[i] = v
			end
		end
		return themes
	end
end

function Notify(options)
		options = Moon.validate({
			title = "Notification",
			desc = "Description",
			icon = "rbxassetid://11162370676",
			timeout = 4
		}, options or {})
		
		if options["timeout"] < 4 then options["timeout"] = 4 print("Timeout number cannot be lower than 4") end
		
		local Notify = {}
		
		-- StarterGui.Moon.Notification Holder.Notif
		Notify["45"] = Instance.new("Frame", lib["43"]);
		Notify["45"]["BorderSizePixel"] = 0;
		Notify["45"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
		Notify["45"]["AnchorPoint"] = Vector2.new(1, 1);
		Notify["45"]["Size"] = UDim2.new(0, 200, 0, 40);
		Notify["45"]["Position"] = UDim2.new(1, -10, 1, -10);
		Notify["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Notify["45"]["Name"] = [[Notif]];
		Notify["45"]["BackgroundTransparency"] = 1;
		Notify["45"]["Visible"] = false;

		-- StarterGui.Moon.Notification Holder.Notif.UICorner
		Notify["46"] = Instance.new("UICorner", Notify["45"]);


		-- StarterGui.Moon.Notification Holder.Notif.Shadow
		Notify["47"] = Instance.new("ImageLabel", Notify["45"]);
		Notify["47"]["ZIndex"] = -1;
		Notify["47"]["BorderSizePixel"] = 0;
		Notify["47"]["SliceCenter"] = Rect.new(100, 100, 400, 400);
		Notify["47"]["ScaleType"] = Enum.ScaleType.Slice;
		Notify["47"]["ImageTransparency"] = 0.2;
		Notify["47"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		Notify["47"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Notify["47"]["Image"] = options["icon"];
		Notify["47"]["Size"] = UDim2.new(1, 100, 1, 100);
		Notify["47"]["BackgroundTransparency"] = 1;
		Notify["47"]["Name"] = [[Shadow]];
		Notify["47"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.Moon.Notification Holder.Notif.Title
		Notify["48"] = Instance.new("TextLabel", Notify["45"]);
		Notify["48"]["BorderSizePixel"] = 0;
		Notify["48"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Notify["48"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		Notify["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Notify["48"]["TextSize"] = 15;
		Notify["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Notify["48"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
		Notify["48"]["BackgroundTransparency"] = 1;
		Notify["48"]["Size"] = UDim2.new(1, -25, 1, -1/2);
		Notify["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Notify["48"]["Text"] = options["title"];
		Notify["48"]["Name"] = [[Title]];
		Notify["48"]["TextTransparency"] = 1;

		-- StarterGui.Moon.Notification Holder.Notif.Title.UIPadding
		Notify["49"] = Instance.new("UIPadding", Notify["48"]);
		Notify["49"]["PaddingTop"] = UDim.new(0, 5);
		Notify["49"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.Moon.Notification Holder.Notif.Desc
		Notify["4a"] = Instance.new("TextLabel", Notify["45"]);
		Notify["4a"]["TextScaled"] = true;
		Notify["4a"]["BorderSizePixel"] = 0;
		Notify["4a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Notify["4a"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
		Notify["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Notify["4a"]["TextSize"] = 13;
		Notify["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
		Notify["4a"]["TextColor3"] = Color3.fromRGB(96, 96, 96);
		Notify["4a"]["BackgroundTransparency"] = 1;
		Notify["4a"]["Size"] = UDim2.new(1, -25, .5, 0);
		Notify["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Notify["4a"]["Text"] = options["desc"];
		Notify["4a"]["Name"] = [[Desc]];
		Notify["4a"]["TextTransparency"] = 1;
		Notify["4a"]["AnchorPoint"] = Vector2.new(0, 1);
		Notify["4a"]["Position"] = UDim2.new(0, 0, 1, 0);

		-- StarterGui.Moon.Notification Holder.Notif.Desc.UIPadding
		Notify["4b"] = Instance.new("UIPadding", Notify["4a"]);
		Notify["4b"]["PaddingLeft"] = UDim.new(0, 8);
		Notify["4b"]["PaddingBottom"] = UDim.new(0, 6);

		-- StarterGui.Moon.Notification Holder.Notif.ImageLabel
		Notify["4c"] = Instance.new("ImageLabel", Notify["45"]);
		Notify["4c"]["BorderSizePixel"] = 0;
		Notify["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Notify["4c"]["AnchorPoint"] = Vector2.new(1, 0.5);
		Notify["4c"]["Image"] = [[rbxassetid://17641533694]];
		Notify["4c"]["Size"] = UDim2.new(0, 20, 0, 20);
		Notify["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Notify["4c"]["BackgroundTransparency"] = 1;
		Notify["4c"]["Position"] = UDim2.new(1, -10, 0.5, 0);
		Notify["47"]["ImageTransparency"] = 1;

		-- StarterGui.Moon.Notification Holder.Notif.ImageLabel.UICorner
		Notify["4d"] = Instance.new("UICorner", Notify["4c"]);
		Notify["4d"]["CornerRadius"] = UDim.new(0, 7);
		
		-- logic
		do
			Notify["45"].Visible = true
			Moon.tween(ti, Notify["45"], {BackgroundTransparency = 0})
			wait(0.3)
			Moon.tween(ti, Notify["4c"], {ImageTransparency = 0})
			Moon.tween(ti, Notify["4a"], {TextTransparency = 0})
			Moon.tween(ti, Notify["48"], {TextTransparency = 0})
			wait(options["timeout"])
			Moon.tween(ti, Notify["4c"], {ImageTransparency = 1})
			Moon.tween(ti, Notify["4a"], {TextTransparency = 1})
			Moon.tween(ti, Notify["48"], {TextTransparency = 1})
			wait(0.3)
			Moon.tween(ti, Notify["45"], {BackgroundTransparency = 1}, function() Notify["45"]:Destroy() end)
		end
		
		return Notify
	end

function Moon.CreateLib(themes)
	themes = Moon.Theme({
		bgt = 0
	}, themes or {})
	
	local lib = {
		CurrentTab = nil,
		Close = false
	}
	
	do
		-- StarterGui.Moon
		lib["1"] = Instance.new("ScreenGui", run:IsStudio() and ps.LocalPlayer:WaitForChild("PlayerGui") or cg);
		lib["1"]["IgnoreGuiInset"] = true;
		lib["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
		lib["1"]["Name"] = [[Moon]];

		-- StarterGui.Moon.Main
		lib["2"] = Instance.new("Frame", lib["1"]);
		lib["2"]["BorderSizePixel"] = 0;
		lib["2"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
		lib["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		lib["2"]["Size"] = UDim2.new(0, 480, 0, 330);
		lib["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		lib["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		lib["2"]["Name"] = [[Main]];
		lib["2"]["BackgroundTransparency"] = themes.bgt;

		-- StarterGui.Moon.Main.UICorner
		lib["3"] = Instance.new("UICorner", lib["2"]);


		-- StarterGui.Moon.Main.Shadow
		lib["4"] = Instance.new("ImageLabel", lib["2"]);
		lib["4"]["ZIndex"] = -1;
		lib["4"]["BorderSizePixel"] = 0;
		lib["4"]["SliceCenter"] = Rect.new(100, 100, 400, 400);
		lib["4"]["ScaleType"] = Enum.ScaleType.Slice;
		lib["4"]["ImageTransparency"] = 0.2;
		lib["4"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		lib["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		lib["4"]["Image"] = [[rbxassetid://11162370676]];
		lib["4"]["Size"] = UDim2.new(1.27292, 0, 1.26061, 0);
		lib["4"]["BackgroundTransparency"] = 1;
		lib["4"]["Name"] = [[Shadow]];
		lib["4"]["Position"] = UDim2.new(0.5, 0, 0.48485, 5);

		-- StarterGui.Moon.Main.UIPadding
		lib["5"] = Instance.new("UIPadding", lib["2"]);
		lib["5"]["PaddingTop"] = UDim.new(0, 5);
		lib["5"]["PaddingRight"] = UDim.new(0, 5);
		lib["5"]["PaddingLeft"] = UDim.new(0, 5);
		lib["5"]["PaddingBottom"] = UDim.new(0, 5);

		-- StarterGui.Moon.Main.UIStroke
		lib["6"] = Instance.new("UIStroke", lib["2"]);
		lib["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		lib["6"]["Color"] = Color3.fromRGB(55, 55, 55);

		-- StarterGui.Moon.Main.Nav
		lib["7"] = Instance.new("Frame", lib["2"]);
		lib["7"]["BorderSizePixel"] = 0;
		lib["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		lib["7"]["Size"] = UDim2.new(1, 0, 0, 25);
		lib["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		lib["7"]["Name"] = [[Nav]];
		lib["7"]["BackgroundTransparency"] = 1;
		
		-- StarterGui.Moon.Main.Nav.Wrapper
		lib["8"] = Instance.new("ScrollingFrame", lib["7"]);
		lib["8"]["Active"] = true;
		lib["8"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
		lib["8"]["BorderSizePixel"] = 0;
		lib["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		lib["8"]["Name"] = [[Wrapper]];
		lib["8"]["Size"] = UDim2.new(1, 0, 1, 0);
		lib["8"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		lib["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		lib["8"]["ScrollBarThickness"] = 0;
		lib["8"]["BackgroundTransparency"] = 1;
		
		-- StarterGui.Moon.Main.Nav.Wrapper.Tab.UICorner
		lib["f"] = Instance.new("UICorner", lib["e"]);
		lib["f"]["CornerRadius"] = UDim.new(0, 7);

		-- StarterGui.Moon.Main.Nav.Wrapper.Tab.UIPadding
		lib["10"] = Instance.new("UIPadding", lib["e"]);
		lib["10"]["PaddingLeft"] = UDim.new(0, 24);
		
		-- StarterGui.Moon.Main.Nav.Wrapper.UIListLayout
		lib["d"] = Instance.new("UIListLayout", lib["8"]);
		lib["d"]["Padding"] = UDim.new(0, 6);
		lib["d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		lib["d"]["FillDirection"] = Enum.FillDirection.Horizontal;

		-- StarterGui.Moon.Main.Nav.Close
		lib["12"] = Instance.new("ImageLabel", lib["7"]);
		lib["12"]["BorderSizePixel"] = 0;
		lib["12"]["AnchorPoint"] = Vector2.new(1, 0.5);
		lib["12"]["Image"] = [[http://www.roblox.com/asset/?id=6031094678]];
		lib["12"]["Size"] = UDim2.new(0, 20, 0, 20);
		lib["12"]["BackgroundTransparency"] = 1;
		lib["12"]["Name"] = [[Close]];
		lib["12"]["Position"] = UDim2.new(1, -1, 0.5, 0);

		-- StarterGui.Moon.Main.TabContainer
		lib["13"] = Instance.new("Frame", lib["2"]);
		lib["13"]["BorderSizePixel"] = 0;
		lib["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		lib["13"]["Size"] = UDim2.new(1, 0, 1, -40);
		lib["13"]["Position"] = UDim2.new(0, 0, 0, 30);
		lib["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		lib["13"]["Name"] = [[TabContainer]];
		lib["13"]["BackgroundTransparency"] = 1;
		
		-- StarterGui.Moon.Notification Holder
		lib["43"] = Instance.new("ScrollingFrame", lib["1"]);
		lib["43"]["Active"] = true;
		lib["43"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
		lib["43"]["BorderSizePixel"] = 0;
		lib["43"]["CanvasPosition"] = Vector2.new(0, 579);
		lib["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		lib["43"]["Name"] = [[Notification Holder]];
		lib["43"]["ClipsDescendants"] = false;
		lib["43"]["Size"] = UDim2.new(0.24108, 0, 1, 0);
		lib["43"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		lib["43"]["Position"] = UDim2.new(0.75892, 0, 0, 0);
		lib["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		lib["43"]["ScrollBarThickness"] = 0;
		lib["43"]["BackgroundTransparency"] = 1;
		
		-- StarterGui.Moon.Notification Holder.UIListLayout
		lib["44"] = Instance.new("UIListLayout", lib["43"]);
		lib["44"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		lib["44"]["Padding"] = UDim.new(0, 10);
		lib["44"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom;
		lib["44"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		
		-- StarterGui.Moon.Notification Holder.UIPadding
		lib["4e"] = Instance.new("UIPadding", lib["43"]);
		lib["4e"]["PaddingBottom"] = UDim.new(0, 15);
	end
	
	function lib.Tab(options)
		options = Moon.validate({
			name = "Preview Tab",
			icon = "rbxassetid://17594347148"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		do
			-- StarterGui.Moon.Main.Nav.Wrapper.Tab
			Tab["9"] = Instance.new("TextLabel", lib["8"]);
			Tab["9"]["BorderSizePixel"] = 0;
			Tab["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["9"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
			Tab["9"]["TextSize"] = 14;
			Tab["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["9"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
			Tab["9"]["BackgroundTransparency"] = 1;
			Tab["9"]["Size"] = UDim2.new(0, 100, 0.5, 0);
			Tab["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["9"]["Text"] = options["name"];
			Tab["9"]["Name"] = [[Tab]];

			-- StarterGui.Moon.Main.Nav.Wrapper.Tab.UICorner
			Tab["a"] = Instance.new("UICorner", Tab["9"]);
			Tab["a"]["CornerRadius"] = UDim.new(0, 7);

			-- StarterGui.Moon.Main.Nav.Wrapper.Tab.UIPadding
			Tab["b"] = Instance.new("UIPadding", Tab["9"]);
			Tab["b"]["PaddingLeft"] = UDim.new(0, 24);

			-- StarterGui.Moon.Main.Nav.Wrapper.Tab.Icon
			Tab["c"] = Instance.new("ImageLabel", Tab["9"]);
			Tab["c"]["BorderSizePixel"] = 0;
			Tab["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["c"]["Image"] = options["icon"];
			Tab["c"]["Size"] = UDim2.new(0, 16, 0, 16);
			Tab["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["c"]["BackgroundTransparency"] = 1;
			Tab["c"]["Name"] = [[Icon]];
			Tab["c"]["Position"] = UDim2.new(0, -20, 0, 4);
			
			-- StarterGui.Moon.Main.TabContainer.TabWrapper
			Tab["14"] = Instance.new("ScrollingFrame", lib["13"]);
			Tab["14"]["Active"] = true;
			Tab["14"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
			Tab["14"]["BorderSizePixel"] = 0;
			Tab["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["14"]["Name"] = [[TabWrapper]];
			Tab["14"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["14"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["14"]["ScrollBarThickness"] = 0;
			Tab["14"]["BackgroundTransparency"] = 1;
			Tab["14"]["Visible"] = false;
			
			-- StarterGui.Moon.Main.TabContainer.TabWrapper.UIListLayout
			lib["1b"] = Instance.new("UIListLayout", Tab["14"]);
			lib["1b"]["Padding"] = UDim.new(0, 6);
			lib["1b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
			
			-- StarterGui.Moon.Main.TabContainer.TabWrapper.UIPadding
			lib["1a"] = Instance.new("UIPadding", Tab["14"]);
			lib["1a"]["PaddingTop"] = UDim.new(0, 6);
			lib["1a"]["PaddingRight"] = UDim.new(0, 1);
			lib["1a"]["PaddingLeft"] = UDim.new(0, 1);
			lib["1a"]["PaddingBottom"] = UDim.new(0, 1);
		end
		
		-- Methods
		function Tab.Activate()
			if not Tab.Active then
				if lib.CurrentTab ~= nil then
					lib.CurrentTab.Deactivate()
				end

				Tab.Active = true
				Moon.tween(ti, Tab["9"], {BackgroundTransparency = 0})
				Moon.tween(ti, Tab["9"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Moon.tween(ti, Tab["c"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Tab["14"].Visible = true

				lib.CurrentTab = Tab
			end
		end

		function Tab.Deactivate()
			if Tab.Active then
				Tab.Active = false
				Moon.tween(ti, Tab["9"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Moon.tween(ti, Tab["c"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				Moon.tween(ti, Tab["9"], {BackgroundTransparency = 1})
				Tab["14"].Visible = false
			end
		end

		-- Logic
		do
			Tab["9"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Moon.tween(ti, Tab["9"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Moon.tween(ti, Tab["c"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["9"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Moon.tween(ti, Tab["9"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
					Moon.tween(ti, Tab["c"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				end
			end)

			input.InputBegan:Connect(function(input)

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab.Activate()
					end
				end
			end)

			if lib.CurrentTab == nil then
				Tab.Activate()
			end
		end
		
		function Tab.Button(options)
			options = Moon.validate({
				name = "Button",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			do
				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Button
				Button["15"] = Instance.new("Frame", Tab["14"]);
				Button["15"]["BorderSizePixel"] = 0;
				Button["15"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Button["15"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["15"]["Name"] = [[Button]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Button.UICorner
				Button["16"] = Instance.new("UICorner", Button["15"]);
				Button["16"]["CornerRadius"] = UDim.new(0, 7);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Button.Title
				Button["17"] = Instance.new("TextLabel", Button["15"]);
				Button["17"]["BorderSizePixel"] = 0;
				Button["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["17"]["TextSize"] = 14;
				Button["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["17"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
				Button["17"]["BackgroundTransparency"] = 1;
				Button["17"]["Size"] = UDim2.new(1, 0, 1, 0);
				Button["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["17"]["Text"] = options["name"];
				Button["17"]["Name"] = [[Title]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Button.UIPadding
				Button["18"] = Instance.new("UIPadding", Button["15"]);
				Button["18"]["PaddingTop"] = UDim.new(0, 5);
				Button["18"]["PaddingRight"] = UDim.new(0, 5);
				Button["18"]["PaddingLeft"] = UDim.new(0, 5);
				Button["18"]["PaddingBottom"] = UDim.new(0, 5);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Button.Click
				Button["19"] = Instance.new("ImageLabel", Button["15"]);
				Button["19"]["BorderSizePixel"] = 0;
				Button["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["19"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Button["19"]["Image"] = [[rbxassetid://17594522380]];
				Button["19"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["19"]["BackgroundTransparency"] = 1;
				Button["19"]["Name"] = [[Click]];
				Button["19"]["Position"] = UDim2.new(1, -1, 0.5, 0);
			end
			
			-- Logic
			do
				Button["15"].MouseEnter:Connect(function()
					Button.Hover = true

					Moon.tween(ti, Button["15"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					Moon.tween(ti, Button["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				end)

				Button["15"].MouseLeave:Connect(function()
					Button.Hover = false

					Moon.tween(ti, Button["15"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
					Moon.tween(ti, Button["17"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
				end)

				input.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Moon.tween(ti, Button["15"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
						Moon.tween(ti, Button["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						options.callback()
					end
				end)

				input.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false

						if Button.Hover then
							Moon.tween(ti, Button["15"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
							Moon.tween(ti, Button["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						else
							Moon.tween(ti, Button["15"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Moon.tween(ti, Button["17"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
						end
					end
				end)
			end	
			
			return Button
		end
		
		function Tab.Toggle(options)
			options = Moon.validate({
				name = "Toggle",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}
			
			do
				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Toggle
				Toggle["1c"] = Instance.new("Frame", Tab["14"]);
				Toggle["1c"]["BorderSizePixel"] = 0;
				Toggle["1c"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Toggle["1c"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["1c"]["Name"] = [[Toggle]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Toggle.UICorner
				Toggle["1d"] = Instance.new("UICorner", Toggle["1c"]);
				Toggle["1d"]["CornerRadius"] = UDim.new(0, 7);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Toggle.Title
				Toggle["1e"] = Instance.new("TextLabel", Toggle["1c"]);
				Toggle["1e"]["BorderSizePixel"] = 0;
				Toggle["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["1e"]["TextSize"] = 14;
				Toggle["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["1e"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
				Toggle["1e"]["BackgroundTransparency"] = 1;
				Toggle["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["1e"]["Text"] = options["name"];
				Toggle["1e"]["Name"] = [[Title]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Toggle.UIPadding
				Toggle["1f"] = Instance.new("UIPadding", Toggle["1c"]);
				Toggle["1f"]["PaddingTop"] = UDim.new(0, 5);
				Toggle["1f"]["PaddingRight"] = UDim.new(0, 5);
				Toggle["1f"]["PaddingLeft"] = UDim.new(0, 5);
				Toggle["1f"]["PaddingBottom"] = UDim.new(0, 5);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Toggle.Toggle
				Toggle["20"] = Instance.new("Frame", Toggle["1c"]);
				Toggle["20"]["BorderSizePixel"] = 0;
				Toggle["20"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
				Toggle["20"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["20"]["Size"] = UDim2.new(0, 16, 0, 16);
				Toggle["20"]["Position"] = UDim2.new(1, -3, 0.5, 0);
				Toggle["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["20"]["Name"] = [[Toggle]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Toggle.Toggle.UICorner
				Toggle["21"] = Instance.new("UICorner", Toggle["20"]);
				Toggle["21"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Toggle.Toggle.Checkmark
				Toggle["22"] = Instance.new("ImageLabel", Toggle["20"]);
				Toggle["22"]["BorderSizePixel"] = 0;
				Toggle["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["22"]["ImageTransparency"] = 1;
				Toggle["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["22"]["Image"] = [[http://www.roblox.com/asset/?id=6031094667]];
				Toggle["22"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["22"]["BackgroundTransparency"] = 1;
				Toggle["22"]["Name"] = [[Checkmark]];
				Toggle["22"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end
			
			do
				function Toggle:ChangeState(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else	
						Toggle.State = b
					end

					if Toggle.State then
						Moon.tween(ti, Toggle["20"], {BackgroundColor3 = Color3.fromRGB(115, 191, 92)})
						Moon.tween(ti, Toggle["22"], {ImageTransparency = 0})
					else
						Moon.tween(ti, Toggle["20"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						Moon.tween(ti, Toggle["22"], {ImageTransparency = 1})
					end

					options.callback(Toggle.State)
				end

				Toggle["1c"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Moon.tween(ti, Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					Moon.tween(ti, Toggle["1e"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					if Toggle.State == true then
						Moon.tween(ti, Toggle["20"], {BackgroundColor3 = Color3.fromRGB(125, 201, 102)})
					else
						Moon.tween(ti, Toggle["20"], {BackgroundColor3 = Color3.fromRGB(42, 42, 42)})
					end
				end)

				Toggle["1c"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Moon.tween(ti, Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						Moon.tween(ti, Toggle["1e"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
						if Toggle.State == true then
							Moon.tween(ti, Toggle["20"], {BackgroundColor3 = Color3.fromRGB(125, 201, 102)})
						else
							Moon.tween(ti, Toggle["20"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						end
					end
				end)
			end
			
			do
				input.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Moon.tween(ti, Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
						Moon.tween(ti, Toggle["1e"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						Toggle:ChangeState()
					end
				end)

				input.InputEnded:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Moon.tween(ti, Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
							Moon.tween(ti, Toggle["1e"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						else
							Moon.tween(ti, Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Moon.tween(ti, Toggle["1e"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
						end
					end
				end)
			end
			
			return Toggle
		end
		
		function Tab.Label(options)
			options = Moon.validate({
				text = "Label"
			}, options or {})
			
			local Label = {}
			
			do
				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Info
				Label["23"] = Instance.new("Frame", Tab["14"]);
				Label["23"]["BorderSizePixel"] = 0;
				Label["23"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Label["23"]["Size"] = UDim2.new(1, 0, 0, 28);
				Label["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["23"]["Name"] = [[Info]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Info.UICorner
				Label["24"] = Instance.new("UICorner", Label["23"]);
				Label["24"]["CornerRadius"] = UDim.new(0, 7);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Info.Title
				Label["25"] = Instance.new("TextLabel", Label["23"]);
				Label["25"]["BorderSizePixel"] = 0;
				Label["25"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Label["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["25"]["TextSize"] = 14;
				Label["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Label["25"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
				Label["25"]["BackgroundTransparency"] = 1;
				Label["25"]["Size"] = UDim2.new(1, 0, 1, 0);
				Label["25"]["Position"] = UDim2.new(0, 0, 0, 1);
				Label["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["25"]["Text"] = options["text"];
				Label["25"]["Name"] = [[Title]];
				Label["25"]["TextWrapped"] = true
				Label["25"]["TextYAlignment"] = Enum.TextYAlignment.Top

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Info.Title.UIPadding
				Label["26"] = Instance.new("UIPadding", Label["25"]);
				Label["26"]["PaddingLeft"] = UDim.new(0, 24);
				Label["26"]["PaddingTop"] = UDim.new(0, 1);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Info.UIPadding
				Label["27"] = Instance.new("UIPadding", Label["23"]);
				Label["27"]["PaddingTop"] = UDim.new(0, 5);
				Label["27"]["PaddingRight"] = UDim.new(0, 5);
				Label["27"]["PaddingLeft"] = UDim.new(0, 5);
				Label["27"]["PaddingBottom"] = UDim.new(0, 5);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Info.Info
				Label["28"] = Instance.new("ImageLabel", Label["23"]);
				Label["28"]["BorderSizePixel"] = 0;
				Label["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Label["28"]["Image"] = [[rbxassetid://17594574177]];
				Label["28"]["Size"] = UDim2.new(0, 18, 0, 18);
				Label["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["28"]["BackgroundTransparency"] = 1;
				Label["28"]["Name"] = [[Info]];
				Label["28"]["Position"] = UDim2.new(0, -0, 0, -1);
			end
			
			do
				function Label.SetText(text)
					options.text = text
					Label:_update()
				end

				function Label._update()
					Label["25"].Text = options.text

					Label["25"].Size = UDim2.new(Label["25"].Size.X.Scale, Label["25"].Size.X.Offset, 0, math.huge)
					Label["25"].Size = UDim2.new(Label["25"].Size.X.Scale, Label["25"].Size.X.Offset, 0, Label["25"].TextBounds.Y)
					Moon.tween(ti, Label["23"], {Size = UDim2.new(Label["23"].Size.X.Scale, Label["23"].Size.X.Offset, 0, Label["25"].TextBounds.Y + 12)})
				end
				
				Label["23"].MouseEnter:Connect(function()
					Moon.tween(ti, Label["23"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					Moon.tween(ti, Label["25"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				end)
				
				Label["23"].MouseLeave:Connect(function()
					Moon.tween(ti, Label["23"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
					Moon.tween(ti, Label["25"], {TextColor3 = Color3.fromRGB(221, 221, 221)})
				end)

				Label._update()
			end
			
			return Label
		end
		
		function Tab.Slider(options)
			options = Moon.validate({
				name = "Preview Slider",
				min = 0,
				max = 100,
				default = (options["max"]/2),
				callback = function(v) print(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil,
				Options = options
			}
			
			do
				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider
				Slider["29"] = Instance.new("Frame", Tab["14"]);
				Slider["29"]["BorderSizePixel"] = 0;
				Slider["29"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Slider["29"]["Size"] = UDim2.new(1, 0, 0, 42);
				Slider["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["29"]["Name"] = [[Slider]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.UICorner
				Slider["2a"] = Instance.new("UICorner", Slider["29"]);
				Slider["2a"]["CornerRadius"] = UDim.new(0, 7);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.Title
				Slider["2b"] = Instance.new("TextLabel", Slider["29"]);
				Slider["2b"]["BorderSizePixel"] = 0;
				Slider["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2b"]["TextSize"] = 14;
				Slider["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider["2b"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
				Slider["2b"]["BackgroundTransparency"] = 1;
				Slider["2b"]["Size"] = UDim2.new(1, 0, 1, -10);
				Slider["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2b"]["Text"] = options["name"];
				Slider["2b"]["Name"] = [[Title]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.UIPadding
				Slider["2c"] = Instance.new("UIPadding", Slider["29"]);
				Slider["2c"]["PaddingTop"] = UDim.new(0, 5);
				Slider["2c"]["PaddingRight"] = UDim.new(0, 5);
				Slider["2c"]["PaddingLeft"] = UDim.new(0, 5);
				Slider["2c"]["PaddingBottom"] = UDim.new(0, 5);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.Value
				Slider["2d"] = Instance.new("TextLabel", Slider["29"]);
				Slider["2d"]["BorderSizePixel"] = 0;
				Slider["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["2d"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
				Slider["2d"]["BackgroundTransparency"] = 1;
				Slider["2d"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Slider["2d"]["Size"] = UDim2.new(0.04182, 0, 0.47619, 0);
				Slider["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2d"]["Text"] = tostring(options.default);
				Slider["2d"]["Name"] = [[Value]];
				Slider["2d"]["Position"] = UDim2.new(1, -1, 0.5, -3);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.Inactive
				Slider["2e"] = Instance.new("Frame", Slider["29"]);
				Slider["2e"]["BorderSizePixel"] = 0;
				Slider["2e"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
				Slider["2e"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["2e"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["2e"]["Position"] = UDim2.new(0, 0, 1, -3);
				Slider["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["2e"]["Name"] = [[Inactive]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.Inactive.UICorner
				Slider["2f"] = Instance.new("UICorner", Slider["2e"]);
				Slider["2f"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.Inactive.Frame
				Slider["30"] = Instance.new("Frame", Slider["2e"]);
				Slider["30"]["BorderSizePixel"] = 0;
				Slider["30"]["BackgroundColor3"] = Color3.fromRGB(81, 81, 81);
				Slider["30"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Slider.Inactive.Frame.UICorner
				Slider["31"] = Instance.new("UICorner", Slider["30"]);
				Slider["31"]["CornerRadius"] = UDim.new(0, 4);
			end
			
			-- Methods
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["2e"].AbsolutePosition.X) / (Slider["2e"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)

					Slider["2d"].Text = tostring(value)
					Slider["30"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["2d"].Text = tostring(v)
					Slider["30"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end

			function Slider:GetValue()
				return tonumber(Slider["2d"].Text)				
			end

			-- Logic
			do
				Slider["29"].MouseEnter:Connect(function()
					Slider.Hover = true
					Sliderdrag = true
					Moon.tween(ti, Slider["30"], {BackgroundColor3 = Color3.fromRGB(102, 102, 102)})
					Moon.tween(ti, Slider["29"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					
				end)

				Slider["29"].MouseLeave:Connect(function()
					Slider.Hover = false
					Sliderdrag = false
					if not Slider.MouseDown then
						Moon.tween(ti, Slider["30"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						Moon.tween(ti, Slider["29"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
					end
				end)

				input.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Moon.tween(ti, Slider["29"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Moon.tween(ti, Slider["30"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}, function() end)

						if not Slider.Connection then
							Slider.Connection = run.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				input.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.Hover then
							Moon.tween(ti, Slider["29"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Moon.tween(ti, Slider["30"], {BackgroundColor3 = Color3.fromRGB(102, 102, 102)})
						else
							Moon.tween(ti, Slider["29"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Moon.tween(ti, Slider["30"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						end

						if Slider.Connection then 
							Slider.Connection:Disconnect() 
						end
						Slider.Connection = nil
					end
				end)
			end
			
			return Slider
		end
		
		function Tab.Dropdown(options)
			options = Moon.validate({
				name = "Preview Dropdown",
				callback = function(v) print(v) end,
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
			
			do
				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown
				Dropdown["32"] = Instance.new("Frame", Tab["14"]);
				Dropdown["32"]["BorderSizePixel"] = 0;
				Dropdown["32"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Dropdown["32"]["ClipsDescendants"] = true;
				Dropdown["32"]["Size"] = UDim2.new(1, 0, 0, 32);
				Dropdown["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["32"]["Name"] = [[Dropdown]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.UICorner
				Dropdown["33"] = Instance.new("UICorner", Dropdown["32"]);
				Dropdown["33"]["CornerRadius"] = UDim.new(0, 7);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Title
				Dropdown["34"] = Instance.new("TextLabel", Dropdown["32"]);
				Dropdown["34"]["BorderSizePixel"] = 0;
				Dropdown["34"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["34"]["TextSize"] = 14;
				Dropdown["34"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown["34"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
				Dropdown["34"]["BackgroundTransparency"] = 1;
				Dropdown["34"]["Size"] = UDim2.new(1, 0, 0, 20);
				Dropdown["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["34"]["Text"] = options["name"];
				Dropdown["34"]["Name"] = [[Title]];

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.UIPadding
				Dropdown["35"] = Instance.new("UIPadding", Dropdown["32"]);
				Dropdown["35"]["PaddingTop"] = UDim.new(0, 5);
				Dropdown["35"]["PaddingRight"] = UDim.new(0, 5);
				Dropdown["35"]["PaddingLeft"] = UDim.new(0, 5);
				Dropdown["35"]["PaddingBottom"] = UDim.new(0, 5);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Icon
				Dropdown["36"] = Instance.new("ImageLabel", Dropdown["32"]);
				Dropdown["36"]["BorderSizePixel"] = 0;
				Dropdown["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["36"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["36"]["Image"] = [[rbxassetid://17633995554]];
				Dropdown["36"]["Size"] = UDim2.new(0, 20, 0, 20);
				Dropdown["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["36"]["BackgroundTransparency"] = 1;
				Dropdown["36"]["Name"] = [[Icon]];
				Dropdown["36"]["Position"] = UDim2.new(1, -1, 0, 0);

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Options
				Dropdown["37"] = Instance.new("ScrollingFrame", Dropdown["32"]);
				Dropdown["37"]["Visible"] = false;
				Dropdown["37"]["BorderSizePixel"] = 0;
				Dropdown["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["37"]["Name"] = [[Options]];
				Dropdown["37"]["Selectable"] = false;
				Dropdown["37"]["Size"] = UDim2.new(1, 0, 1, -26);
				Dropdown["37"]["Position"] = UDim2.new(0, 0, 0, 26);
				Dropdown["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["37"]["ScrollBarThickness"] = 0;
				Dropdown["37"]["BackgroundTransparency"] = 1;
				Dropdown["37"]["SelectionGroup"] = false;

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Options.UIListLayout
				Dropdown["38"] = Instance.new("UIListLayout", Dropdown["37"]);
				Dropdown["38"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
				Dropdown["38"]["Padding"] = UDim.new(0, 8);
				Dropdown["38"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

				-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Options.UIPadding
				Dropdown["39"] = Instance.new("UIPadding", Dropdown["37"]);
				Dropdown["39"]["PaddingTop"] = UDim.new(0, 1);
				Dropdown["39"]["PaddingRight"] = UDim.new(0, 1);
				Dropdown["39"]["PaddingLeft"] = UDim.new(0, 1);
				Dropdown["39"]["PaddingBottom"] = UDim.new(0, 1);
			end
			
			do
				function Dropdown.Add(id, value, call, options)
					options = Moon.validate({
						callback = function(call) print(call) end,
						items = {}
					}, options or {})
					
					local Item = {
						Hover = false,
						MouseDown = false
					}

					if Dropdown.Items[id] ~= nil then
						return
					end

					Dropdown.Items[id] = {
						instance = {},
						value = value,
						call = value
					}
					
					do
						-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Options.Inactive
						Dropdown.Items[id].instance["3a"] = Instance.new("TextLabel", Dropdown["37"]);
						Dropdown.Items[id].instance["3a"]["BorderSizePixel"] = 0;
						Dropdown.Items[id].instance["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
						Dropdown.Items[id].instance["3a"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
						Dropdown.Items[id].instance["3a"]["TextSize"] = 14;
						Dropdown.Items[id].instance["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						Dropdown.Items[id].instance["3a"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
						Dropdown.Items[id].instance["3a"]["Size"] = UDim2.new(1, 0, 0, 30);
						Dropdown.Items[id].instance["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
						Dropdown.Items[id].instance["3a"]["Text"] = id;
						Dropdown.Items[id].instance["3a"]["Name"] = [[Inactive]];

						-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Items[id].instance.Options.Inactive.UICorner
						Dropdown.Items[id].instance["3b"] = Instance.new("UICorner", Dropdown.Items[id].instance["3a"]);
						Dropdown.Items[id].instance["3b"]["CornerRadius"] = UDim.new(0, 6);

						-- StarterGui.Moon.Main.TabContainer.TabWrapper.Dropdown.Items[id].instance.Options.Inactive.UIPadding
						Dropdown.Items[id].instance["3c"] = Instance.new("UIPadding", Dropdown.Items[id].instance["3a"]);
						Dropdown.Items[id].instance["3c"]["PaddingLeft"] = UDim.new(0, 7);
					end

					Dropdown.Items[id].instance["3a"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true
						
						Moon.tween(ti, Dropdown.Items[id].instance["3a"], {BackgroundColor3 = Color3.fromRGB(62, 62, 62)})
					end)

					Dropdown.Items[id].instance["3a"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false

						if not Item.MouseDown then
							Moon.tween(ti, Dropdown.Items[id].instance["3a"], {BackgroundColor3 = Color3.fromRGB(58, 58, 58)})
						end
					end)
					
					input.InputBegan:Connect(function(input)

						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Item.Hover then
							Item.MouseDown = true
							Moon.tween(ti, Dropdown.Items[id].instance["3a"], {BackgroundColor3 = Color3.fromRGB(62, 62, 62)})
							Dropdown:Toggle()
							options.callback(value)
						end
					end)

					input.InputEnded:Connect(function(input)

						if Dropdown.Items[id] == nil then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Item.MouseDown = false

							if Item.Hover then
								Moon.tween(ti, Dropdown.Items[id].instance["3a"], {BackgroundColor3 = Color3.fromRGB(62, 62, 62)})
							else
								Moon.tween(ti, Dropdown.Items[id].instance["3a"], {BackgroundColor3 = Color3.fromRGB(58, 58, 58)})
							end
						end
					end)
				end

				function Dropdown.Remove(id)
					if Dropdown.Items[id] ~= nil then
						if Dropdown.Items[id].instance ~= nil then
							for i, v in pairs(Dropdown.Items[id].instance) do
								v:Destroy()
							end
						end
						Dropdown.Items[id] = nil
					end
				end

				function Dropdown.Clear()
					for i, v in pairs(Dropdown.Items) do
						Dropdown:Remove(i)
					end
				end

				function Dropdown.Toggle()
					Dropdown.Open = not Dropdown.Open

					if not Dropdown.Open then
						Moon.tween(ti, Dropdown["32"], {Size = UDim2.new(1, 0, 0, 30)}, function()
							Dropdown["37"].Visible = false
						end)
					else
						local count = 0
						for i, v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end

						Dropdown["37"].Visible = true
						Moon.tween(ti, Dropdown["32"], {Size = UDim2.new(1, 0, 0, 30 + (count * 25) + 3)})
					end
				end
			end

			-- Logic
			do
				Dropdown["32"].MouseEnter:Connect(function()
					Dropdown.Hover = true
					
					if not Dropdown.Open then
						Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					else
						Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
					end
				end)

				Dropdown["32"].MouseLeave:Connect(function()
					Dropdown.Hover = false

					if not Dropdown.MouseDown then
						Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
					end
				end)

				input.InputBegan:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						if not Dropdown.Open then
							Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(74, 74, 74)})
							wait(0.1)
							Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						else
							Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						end
						
						if not Dropdown.HoveringItem then
							Dropdown.Toggle()
						end
					end
				end)

				input.InputEnded:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false

						if Dropdown.Hover and not Dropdown.Open then
							Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
						elseif not Dropdown and not Dropdown.Open then
							Moon.tween(ti, Dropdown["32"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						elseif Dropdown.Open then
							Dropdown["32"].BackgroundColor3 = Color3.fromRGB(48, 48, 48)
						end
					end
				end)
			end
					
			local items = options.items
					
		return Dropdown
		end
	return Tab
	end
	
	Moon.makeDraggable(lib["2"], true)
	
	-- close anim
	do
		local done = false
		
		lib["12"].MouseEnter:Connect(function()
			lib.Close = true
		end)
		
		lib["12"].MouseLeave:Connect(function()
			lib.Close = false
		end)
		
		input.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and lib.Close then
				for i, v in lib["2"]:GetDescendants() do
					if v:IsA("Frame") then
						Moon.tween(ti,v, {BackgroundTransparency = 1}, function() v.Visible = false end)
					end
					if v:IsA("TextLabel") then
						Moon.tween(ti,v, {BackgroundTransparency = 1})
						Moon.tween(ti,v, {TextTransparency = 1}, function() v.Visible = false end)
					end
					if v:IsA("ImageLabel") then
						Moon.tween(ti, v, {BackgroundTransparency = 1})
						Moon.tween(ti, v, {ImageTransparency = 1}, function() 
							v.Visible = false 
							Moon.tween(tis, lib["2"], {Size = UDim2.new(0, 0, 0, 0)}, function() wait(1.2) done = true end)
						end)
					elseif v.Name == "Shadow" then

						if done == true then
							lib["1"].Enabled = false
							lib.Close = false
						end
					end	
				end
			end
		end)
		
		input.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.RightControl and lib.Close == false then
				lib["1"].Enabled = true
				lib.Close = true
				Moon.tween(tis, lib["2"], {Size = UDim2.new(0, 480, 0, 330)})
				wait(0.8)
				for i, v in lib["2"]:GetDescendants() do
					if v.Name == "TabContainer" then
						v.Visible = true
						for i, c in v:GetDescendants() do
							if c.Name == "TabWrapper" then
								c.Visible = true
							end
							if c:IsA("Frame") then
								c.Visible = true
								Moon.tween(ti, c, {BackgroundTransparency = 0})
							elseif c:IsA("ScrollingFrame") and c.Name == "Options" then
								c.Visible = true
								for i, o in c:GetDescendants() do
									if o:IsA("TextLabel") then
										o.BackgroundTransparency = 0
									end
								end
							end
							if c:IsA("TextLabel") then
								c.Visible = true
								Moon.tween(ti, c, {TextTransparency = 0})
							end
							if c:IsA("ImageLabel") and c.Name ~= "Checkmark" then
								c.Visible = true
								Moon.tween(ti, c, {ImageTransparency = 0})
							end
						end
					
					elseif v.Name == "Nav" then
						v.Visible = true
						for i, d in v:GetDescendants() do
							if d.Name == "Close" then
								d.Visible = true
								Moon.tween(ti, d, {ImageTransparency = 0})
							end
							if d:IsA("TextLabel") and d.Name ~= "Tab" then
								d.Visible = true
								Moon.tween(ti, d, {BackgroundTransparency = 0})
								Moon.tween(ti, d, {TextTransparency = 0})
							elseif d:IsA("TextLabel") and d.Name == "Tab" then
								Moon.tween(ti, d, {TextTransparency = 0})
							end
							if d:IsA("ImageLabel") then
								d.Visible = true
								Moon.tween(ti, d, {ImageTransparency = 0})
							end
						end
					end
				end
			end
		end)
	end

	Notify({
title = "Moon UI",
desc = "Made By @helloworld26445 aka Zephy"
		})
	
	return lib
end
return Moon
