local App = {}

local UserInputService = game:GetService("UserInputService")
local OverLay = Instance.new("ScreenGui")
OverLay.Parent = game.CoreGui
OverLay.Name="Overlay-v1"
spawn(function()
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")

--Properties:

Frame.Parent = OverLay
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0, 93, 0, 29)
Frame.BackgroundTransparency=0.4
Frame.Position = UDim2.new(0.055, 0, -0.0323, 0)
Frame.MouseEnter:Connect(function()
	Frame.BackgroundTransparency=0.9
	TextLabel.TextTransparency=0.9
end)
Frame.MouseLeave:Connect(function()
	Frame.BackgroundTransparency=0.4
	TextLabel.TextTransparency=0
end)
UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 93, 0, 29)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "rosebud"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

spawn(function()
local Frame = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local UserInputService = game:GetService("UserInputService")

Frame.Parent = OverLay
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BackgroundTransparency = 1.000
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.92, 0, 0.88, 0)
Frame.Size = UDim2.new(0, 150, 0, 113)
Frame.Active = true
Frame.Draggable = true
UIGridLayout.Parent = Frame
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 40, 0, 45)

function CreateKey(key)
local Frame_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local Key = key
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame_2.Size = UDim2.new(0, 100, 0, 100)
UICorner.Parent = Frame_2


TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 40, 0, 45)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = key
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
	UserInputService.InputBegan:Connect(function(Input, GPE)
		if not GPE then
			if Input.KeyCode == Enum.KeyCode[Key] then
				game.TweenService:Create(Frame_2, TweenInfo.new(.2), {
					BackgroundColor3 = Color3.fromRGB(68, 68, 68)
				}):Play()
				end
			end
	end)
	UserInputService.InputEnded:Connect(function(Input, GPE)
		if not GPE then
			if Input.KeyCode == Enum.KeyCode[Key] then
				game.TweenService:Create(Frame_2, TweenInfo.new(.2), {
					BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				}):Play()
			end
		end
	end)
end

function initiate(keys)
	for i,key in pairs(keys) do
		CreateKey(key)
	end
end
initiate({'Q','W', 'E','A','S','D'})
end)
end)

local Frame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

Frame.Parent = OverLay
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BackgroundTransparency = 1.000
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.7, 0, 0.0, 0)
Frame.Size = UDim2.new(0, 393, 0, 371)

UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

function create_label(name)
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.201017812, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 314, 0, 16)
TextLabel.Font = Enum.Font.Gotham
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Right
TextLabel.Text = name
TextLabel.Visible=false

local label_control = {}

function label_control:Update(new)
TextLabel.Text = new
end
function label_control:Erase()
TextLabel.Visible=false
end
function label_control:Show()
TextLabel.Visible=true
end

return label_control
end
do
local a = create_label'rosebud private'
a:Show()
end
--

function Round(Object, CornerRadius)
	local UICorner = Instance.new("UICorner")
	UICorner.Parent = Object
	UICorner.Name = "UICorner"
	UICorner.CornerRadius = CornerRadius
end

function Dragify(Obj)
	local Drag = Obj

	local gsCoreGui = game:GetService("CoreGui")
	local gsTween = game:GetService("TweenService")

	local Dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		local dragTime = 0.04
		local SmoothDrag = {}
		SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
		dragSmoothFunction:Play()
	end

	Drag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			dragStart = input.Position
			startPos = Drag.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	Drag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and Dragging and Drag.Size then
			update(input)
		end
	end)
end

function createGui(settings)
	local Gui = Instance.new("ScreenGui")
	Gui.Parent = game.CoreGui
	Gui.Name = settings.Name or "Lib"

	local Drag = Instance.new("Frame")
	Drag.Parent = Gui
	Drag.Name = "Drag"
	Drag.BackgroundTransparency = 1
	Drag.Size = UDim2.new(0, 500, 0, 50)
	Drag.Position = UDim2.new(.5, 0, .275, 0)
	Drag.AnchorPoint = Vector2.new(.5, .3)
	local Using=true
	UserInputService.InputBegan:Connect(function(Input, GPE)
		if not GPE then
			if Input.KeyCode == Enum.KeyCode['Home'] then
				if Using then
					Drag.Visible=false
					for i,v in pairs(OverLay:GetChildren()) do
						v.Visible=false
					end
				else
					Drag.Visible=true
					for i,v in pairs(OverLay:GetChildren()) do
						v.Visible=true
					end
				end
				Using = not Using
				end
			end
	end)
	local Holder = Instance.new("Frame")
	Holder.Parent = Drag
	Holder.Name = "Holder"
	Holder.Size = UDim2.new(0, 500, 0, 400)
	Holder.BorderSizePixel = 0
	Holder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Holder.ClipsDescendants = true

	Round(Holder, UDim.new(0, 3))

	local Topbar = Instance.new("Frame")
	Topbar.Parent = Holder
	Topbar.Name = "Topbar"
	Topbar.Size = UDim2.new(1, 0, 0, 50)
	Topbar.BorderSizePixel = 0
	Topbar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Topbar.ClipsDescendants = true

	Round(Topbar, UDim.new(0, 3))

	local Sidebar = Instance.new("Frame")
	Sidebar.Parent = Holder
	Sidebar.Name = "Sidebar"
	Sidebar.Size = UDim2.new(0, 50, 1, -50)
	Sidebar.Position = UDim2.new(0, 0, 0, 50)
	Sidebar.BorderSizePixel = 0
	Sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Sidebar.ClipsDescendants = true

	Round(Sidebar, UDim.new(0, 3))

	local Pages = Instance.new("Frame")
	Pages.Parent = Holder
	Pages.Name = "Pages"
	Pages.Size = UDim2.new(0, 440, 0, 340)
	Pages.Position = UDim2.new(0, 55, 0, 55)
	Pages.BackgroundTransparency = 1

	local Buttons = Instance.new("Frame")
	Buttons.Parent = Topbar
	Buttons.Name = "Buttons"
	Buttons.Size = UDim2.new(0, 84, 1, 0)
	Buttons.BackgroundTransparency = 1

	--

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = Buttons
	UIListLayout.Name = "UIListLayout"
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.Padding = UDim.new(0, 6)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = Sidebar
	UIListLayout.Name = "UIListLayout"
	UIListLayout.FillDirection = Enum.FillDirection.Vertical
	UIListLayout.Padding = UDim.new(0, 0)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	--

	local Red = Instance.new("TextButton")
	Red.Parent = Buttons
	Red.Name = "Red"
	Red.BorderSizePixel = 0
	Red.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
	Red.TextTransparency = 1
	Red.Size = UDim2.new(0, 10, 0, 10)
	Red.AutoButtonColor = false
	Red.LayoutOrder = 0

	Round(Red, UDim.new(1, 0))

	local Orange = Instance.new("TextButton")
	Orange.Parent = Buttons
	Orange.Name = "Orange"
	Orange.BorderSizePixel = 0
	Orange.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
	Orange.TextTransparency = 1
	Orange.Size = UDim2.new(0, 10, 0, 10)
	Orange.AutoButtonColor = false
	Orange.LayoutOrder = 2

	Round(Orange, UDim.new(1, 0))

	local Green = Instance.new("TextButton")
	Green.Parent = Buttons
	Green.Name = "Green"
	Green.BorderSizePixel = 0
	Green.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
	Green.TextTransparency = 1
	Green.Size = UDim2.new(0, 10, 0, 10)
	Green.AutoButtonColor = false
	Green.LayoutOrder = 3

	Round(Green, UDim.new(1, 0))

	local Frame = Instance.new("Frame")
	Frame.Parent = Buttons
	Frame.Name = "Frame"
	Frame.Size = UDim2.new(0, 1, .1, 0)
	Frame.BorderSizePixel = 0
	Frame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Frame.LayoutOrder = 1

	--

	local Darken = Instance.new("Frame")
	Darken.Parent = Orange
	Darken.Name = "Darken"
	Darken.Size = UDim2.new(1, 0, 1, 0)
	Darken.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Darken.BorderSizePixel = 0
	Darken.BackgroundTransparency = 1

	Round(Darken, UDim.new(1, 0))

	local Darken = Instance.new("Frame")
	Darken.Parent = Green
	Darken.Name = "Darken"
	Darken.Size = UDim2.new(1, 0, 1, 0)
	Darken.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Darken.BorderSizePixel = 0
	Darken.BackgroundTransparency = .8

	Round(Darken, UDim.new(1, 0))

	--

	local Debounce = false
	local Minimized = false

	Red.MouseButton1Click:Connect(function()
		if Debounce then return end
		Debounce = true

		if not Minimized then
			game.TweenService:Create(Holder, TweenInfo.new(.3), {
				Size = UDim2.new(0, 500, 0, 50)
			}):Play()

			wait(.3)

			game.TweenService:Create(Holder, TweenInfo.new(.3), {
				Size = UDim2.new(0, 0, 0, 50)
			}):Play()

			wait(.3)

			Drag:Destroy()
			Debounce = false
		else
			game.TweenService:Create(Holder, TweenInfo.new(.3), {
				Size = UDim2.new(0, 0, 0, 50)
			}):Play()

			wait(.3)

			Drag:Destroy()
			Debounce = false
		end
	end)

	Orange.MouseButton1Click:Connect(function()
		if Debounce or Minimized then return end
		Debounce = true

		game.TweenService:Create(Holder, TweenInfo.new(.3), {
			Size = UDim2.new(0, 500, 0, 50)
		}):Play()

		game.TweenService:Create(Orange.Darken, TweenInfo.new(.6), {
			BackgroundTransparency = .8
		}):Play()

		game.TweenService:Create(Green.Darken, TweenInfo.new(.6), {
			BackgroundTransparency = 1
		}):Play()

		wait(.3)

		game.TweenService:Create(Holder, TweenInfo.new(.3), {
			Size = UDim2.new(0, 84, 0, 50)
		}):Play()

		wait(.3)

		Debounce = false
		Minimized = true
	end)

	Green.MouseButton1Click:Connect(function()
		if Debounce or not Minimized then return end
		Debounce = true

		game.TweenService:Create(Holder, TweenInfo.new(.3), {
			Size = UDim2.new(0, 500, 0, 50)
		}):Play()

		game.TweenService:Create(Orange.Darken, TweenInfo.new(.6), {
			BackgroundTransparency = 1
		}):Play()

		game.TweenService:Create(Green.Darken, TweenInfo.new(.6), {
			BackgroundTransparency = .8
		}):Play()

		wait(.3)

		game.TweenService:Create(Holder, TweenInfo.new(.3), {
			Size = UDim2.new(0, 500, 0, 400)
		}):Play()

		wait(.3)

		Debounce = false
		Minimized = false
	end)

	--

	return Gui, {
		Sidebar = Sidebar,
		Pages = Pages
	}
end

--

function App.Load(settings)
	local Gui, Impo = createGui(settings)

	local Functions = {}

	--

	local Debounce = false
	local Selected = false

	function Functions.New(settings)
		local Functions = {}

		--

		local S_Frame = Instance.new("Frame")
		S_Frame.Parent = Impo.Sidebar
		S_Frame.Name = settings.Name or #Impo.Sidebar:GetChildren() - 2
		S_Frame.Size = UDim2.new(1, 0, 0, 50)
		S_Frame.BackgroundTransparency = 1

		local Image = Instance.new("ImageLabel")
		Image.Parent = S_Frame
		Image.Name = "Icon"
		Image.BorderSizePixel = 0
		Image.Position = UDim2.new(.5, 0, .5, 0)
		Image.AnchorPoint = Vector2.new(.5, .5)
		Image.BackgroundTransparency = 1
		Image.ZIndex = 2
		Image.ImageColor3 = Color3.fromRGB(70, 70, 70)

		local Button = Instance.new("TextButton")
		Button.Parent = S_Frame
		Button.Name = "Button"
		Button.TextTransparency = 1
		Button.BackgroundTransparency = 1
		Button.Size = UDim2.new(1, 0, 1, 0)

		local Indicator = Instance.new("Frame")
		Indicator.Parent = S_Frame
		Indicator.Name = "Indicator"
		Indicator.BorderSizePixel = 0
		Indicator.Size = UDim2.new(0, 0, 0, 0)
		Indicator.AnchorPoint = Vector2.new(.5, .5)
		Indicator.Position = UDim2.new(.5, 0, .5, 0)
		Indicator.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

		Round(Indicator, UDim.new(1, 0))

		local P_Frame = Instance.new("ScrollingFrame")
		P_Frame.Parent = Impo.Pages
		P_Frame.Name = S_Frame.Name
		P_Frame.BackgroundTransparency = 1
		P_Frame.Size = UDim2.new(0, 0, 0, Impo.Pages.AbsoluteSize.Y)
		P_Frame.BorderSizePixel = 0
		P_Frame.ClipsDescendants = true
		P_Frame.ScrollBarImageTransparency = 1
		P_Frame.ScrollBarThickness = 0

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = P_Frame
		UIListLayout.Name = "UIListLayout"
		UIListLayout.FillDirection = Enum.FillDirection.Vertical
		UIListLayout.Padding = UDim.new(0, 5)
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		P_Frame.ChildAdded:Connect(function(v)
			if v:IsA("Frame") or v:IsA("TextLabel") then
				v.Changed:Connect(function(c)
					if not c == "Size" then return end

					local Size = 0

					for _,v in pairs(P_Frame:GetChildren()) do
						if v:IsA("Frame") or v:IsA("TextLabel") then
							wait(0)
							Size = Size + (v.Size.Y.Offset + 5)
						end
					end

					P_Frame.CanvasSize = UDim2.new(0, 0, 0, Size - 5)
				end)
			end

			local Size = 0

			for _,v in pairs(P_Frame:GetChildren()) do
				if v:IsA("Frame") or v:IsA("TextLabel") then
					wait(0)
					Size = Size + (v.Size.Y.Offset + 5)
				end
			end

			P_Frame.CanvasSize = UDim2.new(0, 0, 0, Size - 5)
		end)

		--

		if settings.Active then
			if settings.Active == true then
				Image.ImageColor3 = Color3.fromRGB(255, 255, 255)

				Selected = S_Frame

				P_Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, Impo.Pages.AbsoluteSize.Y)

				Indicator.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			else
				Image.ImageColor3 = Color3.fromRGB(70, 70, 70)

				Indicator.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			end
		end

		if settings.Image then
			Image.Image = settings.Image.Link

			local s,f = pcall(function()
				Image.Size = settings.Image.Size
			end)

			if f then Image.Size = UDim2.new(0, 25, 0, 25) end

			s,f = pcall(function()
				Image.ImageRectSize = settings.Image.RectSize
			end)

			if f then Image.ImageRectSize = UDim.new(0, 0) end

			s,f = pcall(function()
				Image.ImageRectOffset = settings.Image.RectOffset
			end)

			if f then Image.ImageRectOffset = UDim.new(0, 0) end

			if settings.Image.Round then
				s,f = pcall(function()
					Round(Image, settings.Image.Round)
				end)
			end
		else
			return print("Error: No image table was given.")
		end

		if settings.Overrides then
			if settings.Overrides.ScaleType then
				Image.ScaleType = settings.Overrides.ScaleType or Enum.ScaleType.Fit
			end

			if settings.Overrides.SliceScale then
				Image.SliceScale = settings.Overrides.SliceScale or 0
			end
		end

		--

		Button.MouseButton1Click:Connect(function()
			if Selected.Name == S_Frame.Name then return end

			if Debounce then return end
			Debounce = true

			game.TweenService:Create(Selected.Indicator, TweenInfo.new(.2), {
				BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			}):Play()

			game.TweenService:Create(Selected.Icon, TweenInfo.new(.2), {
				ImageColor3 = Color3.fromRGB(70, 70, 70)
			}):Play()

			game.TweenService:Create(Impo.Pages:FindFirstChild(Selected.Name), TweenInfo.new(.2), {
				Size = UDim2.new(0, 0, 1, 0)
			}):Play()

			wait(.2)

			game.TweenService:Create(Impo.Pages:FindFirstChild(S_Frame.Name), TweenInfo.new(.2), {
				Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, Impo.Pages.AbsoluteSize.Y)
			}):Play()

			game.TweenService:Create(Image, TweenInfo.new(.2), {
				ImageColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()

			game.TweenService:Create(Indicator, TweenInfo.new(.2), {
				BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			}):Play()

			wait(.2)

			Selected = S_Frame
			Debounce = false
		end)

		Button.MouseEnter:Connect(function()
			game.TweenService:Create(Indicator, TweenInfo.new(.2), {
				Size = UDim2.new(0, 40, 0, 40)
			}):Play()
		end)

		Button.MouseLeave:Connect(function()
			game.TweenService:Create(Indicator, TweenInfo.new(.2), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
		end)

		--

		function Functions.Label(settings)
			local Type = settings.Type or 1

			if settings.Type then
				if settings.Type > 3 then
					print("Error: Type " .. settings.Type .. " is not a valid Label type.")
				elseif settings.Type < 1 then
					print("Error: Type " .. settings.Type .. " is not a valid Label type.")
				end
			end

			if Type == 1 then
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = P_Frame
				TextLabel.BackgroundTransparency = 1
				TextLabel.Text = settings.Title or "Title"
				TextLabel.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X - 2, 0, 14)
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.TextSize = 14
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				--

				local Returned = {}

				Returned.Object = TextLabel

				--

				return Returned
			elseif Type == 2 then
				local Frame = Instance.new("Frame")
				Frame.Parent = P_Frame
				Frame.Name = settings.Title or "Title"
				Frame.BorderSizePixel = 0
				Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40)
				Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = Frame
				TextLabel.BackgroundTransparency = 1
				TextLabel.Text = settings.Title or "Title"
				TextLabel.Size = UDim2.new(1, -24, 1, 0)
				TextLabel.Position = UDim2.new(0, 12, 0, 0)
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.TextSize = 14
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				--

				local Returned = {}

				Returned.Object = Frame

				--

				return Returned
			elseif Type == 3 then
				local Frame = Instance.new("Frame")
				Frame.Parent = P_Frame
				Frame.Name = settings.Title or "Title"
				Frame.BorderSizePixel = 0
				Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 64)
				Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = Frame
				TextLabel.BackgroundTransparency = 1
				TextLabel.Text = settings.Title or "Title"
				TextLabel.Size = UDim2.new(1, -24, 0, 40)
				TextLabel.Position = UDim2.new(0, 12, 0, 0)
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.TextSize = 14
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				local TextLabel2 = Instance.new("TextLabel")
				TextLabel2.Parent = Frame
				TextLabel2.BackgroundTransparency = 1
				TextLabel2.Text = settings.Description or "Description"
				TextLabel2.Size = UDim2.new(1, -24, 0, 14)
				TextLabel2.Position = UDim2.new(0, 12, 0, 40)
				TextLabel2.Font = Enum.Font.GothamSemibold
				TextLabel2.TextSize = 14
				TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel2.TextXAlignment = Enum.TextXAlignment.Left

				--

				local Returned = {}

				Returned.Object = Frame

				--

				return Returned
			end
		end

		function Functions.Button(settings)
			local Returned = {}

			local Frame = Instance.new("Frame")
			Frame.Parent = P_Frame
			Frame.Name = settings.Title or "Title"
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40)
			Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Parent = Frame
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = settings.Title or "Title"
			TextLabel.Size = UDim2.new(1, -24, 0, 40)
			TextLabel.Position = UDim2.new(0, 12, 0, 0)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			local TextButton = Instance.new("TextButton")
			TextButton.Parent = Frame
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.BackgroundTransparency = 1
			TextButton.TextTransparency = 1
			TextButton.ZIndex = 2

			if settings.Extras then
				if settings.Extras.Image then
					local Frame2 = Instance.new("Frame")
					Frame2.Parent = Frame
					Frame2.Size = UDim2.new(0, 30, 0, 30)
					Frame2.Position = UDim2.new(0, 5, 0, 5)
					Frame2.BorderSizePixel = 0
					Frame2.BackgroundTransparency = 1

					local Image = Instance.new("ImageLabel")
					Image.Parent = Frame2
					Image.BorderSizePixel = 0
					Image.BackgroundTransparency = 1
					Image.Position = UDim2.new(.5, 0, .5, 0)
					Image.AnchorPoint = Vector2.new(.5, .5)
					Image.Size = UDim2.new(0, 30, 0, 30)

					Image.Image = settings.Extras.Image.Link
					TextLabel.Position = UDim2.new(0, 42, 0, 0)

					local s,f = pcall(function()
						Image.Size = settings.Extras.Image.Size
					end)

					if f then Image.Size = UDim2.new(0, 30, 0, 30) end

					s,f = pcall(function()
						Image.ImageRectSize = settings.Extras.Image.RectSize
					end)

					if f then Image.ImageRectSize = Vector2.new(0, 0) end

					s,f = pcall(function()
						Image.ImageRectOffset = settings.Extras.Image.RectOffset
					end)

					if f then Image.ImageRectOffset = Vector2.new(0, 0) end

					if settings.Extras.Image.Round then
						s,f = pcall(function()
							Round(Image, settings.Extras.Image.Round)
						end)
					end

					--

					if settings.Overrides then
						if settings.Overrides.ScaleType then
							Image.ScaleType = settings.Overrides.ScaleType or Enum.ScaleType.Fit
						end

						if settings.Overrides.SliceScale then
							Image.SliceScale = settings.Overrides.SliceScale or 0
						end
					end
				end
			end

			local Debounce = false

			TextButton.MouseButton1Click:Connect(function()
				if Debounce then return end
				Debounce = true

				if settings.Callback then settings.Callback(Returned) end

				game.TweenService:Create(Frame, TweenInfo.new(.1), {
					BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				}):Play()

				wait(.15)

				game.TweenService:Create(Frame, TweenInfo.new(.1), {
					BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				}):Play()

				wait(.15)

				Debounce = false
			end)

			--

			Returned.Object = Frame

			--

			return Returned
		end

		function Functions.Input(settings)
			local Returned = {}

			local Type = settings.Type or 1

			if settings.Type then
				if settings.Type > 3 then
					return print("Error: Type " .. settings.Type .. " is not a valid Input type.")
				elseif settings.Type < 1 then
					return print("Error: Type " .. settings.Type .. " is not a valid Input type.")
				end
			end

			local Frame = Instance.new("Frame")
			Frame.Parent = P_Frame
			Frame.Name = settings.Title or "Title"
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40)
			Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

			local TextBox = Instance.new("TextBox")
			TextBox.Parent = Frame
			TextBox.PlaceholderText = settings.Title or "Title"
			TextBox.Text = settings.Text or ""
			TextBox.BackgroundTransparency = 1
			TextBox.Size = UDim2.new(1, -24, 0, 14)
			TextBox.Position = UDim2.new(0, 12, 0, 13)
			TextBox.Font = Enum.Font.GothamSemibold
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextXAlignment = Enum.TextXAlignment.Left
			TextBox.TextSize = 14
			TextBox.ClearTextOnFocus = false

			if Type == 1 then
				if settings.MultiLine and settings.MultiLine == true then
					TextBox.MultiLine = true
					TextBox.ClipsDescendants = true

					TextBox.Changed:Connect(function(c)
						if c == "Text" then
							TextBox.Size = UDim2.new(1, -24, 1, 0)
							TextBox.Size = UDim2.new(1, -24, 0, TextBox.TextBounds.Y)

							Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, (TextBox.TextBounds.Y - 14) + 40)
							if settings.Callback then settings.Callback(TextBox.Text, Returned) end
						end
					end)
				else
					TextBox.TextWrapped = true

					TextBox.Changed:Connect(function(c)
						if c == "Text" then
							TextBox.Size = UDim2.new(1, -24, 1, 0)
							TextBox.Size = UDim2.new(1, -24, 0, TextBox.TextBounds.Y)

							Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, (TextBox.TextBounds.Y - 14) + 40)
						end
					end)

					TextBox.FocusLost:Connect(function(eP)
						if eP then
							if settings.Callback then settings.Callback(TextBox.Text, Returned) end
						end
					end)
				end
			else
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = Frame
				TextLabel.Text = settings.Start or "Start"
				TextLabel.BackgroundTransparency = 1
				TextLabel.Size = UDim2.new(0, TextLabel.TextBounds.X, 0, 14)
				TextLabel.Position = UDim2.new(0, 12, 0, 13)
				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.TextColor3 = Color3.fromRGB(215, 215, 215)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.TextSize = 14

				TextBox.Position = UDim2.new(0, (TextLabel.TextBounds.X + 24), 0, 13)

				if settings.MultiLine and settings.MultiLine == true then
					TextBox.MultiLine = true
					TextBox.ClipsDescendants = true

					TextBox.Changed:Connect(function(c)
						if c == "Text" then
							TextBox.Size = UDim2.new(1, -(TextLabel.TextBounds.X + 34), 1, 0)
							TextBox.Size = UDim2.new(1, -(TextLabel.TextBounds.X + 34), 0, TextBox.TextBounds.Y)

							Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, (TextBox.TextBounds.Y - 14) + 40)
							if settings.Callback then settings.Callback(TextBox.Text, Returned) end
						end
					end)
				else
					TextBox.TextWrapped = true

					TextBox.Changed:Connect(function(c)
						if c == "Text" then
							TextBox.Size = UDim2.new(1, -(TextLabel.TextBounds.X + 34), 1, 0)
							TextBox.Size = UDim2.new(1, -(TextLabel.TextBounds.X + 34), 0, TextBox.TextBounds.Y)

							Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, (TextBox.TextBounds.Y - 14) + 40)
						end
					end)

					TextBox.FocusLost:Connect(function(eP)
						if eP then
							if settings.Callback then settings.Callback(TextLabel.Text .. TextBox.Text, Returned) end
						end
					end)
				end
			end

			--

			Returned.Object = Frame

			function Returned.SetText(text)
				TextBox.Text = text
			end

			function Returned.GetText()
				return TextBox.Text
			end

			--

			return Returned
		end

		function Functions.Toggle(settings)
			local Returned = {}

			local Toggled = false
			local Debounce = false
			local name = settings.Title
			local coolshit = create_label(name)

			local Frame = Instance.new("Frame")
			Frame.Parent = P_Frame
			Frame.Name = settings.Title or "Title"
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40)
			Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Parent = Frame
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = settings.Title or "Title"
			TextLabel.Size = UDim2.new(1, -40, 1, 0)
			TextLabel.Position = UDim2.new(0, 40, 0, 0)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			local Frame2 = Instance.new("Frame")
			Frame2.Parent = Frame
			Frame2.Size = UDim2.new(0, 15, 0, 15)
			Frame2.Position = UDim2.new(0, 12, .5, 0)
			Frame2.AnchorPoint = Vector2.new(0, .5)
			Frame2.BorderSizePixel = 0
			Frame2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

			Round(Frame2, UDim.new(0, 3))

			local Frame3 = Instance.new("Frame")
			Frame3.Parent = Frame2
			Frame3.Size = UDim2.new(1, -2, 1, -2)
			Frame3.Position = UDim2.new(0, 1, 0, 1)
			Frame3.BorderSizePixel = 0
			Frame3.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

			Round(Frame3, UDim.new(0, 3))

			local TextButton = Instance.new("TextButton")
			TextButton.Parent = Frame
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.BackgroundTransparency = 1
			TextButton.TextTransparency = 1
			TextButton.ZIndex = 2

			local Icon = Instance.new("ImageLabel")
			Icon.Parent = Frame3
			Icon.BackgroundTransparency = 1
			Icon.Size = UDim2.new(0, 11, 0, 11)
			Icon.Position = UDim2.new(.5, 0, .5, 0)
			Icon.AnchorPoint = Vector2.new(.5, .5)
			Icon.Image = "rbxassetid://3926305904"
			Icon.ImageRectSize = Vector2.new(24, 24)
			Icon.ImageRectOffset = Vector2.new(312, 4)
			Icon.ImageColor3 = Color3.fromRGB(35, 35, 35)

			if settings.Toggled then
				if settings.Toggled == true then
					coolshit:Show()
					Toggled = true
					Icon.ImageColor3 = Color3.fromRGB(100, 100, 100)
					Frame3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				end
			end

			TextButton.MouseButton1Click:Connect(function()
				if Debounce then return end
				Debounce = true

				if Toggled == true then
					Toggled = false
					coolshit:Erase()
					game.TweenService:Create(Frame3, TweenInfo.new(.15), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()

					game.TweenService:Create(Icon, TweenInfo.new(.15), {
						ImageColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()
				else
					Toggled = true
					coolshit:Show()
					game.TweenService:Create(Frame3, TweenInfo.new(.15), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					}):Play()

					game.TweenService:Create(Icon, TweenInfo.new(.15), {
						ImageColor3 = Color3.fromRGB(100, 100, 100)
					}):Play()
				end

				if settings.Callback then settings.Callback(Toggled, Returned) end

				wait(.15)

				Debounce = false
			end)

			--

			Returned.Object = Frame

			function Returned.SetValue(value)
				if Debounce then return end
				Debounce = true

				if value == true then
					Toggled = true
					coolshit:Show()
					game.TweenService:Create(Frame3, TweenInfo.new(.15), {
						BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					}):Play()

					game.TweenService:Create(Icon, TweenInfo.new(.15), {
						ImageColor3 = Color3.fromRGB(100, 100, 100)
					}):Play()
				else
					Toggled = false
					coolshit:Erase()
					game.TweenService:Create(Frame3, TweenInfo.new(.15), {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()

					game.TweenService:Create(Icon, TweenInfo.new(.15), {
						ImageColor3 = Color3.fromRGB(35, 35, 35)
					}):Play()
				end

				wait(.15)

				Debounce = false
			end

			function Returned.GetValue(value)
				return Toggled
			end

			--

			return Returned
		end

		function Functions.Keybind(settings)
			local Returned = {}

			local UserInputService = game:GetService("UserInputService")
			local Listening = false
			local Key = settings.Key or "F"
			local name = settings.Title
			local coolshit = create_label(name.. ': '.. Key)
			coolshit:Show()
			local Frame = Instance.new("Frame")

			Frame.Parent = P_Frame
			Frame.Name = settings.Title or "Title"
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40)
			Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Parent = Frame
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = settings.Title or "Title"
			TextLabel.Size = UDim2.new(1, -24, 0, 40)
			TextLabel.Position = UDim2.new(0, 12, 0, 0)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			local TextLabel2 = Instance.new("TextLabel")
			TextLabel2.Parent = Frame
			TextLabel2.BackgroundTransparency = 1
			TextLabel2.Text = Key
			TextLabel2.Position = UDim2.new(1, -12, 0, 0)
			TextLabel2.AnchorPoint = Vector2.new(1, 0)
			TextLabel2.Font = Enum.Font.GothamBold
			TextLabel2.TextSize = 14
			TextLabel2.TextColor3 = Color3.fromRGB(155, 155, 155)
			TextLabel2.TextXAlignment = Enum.TextXAlignment.Right
			TextLabel2.Size = UDim2.new(0, TextLabel2.TextBounds.X, 0, 40)

			local Frame2 = Instance.new("Frame")
			Frame2.Parent = TextLabel2
			Frame2.BorderSizePixel = 0
			Frame2.Size = UDim2.new(0, 1, .2, 0)
			Frame2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			Frame2.AnchorPoint = Vector2.new(0, .5)
			Frame2.Position = UDim2.new(0, -15, .5, 0)

			local TextButton = Instance.new("TextButton")
			TextButton.Parent = Frame
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.BackgroundTransparency = 1
			TextButton.TextTransparency = 1
			TextButton.ZIndex = 2

			TextLabel2.Changed:Connect(function(c)
				if c == "Text" then
					TextLabel2.Size = UDim2.new(0, TextLabel2.TextBounds.X, 0, 40)
					coolshit:Update(name.. ': '.. TextLabel2.Text)
				end
			end)

			TextButton.MouseButton1Click:Connect(function()
				if Listening == true then
					Listening = false
					TextLabel2.Text = Key
				else
					Listening = true
					TextLabel2.Text = "..."
				end
			end)

			UserInputService.InputBegan:Connect(function(Input, GPE)
				if not GPE then
					if Listening then
						if Input.UserInputType == Enum.UserInputType.Keyboard then
							Key = string.split(tostring(Input.KeyCode), "Enum.KeyCode.")[2]
							Listening = false
							TextLabel2.Text = string.split(tostring(Input.KeyCode), "Enum.KeyCode.")[2]
						end
					else
						if Input.KeyCode == Enum.KeyCode[Key] then
							if settings.Callback then settings.Callback(Returned) end
						end
					end
				end
			end)

			--

			Returned.Object = Frame

			function Returned.SetKey(key)
				Key = key
				TextLabel2.Text = Key
			end

			function Returned.GetKey()
				return Key
			end

			--

			return Returned
		end

		function Functions.Slider(settings)
			local Returned = {}

			local Down = false

			local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
			local name = settings.Title

			local Value

			local Min = settings.Min or 0
			local Max = settings.Max or 100
			local coolshit = create_label(name.. ': '.. tostring(Min))
			coolshit:Show()
			local Frame = Instance.new("Frame")
			Frame.Parent = P_Frame
			Frame.Name = settings.Title or "Title"
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 52)
			Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Parent = Frame
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = settings.Title or "Title"
			TextLabel.Size = UDim2.new(1, -24, 1, -12)
			TextLabel.Position = UDim2.new(0, 12, 0, 0)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			local TextBox = Instance.new("TextBox")
			TextBox.Parent = Frame
			TextBox.BackgroundTransparency = 1
			TextBox.Text = Min
			TextBox.PlaceholderText = Min
			TextBox.Size = UDim2.new(0.4, 0, 1, -12)
			TextBox.Position = UDim2.new(1, -12, 0, 0, 0)
			TextBox.AnchorPoint = Vector2.new(1, 0)
			TextBox.Font = Enum.Font.GothamBold
			TextBox.TextSize = 14
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextXAlignment = Enum.TextXAlignment.Right

			local TextButton = Instance.new("TextButton")
			TextButton.Parent = Frame
			TextButton.BorderSizePixel = 0
			TextButton.TextTransparency = 1
			TextButton.Size = UDim2.new(1, -4, 0, 10)
			TextButton.Position = UDim2.new(0, 2, 1, -2)
			TextButton.AnchorPoint = Vector2.new(0, 1)
			TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			TextButton.AutoButtonColor = false

			local Frame2 = Instance.new("Frame")
			Frame2.Parent = TextButton
			Frame2.Size = UDim2.new(0, 0, 1, 0)
			Frame2.BorderSizePixel = 0
			Frame2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

			TextButton.MouseButton1Down:Connect(function()
				if not Gui then return end

				Down = true

				Value = math.floor((((tonumber(Max) - tonumber(Min)) / TextButton.AbsoluteSize.X) * Frame2.AbsoluteSize.X) + tonumber(Min))

				TextBox.Text = Value

				Frame2.Size = UDim2.new(0, math.clamp(Mouse.X - TextButton.AbsolutePosition.X, 0, TextButton.AbsoluteSize.X), 1, 0)
coolshit:Update(name..': '..tostring(Value))
				if settings.Callback then settings.Callback(tonumber(Value), Returned) end
			end)

			Mouse.Move:Connect(function()
				if Down and Gui then
					TextBox.Text = Value

					Value = math.floor((((tonumber(Max) - tonumber(Min)) / TextButton.AbsoluteSize.X) * Frame2.AbsoluteSize.X) + tonumber(Min))

					Frame2.Size = UDim2.new(0, math.clamp(Mouse.X - TextButton.AbsolutePosition.X, 0, TextButton.AbsoluteSize.X), 1, 0)
					coolshit:Update(name..': '..tostring(Value))
					if settings.Callback then settings.Callback(tonumber(Value), Returned) end
				end
			end)

			UserInputService.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 and Gui and Down == true then
					Down = false

					Value = math.floor((((tonumber(Max) - tonumber(Min)) / TextButton.AbsoluteSize.X) * Frame2.AbsoluteSize.X) + tonumber(Min))

					Frame2.Size = UDim2.new(0, math.clamp(Mouse.X - TextButton.AbsolutePosition.X, 0, TextButton.AbsoluteSize.X), 1, 0)
				end
			end)


			if settings.Def then
				if settings.Def > Max or settings.Def < Min then return end

				Value = settings.Def
				TextBox.Text = Value
				Frame2.Size = UDim2.new((Value / Max), 0, 1, 0)
			end

			TextBox.FocusLost:Connect(function()
				if tonumber(TextBox.Text) > Max or tonumber(TextBox.Text) < Min then TextBox.Text = Value return end

				Value = tonumber(TextBox.Text)
				coolshit:Update(name..': '..tostring(Value))
				TextBox.Text = Value
				Frame2.Size = UDim2.new((Value / Max), 0, 1, 0)
			end)


			--

			Returned.Object = Frame

			function Returned.SetValue(value)
				if tonumber(value) > Max or tonumber(value) < Min then return end

				Value = tonumber(value)
				coolshit:Update(name..': '..tostring(Value))
				TextBox.Text = Value
				Frame2.Size = UDim2.new((Value / Max), 0, 1, 0)
			end

			function Returned.GetValue()
				return Value
			end

			--

			return Returned
		end

		function Functions.Section(settings)
			local Frame = Instance.new("Frame")
			Frame.Parent = P_Frame
			Frame.Name = settings.Title or "Title"
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 95)
			Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Parent = Frame
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = settings.Title or "Title"
			TextLabel.Size = UDim2.new(1, -24, 0, 40)
			TextLabel.Position = UDim2.new(0, 12, 0, 0)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			local Frame2 = Instance.new("Frame")
			Frame2.Parent = Frame
			Frame2.BorderSizePixel = 0
			Frame2.Size = UDim2.new(1, -10, 0, 50)
			Frame2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Frame2.Position = UDim2.new(0, 5, 1, -5)
			Frame2.AnchorPoint = Vector2.new(0, 1)

			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.Parent = Frame2
			UIListLayout.Name = "UIListLayout"
			UIListLayout.FillDirection = Enum.FillDirection.Vertical
			UIListLayout.Padding = UDim.new(0, 5)
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

			Frame2.ChildAdded:Connect(function(obj)
				obj.Size = UDim2.new(1, -10, 0, obj.Size.Y.Offset)

				local Size = 0

				for _,v in pairs(Frame2:GetChildren()) do
					if v:IsA("Frame") or v:IsA("TextLabel") then
						wait(.001)
						Size = Size + v.Size.Y.Offset + 5
						obj.Size = UDim2.new(1, -10, 0, obj.Size.Y.Offset)
					end
				end

				Size = Size

				Frame2.Size = UDim2.new(1, -10, 0, Size + 5)
				Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40 + (Size + 10))

				obj.Changed:Connect(function(c)
					if c == "Size" then
						obj.Size = UDim2.new(1, -10, 0, obj.Size.Y.Offset)
						
						local Size = 0

						for _,v in pairs(Frame2:GetChildren()) do
							if v:IsA("Frame") or v:IsA("TextLabel") then
								wait(.001)
								v.Size = UDim2.new(1, -10, 0, v.Size.Y.Offset)
								Size = Size + v.Size.Y.Offset + 5
							end
						end

						Size = Size

						Frame2.Size = UDim2.new(1, -10, 0, Size + 5)
						Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40 + (Size + 10))
					end
				end)
			end)
			
			Frame2.ChildAdded:Connect(function()
				local Size = 0

				for _,v in pairs(Frame2:GetChildren()) do
					if v:IsA("Frame") or v:IsA("TextLabel") then
						wait(.001)
						Size = Size + v.Size.Y.Offset + 5
						v.Size = UDim2.new(1, -10, 0, v.Size.Y.Offset)
					end
				end

				Frame2.Size = UDim2.new(1, -10, 0, Size + 5)
				Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40 + (Size + 10))
			end)

			--

			local Returned = {}

			Returned.Object = Frame

			function Returned.Add(obj)
				if typeof (obj) == "Instance" and obj:IsA("Frame") or obj:IsA("TextLabel") then
					obj.Parent = Frame2
				end
			end

			--

			return Returned
		end

		function Functions.Dropdown(settings)
			local Frame = Instance.new("Frame")
			Frame.Parent = P_Frame
			Frame.Name = settings.Title or "Title"
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, Impo.Pages.AbsoluteSize.X, 0, 40)
			Frame.BackgroundTransparency = 1
			Frame.ClipsDescendants = true

			local Frame2 = Instance.new("Frame")
			Frame2.Parent = Frame
			Frame2.BorderSizePixel = 0
			Frame2.Size = UDim2.new(1, 0, 0, 40)
			Frame2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Frame2.ZIndex = 2

			local TextLabel = Instance.new("TextLabel")
			TextLabel.Parent = Frame2
			TextLabel.BackgroundTransparency = 1
			TextLabel.Text = settings.Title or "Title"
			TextLabel.Size = UDim2.new(1, -24, 0, 40)
			TextLabel.Position = UDim2.new(0, 12, 0, 0)
			TextLabel.Font = Enum.Font.GothamSemibold
			TextLabel.TextSize = 14
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.ZIndex = 3

			local Frame3 = Instance.new("Frame")
			Frame3.Parent = Frame
			Frame3.BackgroundTransparency = 1
			Frame3.Size = UDim2.new(1, -5, 1, -40)
			Frame3.Position = UDim2.new(1, 0, 1, 5)
			Frame3.AnchorPoint = Vector2.new(1, 1)

			local Frame4 = Instance.new("Frame")
			Frame4.Parent = Frame3
			Frame4.BorderSizePixel = 0
			Frame4.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Frame4.Size = UDim2.new(0, 1, 1, -5)
			Frame4.Position = UDim2.new(0, -5, 0, 0)

			local Frame5 = Instance.new("Frame")
			Frame5.Parent = Frame3
			Frame5.BackgroundTransparency = 1
			Frame5.Size = UDim2.new(1, 0, 1, 0)
			Frame5.Position = UDim2.new(1, 0, 1, 0)
			Frame5.AnchorPoint = Vector2.new(1, 1)

			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.Parent = Frame5
			UIListLayout.Name = "UIListLayout"
			UIListLayout.FillDirection = Enum.FillDirection.Vertical
			UIListLayout.Padding = UDim.new(0, 5)
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

			local TextButton = Instance.new("TextButton")
			TextButton.Parent = Frame
			TextButton.Size = UDim2.new(1, 0, 0, 40)
			TextButton.BackgroundTransparency = 1
			TextButton.TextTransparency = 1
			TextButton.ZIndex = 5

			local Toggled = false
			local Debounce = false

			Frame5.ChildAdded:Connect(function(obj)
				if obj:IsA("Frame") or obj:IsA("TextLabel") then
					obj.Size = UDim2.new(1, 0, 0, obj.Size.Y.Offset)

					if Toggled then
						local Size = 0

						for _,v in pairs(Frame5:GetChildren()) do
							if v:IsA("Frame") or v:IsA("TextLabel") then
								wait(.001)
								Size = Size + v.Size.Y.Offset + 5
								v.Size = UDim2.new(1, 0, 0, v.Size.Y.Offset)
							end
						end

						game.TweenService:Create(Frame, TweenInfo.new(.3), {
							Size = UDim2.new(1, 0, 0, 40 + Size)
						}):Play()

						wait(.3)

						Debounce = false
					end
					
					obj.Changed:Connect(function(c)
						if c == "Size" then
							obj.Size = UDim2.new(1, 0, 0, obj.Size.Y.Offset)

							if Toggled then
								local Size = 0

								for _,v in pairs(Frame5:GetChildren()) do
									if v:IsA("Frame") or v:IsA("TextLabel") then
										wait(.001)
										Size = Size + v.Size.Y.Offset + 5
										v.Size = UDim2.new(1, 0, 0, v.Size.Y.Offset)
									end
								end

								game.TweenService:Create(Frame, TweenInfo.new(.3), {
									Size = UDim2.new(1, 0, 0, 40 + Size)
								}):Play()

								wait(.3)

								Debounce = false
							end
						end
					end)
				end
			end)

			Frame5.ChildRemoved:Connect(function()
				if Toggled then
					local Size = 0

					for _,v in pairs(Frame5:GetChildren()) do
						if v:IsA("Frame") or v:IsA("TextLabel") then
							wait(.001)
							Size = Size + v.Size.Y.Offset + 5
							v.Size = UDim2.new(1, 0, 0, v.Size.Y.Offset)
						end
					end

					game.TweenService:Create(Frame, TweenInfo.new(.3), {
						Size = UDim2.new(1, 0, 0, 40 + Size)
					}):Play()

					wait(.3)

					Debounce = false
				end
			end)

			TextButton.MouseButton1Click:Connect(function()
				if Debounce then return end
				Debounce = true

				if Toggled == false then
					Toggled = true

					local Size = 0

					for _,v in pairs(Frame5:GetChildren()) do
						if v:IsA("Frame") or v:IsA("TextLabel") then
							wait(.001)
							Size = Size + v.Size.Y.Offset + 5
						end
					end

					game.TweenService:Create(Frame, TweenInfo.new(.3), {
						Size = UDim2.new(1, 0, 0, 40 + Size)
					}):Play()

					wait(.3)

					Debounce = false
				else
					Toggled = false

					local Size = 0

					for _,v in pairs(Frame5:GetChildren()) do
						if v:IsA("Frame") or v:IsA("TextLabel") then
							Size = Size + v.Size.Y.Offset + 5
						end
					end

					game.TweenService:Create(Frame, TweenInfo.new(.3), {
						Size = UDim2.new(1, 0, 0, 40)
					}):Play()

					wait(.3)

					Debounce = false
				end
			end)

			--

			local Returned = {}

			Returned.Object = Frame

			function Returned.Add(obj)
				if typeof (obj) == "Instance" and obj:IsA("Frame") or obj:IsA("TextLabel") then
					obj.Parent = Frame5
				end
			end
			
			function Returned:GetItems()
				local i = 0
				local list = {}
				
				for _,v in pairs(Frame5:GetChildren()) do
					if v:IsA("Frame") or v:IsA("TextLabel") then
						i = i + 1
						list[i] = v
					end
				end
				
				return list
			end

			--

			return Returned
		end

		--
		
		Dragify(Gui.Drag)
		
		--

		return Functions, Gui
	end
	
	--

	return Functions
end

return App
