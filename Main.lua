local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")
local lp = players.LocalPlayer
local mouse = lp:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local tweenInfoSlow = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local Moon = {}

function Moon:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Moon:tween(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Moon:tweenSlow(object, goal, callback)
	local tween = tweenService:Create(object, tweenInfoSlow, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Init()

	local GUI = {
		CurrentTab = nil,
		CloseHover = false,
		UiClosed = false
	}

	do
		
		-- StarterGui.Moon
		GUI["1"] = Instance.new("ScreenGui", runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui") or coreGui);
		GUI["1"]["IgnoreGuiInset"] = true;
		GUI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
		GUI["1"]["Name"] = [[Moon]];

		-- StarterGui.Moon.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(35, 35, 35);
		GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["2"]["Size"] = UDim2.new(0, 480, 0, 330);
		GUI["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.Moon.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);

		-- StarterGui.Moon.Main.Shadow
		GUI["4"] = Instance.new("ImageLabel", GUI["2"]);
		GUI["4"]["ZIndex"] = -1;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["SliceCenter"] = Rect.new(100, 100, 400, 400);
		GUI["4"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["4"]["ImageTransparency"] = 0.2;
		GUI["4"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["4"]["Image"] = [[rbxassetid://11162370676]];
		GUI["4"]["Size"] = UDim2.new(1.3, 0, 1.3, 0);
		GUI["4"]["BackgroundTransparency"] = 1;
		GUI["4"]["Name"] = [[Shadow]];
		GUI["4"]["Position"] = UDim2.new(0.5, 0, 0.48485, 5);

		-- StarterGui.Moon.Main.UIPadding
		GUI["5"] = Instance.new("UIPadding", GUI["2"]);
		GUI["5"]["PaddingTop"] = UDim.new(0, 5);
		GUI["5"]["PaddingRight"] = UDim.new(0, 5);
		GUI["5"]["PaddingLeft"] = UDim.new(0, 5);
		GUI["5"]["PaddingBottom"] = UDim.new(0, 5);

		-- StarterGui.Moon.Main.UIStroke
		GUI["6"] = Instance.new("UIStroke", GUI["2"]);
		GUI["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		GUI["6"]["Color"] = Color3.fromRGB(55, 55, 55);

		-- StarterGui.Moon.Main.Nav
		GUI["7"] = Instance.new("Frame", GUI["2"]);
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(1, 0, 0, 25);
		GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["7"]["Name"] = [[Nav]];
		GUI["7"]["BackgroundTransparency"] = 1;

		-- StarterGui.Moon.Main.Nav.Wrapper
		GUI["8"] = Instance.new("ScrollingFrame", GUI["7"]);
		GUI["8"]["Active"] = true;
		GUI["8"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["8"]["Name"] = [[Wrapper]];
		GUI["8"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["8"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["ScrollBarThickness"] = 0;
		GUI["8"]["BackgroundTransparency"] = 1;

		-- StarterGui.Moon.Main.Nav.Wrapper.UIListLayout
		GUI["11"] = Instance.new("UIListLayout", GUI["8"]);
		GUI["11"]["Padding"] = UDim.new(0, 6);
		GUI["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		GUI["11"]["FillDirection"] = Enum.FillDirection.Horizontal;

		-- StarterGui.Moon.Main.Nav.Close
		GUI["12"] = Instance.new("ImageLabel", GUI["7"]);
		GUI["12"]["BorderSizePixel"] = 0;
		GUI["12"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["12"]["Image"] = [[http://www.roblox.com/asset/?id=6031094678]];
		GUI["12"]["Size"] = UDim2.new(0, 20, 0, 20);
		GUI["12"]["BackgroundTransparency"] = 1;
		GUI["12"]["Name"] = [[Close]];
		GUI["12"]["Position"] = UDim2.new(1, -1, 0.5, 0);
		GUI["12"]["ImageColor3"] = Color3.fromRGB(220, 220, 220);

		-- StarterGui.Moon.Main.TabContainer
		GUI["13"] = Instance.new("Frame", GUI["2"]);
		GUI["13"]["BorderSizePixel"] = 0;
		GUI["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["13"]["Size"] = UDim2.new(1, 0, 1, -40);
		GUI["13"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["13"]["Name"] = [[TabContainer]];
		GUI["13"]["BackgroundTransparency"] = 1;
	end

	function GUI:Tab(options)
		options = Moon:validate({
			name = "Moon Ui",
			icon = "rbxassetid://17594347148"
		}, options or {})

		local Tab = {
			Hover = false,
			Active = false
		}

		-- Render
		do
			-- StarterGui.Moon.Main.Nav.Wrapper.Tab
			Tab["d"] = Instance.new("TextLabel", GUI["8"]);
			Tab["d"]["BorderSizePixel"] = 0;
			Tab["d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["d"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
			Tab["d"]["TextSize"] = 14;
			Tab["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["d"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
			Tab["d"]["BackgroundTransparency"] = 1;
			Tab["d"]["Size"] = UDim2.new(0, 100, 0.5, 0);
			Tab["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["d"]["Text"] = options["name"];
			Tab["d"]["Name"] = [[Tab]];

			-- StarterGui.Moon.Main.Nav.Wrapper.Tab.UICorner
			Tab["e"] = Instance.new("UICorner", Tab["d"]);
			Tab["e"]["CornerRadius"] = UDim.new(0, 7);

			-- StarterGui.Moon.Main.Nav.Wrapper.Tab.UIPadding
			Tab["f"] = Instance.new("UIPadding", Tab["d"]);
			Tab["f"]["PaddingLeft"] = UDim.new(0, 24);

			-- StarterGui.Moon.Main.Nav.Wrapper.Tab.Icon
			Tab["10"] = Instance.new("ImageLabel", Tab["d"]);
			Tab["10"]["BorderSizePixel"] = 0;
			Tab["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["10"]["Image"] = options["icon"];
			Tab["10"]["Size"] = UDim2.new(0, 16, 0, 16);
			Tab["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["10"]["BackgroundTransparency"] = 1;
			Tab["10"]["Name"] = options["icon"];
			Tab["10"]["Position"] = UDim2.new(0, -20, 0, 4);

			-- StarterGui.Moon.Main.TabContainer.TabWrapper
			Tab["14"] = Instance.new("ScrollingFrame", GUI["13"]);
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

			-- StarterGui.Moon.Main.TabContainer.TabWrapper.UIPadding
			Tab["1a"] = Instance.new("UIPadding", Tab["14"]);
			Tab["1a"]["PaddingTop"] = UDim.new(0, 6);
			Tab["1a"]["PaddingRight"] = UDim.new(0, 1);
			Tab["1a"]["PaddingLeft"] = UDim.new(0, 1);
			Tab["1a"]["PaddingBottom"] = UDim.new(0, 1);

			-- StarterGui.Moon.Main.TabContainer.TabWrapper.UIListLayout
			Tab["1b"] = Instance.new("UIListLayout", Tab["14"]);
			Tab["1b"]["Padding"] = UDim.new(0, 6);
			Tab["1b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end

		-- Methods
		do
			function Tab:Activate()
				if not Tab.Active then
					if GUI.CurrentTab ~= nil then
						GUI.CurrentTab:Deactivate()
					end

					Tab.Active = true
					Moon:tween(Tab["d"], {BackgroundTransparency = .8})
					Moon:tween(Tab["d"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					Moon:tween(Tab["10"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
					Tab["14"].Visible = true

					GUI.CurrentTab = Tab
				end
			end

			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Moon:tween(Tab["d"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
					Moon:tween(Tab["10"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
					Moon:tween(Tab["d"], {BackgroundTransparency = 1})
					Tab["14"].Visible = false
				end
			end

			-- Logic
			do
				Tab["d"].MouseEnter:Connect(function()
					Tab.Hover = true

					if not Tab.Active then
						Moon:tween(Tab["d"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						Moon:tween(Tab["10"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
					end
				end)

				Tab["d"].MouseLeave:Connect(function()
					Tab.Hover = false

					if not Tab.Active then
						Moon:tween(Tab["d"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
						Moon:tween(Tab["10"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
					end
				end)

				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Tab.Hover then
							Tab:Activate()
						end
					end
				end)

				if GUI.CurrentTab == nil then
					Tab:Activate()
				end
			end
		end

		function Tab:Button(options)
			options = Moon:validate({
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
				Button["17"]["BackgroundColor3"] = Color3.fromRGB(220, 220, 220);
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

			-- methods
			do
				
				function Button:SetCallback(fn)
					options.callback = fn
				end
				
				Button["15"].MouseEnter:Connect(function()
					Button.Hover = true

					Moon:tween(Button["15"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					Moon:tween(Button["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				end)

				Button["15"].MouseLeave:Connect(function()
					Button.Hover = false

					if not Button.MouseDown then
						Moon:tween(Button["15"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						Moon:tween(Button["17"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
					end
				end)
				
			end

			-- logic
			do
				uis.InputBegan:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Moon:tween(Button["15"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
						Moon:tween(Button["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						options.callback()
					end
				end)


				uis.InputEnded:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false

						if Button.Hover then
							Moon:tween(Button["15"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
							Moon:tween(Button["17"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						else
							Moon:tween(Button["15"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Moon:tween(Button["17"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
						end
					end
				end)
			end	

			return Button

		end
		
		function Tab:Toggle(options)
			options = Moon:validate({
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
						Moon:tween(Toggle["20"], {BackgroundColor3 = Color3.fromRGB(115, 191, 92)})
						Moon:tween(Toggle["22"], {ImageTransparency = 0})
					else
						Moon:tween(Toggle["20"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
						Moon:tween(Toggle["22"], {ImageTransparency = 1})
					end
					
					options.callback(Toggle.State)
				end
				
				Toggle["1c"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Moon:tween(Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
					Moon:tween(Toggle["1e"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
					if Toggle.State == true then
						Moon:tween(Toggle["20"], {BackgroundColor3 = Color3.fromRGB(125, 201, 102)})
					else
						Moon:tween(Toggle["20"], {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
					end
				end)

				Toggle["1c"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Moon:tween(Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
						Moon:tween(Toggle["1e"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
						if Toggle.State == true then
							Moon:tween(Toggle["20"], {BackgroundColor3 = Color3.fromRGB(125, 201, 102)})
						else
							Moon:tween(Toggle["20"], {BackgroundColor3 = Color3.fromRGB(45, 45, 45)})
						end
					end
				end)
			end
			
			do
				uis.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Moon:tween(Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
						Moon:tween(Toggle["1e"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						Toggle:ChangeState()
					end
				end)
				
				uis.InputEnded:Connect(function(input)

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Moon:tween(Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(68, 68, 68)})
							Moon:tween(Toggle["1e"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
						else
							Moon:tween(Toggle["1c"], {BackgroundColor3 = Color3.fromRGB(48, 48, 48)})
							Moon:tween(Toggle["1e"], {TextColor3 = Color3.fromRGB(220, 220, 220)})
						end
					end
				end)
			end
			return Toggle
		end
		
		function Tab:Label(options)
			options = Moon:validate({
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
				Label["28"]["Size"] = UDim2.new(0, 20, 0, 20);
				Label["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Label["28"]["BackgroundTransparency"] = 1;
				Label["28"]["Name"] = [[Info]];
				Label["28"]["Position"] = UDim2.new(0, 0, 0, -2.5);
			end
			
			do
				function Label:SetText(text)
					options.text = text
					Label:_update()
				end

				function Label:_update()
					Label["25"].Text = options.text

					Label["25"].Size = UDim2.new(Label["25"].Size.X.Scale, Label["25"].Size.X.Offset, 0, math.huge)
					Label["25"].Size = UDim2.new(Label["25"].Size.X.Scale, Label["25"].Size.X.Offset, 0, Label["25"].TextBounds.Y)
					Moon:tween(Label["23"], {Size = UDim2.new(Label["23"].Size.X.Scale, Label["23"].Size.X.Offset, 0, Label["25"].TextBounds.Y + 12)})
				end
				
				Label:_update()
			end
			return Label
		end
		
		return Tab
	end
	
	do
		function GUI:drag(frame, parent)
			parent = parent or frame

			-- stolen from kavo
			local dragging = false
			local dragInput, mousePos, framePos

			frame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					mousePos = input.Position
					framePos = parent.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)

			frame.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					dragInput = input
				end
			end)

			uis.InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					local delta = input.Position - mousePos
					parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
				end
			end)
		end;
		
		GUI:drag(GUI["4"], GUI["2"])
	end
	
	do
		GUI["12"].MouseEnter:Connect(function()
			GUI.CloseHover = true
			
			GUI["12"].ImageColor3 = Color3.fromRGB(255, 255, 255)
		end)
		
		GUI["12"].MouseLeave:Connect(function()
			GUI.CloseHover = false

			GUI["12"].ImageColor3 = Color3.fromRGB(220, 220, 220)
		end)
		
		do
			uis.InputBegan:Connect(function(input)
				local done = false
				
				if GUI.CloseHover == true then
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						for i, v in GUI["2"]:GetDescendants() do
							if v:IsA("Frame") then
								Moon:tween(v, {BackgroundTransparency = 1}, function() v.Visible = false end)
							end
							if v:IsA("TextLabel") then
								Moon:tween(v, {BackgroundTransparency = 1})
								Moon:tween(v, {TextTransparency = 1}, function() v.Visible = false end)
							end
							if v:IsA("ImageLabel") then
								Moon:tween(v, {BackgroundTransparency = 1})
								Moon:tween(v, {ImageTransparency = 1}, function() 
									v.Visible = false 
									Moon:tweenSlow(GUI["2"], {Size = UDim2.new(0, 0, 0, 0)}, function() wait(1.2) done = true end)
								end)
							elseif v.Name == "Shadow" then
								
								if done == true then
									GUI["1"]:Destroy()
								end
							end	
						end
					end
				end
			end)
		end
	end
	
	return GUI
endplayers.LocalPlayer
