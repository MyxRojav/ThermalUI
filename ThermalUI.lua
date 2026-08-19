-- ============================================
-- CUSTOM UI — THERMAL LAYOUT
-- ============================================

local CustomUI = {}
CustomUI.Window = nil
CustomUI.Tabs = {}
CustomUI.ActiveTab = nil

-- ============================================
-- CREATE WINDOW (uses your exported UI)
-- ============================================
function CustomUI:CreateWindow(config)
    config = config or {}
    
    -- ===== BUILD UI (from your export) =====
    local ThermalUI = Instance.new("ScreenGui")
    ThermalUI.Name = "ThermalUI"
    ThermalUI.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    ThermalUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ThermalUI.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ThermalUI
    MainFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Position = UDim2.new(0.313900322, -250, 0.380288512, -225)
    MainFrame.Size = UDim2.new(0, 1075, 0, 583)

    -- Topbar
    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.Parent = MainFrame
    Topbar.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    Topbar.BorderColor3 = Color3.fromRGB(27, 27, 27)
    Topbar.ClipsDescendants = true
    Topbar.Size = UDim2.new(0, 1075, 0, 25)

    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Topbar
    CloseButton.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0.968379021, 0, 0, 0)
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.TextSize = 14
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(8, 8)
    UICorner.Parent = CloseButton
    CloseButton.MouseButton1Click:Connect(function()
        ThermalUI:Destroy()
    end)

    -- LogoContainer
    local LogoContainer = Instance.new("Frame")
    LogoContainer.Name = "LogoContainer"
    LogoContainer.Parent = MainFrame
    LogoContainer.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    LogoContainer.BorderColor3 = Color3.fromRGB(27, 27, 27)
    LogoContainer.Position = UDim2.new(0.00558139523, 0, 0.0548885614, 0)
    LogoContainer.Size = UDim2.new(0, 467, 0, 245)

    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = LogoContainer
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0.0337153412, 0, 0.263445824, 0)
    Logo.Size = UDim2.new(0, 418, 0, 113)
    Logo.Image = config.LogoID or "rbxassetid://137394765830675"
    Logo.ScaleType = Enum.ScaleType.Fit

    -- TabContainer
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    TabContainer.BorderColor3 = Color3.fromRGB(27, 27, 27)
    TabContainer.Position = UDim2.new(0.00558139523, 0, 0.487135559, 0)
    TabContainer.Size = UDim2.new(0, 467, 0, 293)

    -- Content Containers (two columns)
    local ContentContainer1 = Instance.new("Frame")
    ContentContainer1.Name = "ContentContainer1"
    ContentContainer1.Parent = MainFrame
    ContentContainer1.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    ContentContainer1.BorderColor3 = Color3.fromRGB(27, 27, 27)
    ContentContainer1.Position = UDim2.new(0.446511745, 0, 0.0548885614, 0)
    ContentContainer1.Size = UDim2.new(0, 285, 0, 545)
    ContentContainer1.ClipsDescendants = true

    local ContentContainer2 = Instance.new("Frame")
    ContentContainer2.Name = "ContentContainer2"
    ContentContainer2.Parent = MainFrame
    ContentContainer2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    ContentContainer2.BorderColor3 = Color3.fromRGB(27, 27, 27)
    ContentContainer2.Position = UDim2.new(0.718139648, 0, 0.0548885614, 0)
    ContentContainer2.Size = UDim2.new(0, 294, 0, 545)
    ContentContainer2.ClipsDescendants = true

    -- Dragging
    local dragging = false
    local dragStart = nil
    local dragOffset = nil

    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            dragOffset = MainFrame.Position
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                dragOffset.X.Scale,
                dragOffset.X.Offset + delta.X,
                dragOffset.Y.Scale,
                dragOffset.Y.Offset + delta.Y
            )
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- ===== STORE WINDOW REFERENCE =====
    self.Window = {
        ThermalUI = ThermalUI,
        MainFrame = MainFrame,
        Topbar = Topbar,
        TabContainer = TabContainer,
        Content1 = ContentContainer1,
        Content2 = ContentContainer2,
        Logo = Logo,
        Tabs = {},
        ActiveTab = nil
    }

    return self.Window
end

-- ============================================
-- CREATE TAB
-- ============================================
function CustomUI:CreateTab(window, config)
    config = config or {}
    local tabName = config.Name or "Tab"
    
    local tab = {}
    tab.Name = tabName
    tab.Elements = {}

    -- Tab button
    local btn = Instance.new("TextButton")
    btn.Name = tabName .. "Btn"
    btn.Size = UDim2.new(1, -20, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, #window.Tabs * 40 + 10)
    btn.BackgroundTransparency = 0.7
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    btn.BorderSizePixel = 0
    btn.Text = tabName
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamMedium
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = window.TabContainer

    -- Hover effect
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0.4
    end)
    btn.MouseLeave:Connect(function()
        if window.ActiveTab ~= tab then
            btn.BackgroundTransparency = 0.7
        end
    end)

    -- Active indicator
    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0, 3, 0, 25)
    indicator.Position = UDim2.new(0, 0, 0.5, -12.5)
    indicator.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    indicator.BorderSizePixel = 0
    indicator.Visible = false
    indicator.Parent = btn

    -- Tab pages (one for each content container)
    local page1 = Instance.new("ScrollingFrame")
    page1.Name = tabName .. "_Page1"
    page1.Size = UDim2.new(1, 0, 1, 0)
    page1.BackgroundTransparency = 1
    page1.ScrollBarThickness = 3
    page1.CanvasSize = UDim2.new(0, 0, 0, 0)
    page1.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page1.Visible = false
    page1.Parent = window.Content1

    local page2 = Instance.new("ScrollingFrame")
    page2.Name = tabName .. "_Page2"
    page2.Size = UDim2.new(1, 0, 1, 0)
    page2.BackgroundTransparency = 1
    page2.ScrollBarThickness = 3
    page2.CanvasSize = UDim2.new(0, 0, 0, 0)
    page2.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page2.Visible = false
    page2.Parent = window.Content2

    -- Layouts
    local layout1 = Instance.new("UIListLayout")
    layout1.FillDirection = Enum.FillDirection.Vertical
    layout1.SortOrder = Enum.SortOrder.LayoutOrder
    layout1.Padding = UDim.new(0, 4)
    layout1.Parent = page1

    local layout2 = Instance.new("UIListLayout")
    layout2.FillDirection = Enum.FillDirection.Vertical
    layout2.SortOrder = Enum.SortOrder.LayoutOrder
    layout2.Padding = UDim.new(0, 4)
    layout2.Parent = page2

    tab.Button = btn
    tab.Indicator = indicator
    tab.Page1 = page1
    tab.Page2 = page2
    tab.Layout1 = layout1
    tab.Layout2 = layout2

    -- Click handler
    btn.MouseButton1Click:Connect(function()
        for _, t in ipairs(window.Tabs) do
            t.Page1.Visible = false
            t.Page2.Visible = false
            t.Indicator.Visible = false
            t.Button.BackgroundTransparency = 0.7
        end
        page1.Visible = true
        page2.Visible = true
        indicator.Visible = true
        btn.BackgroundTransparency = 0.3
        window.ActiveTab = tab
    end)

    table.insert(window.Tabs, tab)

    -- Activate first tab
    if #window.Tabs == 1 then
        page1.Visible = true
        page2.Visible = true
        indicator.Visible = true
        btn.BackgroundTransparency = 0.3
        window.ActiveTab = tab
    end

    return tab
end

-- ============================================
-- HELPERS
-- ============================================
function CustomUI:GetActivePage(tab, side)
    if side == 1 then return tab.Page1 else return tab.Page2 end
end

function CustomUI:GetActiveLayout(tab, side)
    if side == 1 then return tab.Layout1 else return tab.Layout2 end
end

-- ============================================
-- CREATE SECTION
-- ============================================
function CustomUI:CreateSection(tab, config, side)
    side = side or 1
    local name = config.Name or "Section"
    
    local page = self:GetActivePage(tab, side)
    local layout = self:GetActiveLayout(tab, side)

    local section = {}
    section.Name = name
    section.Elements = {}
    
    local frame = Instance.new("Frame")
    frame.Name = name .. "Section"
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = page

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamBold
    label.Parent = frame

    local divider = Instance.new("Frame")
    divider.Name = "Divider"
    divider.Size = UDim2.new(1, -20, 0, 1)
    divider.Position = UDim2.new(0, 10, 1, -1)
    divider.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    divider.BorderSizePixel = 0
    divider.Parent = frame

    section.Frame = frame
    section.Label = label
    tab.Elements[#tab.Elements + 1] = section

    return section
end

-- ============================================
-- CREATE TOGGLE
-- ============================================
function CustomUI:CreateToggle(tab, config, side)
    side = side or 1
    local name = config.Name or "Toggle"
    local callback = config.Callback or function() end
    local defaultValue = config.DefaultValue or false

    local page = self:GetActivePage(tab, side)
    local layout = self:GetActiveLayout(tab, side)

    local toggle = {}
    toggle.Name = name
    toggle.Value = defaultValue

    local frame = Instance.new("Frame")
    frame.Name = name .. "Toggle"
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = page

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamMedium
    label.Parent = frame

    local bg = Instance.new("Frame")
    bg.Name = "Bg"
    bg.Size = UDim2.new(0, 40, 0, 20)
    bg.Position = UDim2.new(1, -45, 0.5, -10)
    bg.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
    bg.BorderSizePixel = 0
    bg.Parent = frame

    local indicator = Instance.new("Frame")
    indicator.Name = "Indicator"
    indicator.Size = UDim2.new(0, 16, 0, 16)
    indicator.Position = UDim2.new(0, 2, 0.5, -8)
    indicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    indicator.BorderSizePixel = 0
    indicator.Parent = bg

    local function updateToggle(value)
        toggle.Value = value
        if value then
            bg.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
            indicator.Position = UDim2.new(1, -18, 0.5, -8)
            indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            bg.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
            indicator.Position = UDim2.new(0, 2, 0.5, -8)
            indicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        end
        callback(value)
    end

    local btn = Instance.new("TextButton")
    btn.Name = "Btn"
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = bg

    btn.MouseButton1Click:Connect(function()
        updateToggle(not toggle.Value)
    end)

    updateToggle(defaultValue)

    toggle.Frame = frame
    toggle.Update = updateToggle
    tab.Elements[#tab.Elements + 1] = toggle

    return toggle
end

-- ============================================
-- CREATE SLIDER
-- ============================================
function CustomUI:CreateSlider(tab, config, side)
    side = side or 1
    local name = config.Name or "Slider"
    local min = config.Min or 0
    local max = config.Max or 100
    local increment = config.Increment or 1
    local defaultValue = config.DefaultValue or 50
    local callback = config.Callback or function() end

    local page = self:GetActivePage(tab, side)
    local layout = self:GetActiveLayout(tab, side)

    local slider = {}
    slider.Name = name
    slider.Value = defaultValue

    local frame = Instance.new("Frame")
    frame.Name = name .. "Slider"
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.BackgroundTransparency = 1
    frame.Parent = page

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.5, 0, 0.5, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamMedium
    label.Parent = frame

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Name = "ValueLabel"
    valueLabel.Size = UDim2.new(0.3, 0, 0.5, 0)
    valueLabel.Position = UDim2.new(0.7, 0, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(defaultValue)
    valueLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    valueLabel.TextSize = 13
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.Font = Enum.Font.GothamMedium
    valueLabel.Parent = frame

    local track = Instance.new("Frame")
    track.Name = "Track"
    track.Size = UDim2.new(1, -20, 0, 4)
    track.Position = UDim2.new(0, 10, 1, -6)
    track.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
    track.BorderSizePixel = 0
    track.Parent = frame

    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Size = UDim2.new(0.5, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    fill.BorderSizePixel = 0
    fill.Parent = track

    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(0.5, -7, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    knob.BorderSizePixel = 0
    knob.Parent = track

    local function updateSlider(value)
        value = math.clamp(value, min, max)
        if increment > 0 then
            value = math.floor(value / increment + 0.5) * increment
        end
        slider.Value = value
        local percent = (value - min) / (max - min)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        knob.Position = UDim2.new(percent, -7, 0.5, -7)
        valueLabel.Text = tostring(value)
        callback(value)
    end

    local dragging = false
    local function onInputBegan(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local pos = input.Position.X - track.AbsolutePosition.X
            local percent = math.clamp(pos / track.AbsoluteSize.X, 0, 1)
            updateSlider(min + (max - min) * percent)
        end
    end

    local function onInputChanged(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = input.Position.X - track.AbsolutePosition.X
            local percent = math.clamp(pos / track.AbsoluteSize.X, 0, 1)
            updateSlider(min + (max - min) * percent)
        end
    end

    local function onInputEnded(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end

    track.InputBegan:Connect(onInputBegan)
    track.InputChanged:Connect(onInputChanged)
    track.InputEnded:Connect(onInputEnded)

    updateSlider(defaultValue)

    slider.Frame = frame
    slider.Update = updateSlider
    tab.Elements[#tab.Elements + 1] = slider

    return slider
end

-- ============================================
-- CREATE BUTTON
-- ============================================
function CustomUI:CreateButton(tab, config, side)
    side = side or 1
    local name = config.Name or "Button"
    local callback = config.Callback or function() end

    local page = self:GetActivePage(tab, side)
    local layout = self:GetActiveLayout(tab, side)

    local frame = Instance.new("Frame")
    frame.Name = name .. "Button"
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = page

    local btn = Instance.new("TextButton")
    btn.Name = "Btn"
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.Position = UDim2.new(0, 10, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
    btn.BackgroundTransparency = 0.8
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamMedium
    btn.Parent = frame

    btn.MouseButton1Click:Connect(callback)
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0.5
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.8
    end)

    return btn
end

-- ============================================
-- CREATE DROPDOWN
-- ============================================
function CustomUI:CreateDropdown(tab, config, side)
    side = side or 1
    local name = config.Name or "Dropdown"
    local options = config.Options or {"Option 1", "Option 2"}
    local defaultOption = config.DefaultOption or options[1]
    local callback = config.Callback or function() end

    local page = self:GetActivePage(tab, side)
    local layout = self:GetActiveLayout(tab, side)

    local dropdown = {}
    dropdown.Name = name
    dropdown.Options = options
    dropdown.Selected = defaultOption
    dropdown.Open = false

    local frame = Instance.new("Frame")
    frame.Name = name .. "Dropdown"
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = page

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamMedium
    label.Parent = frame

    local mainBtn = Instance.new("TextButton")
    mainBtn.Name = "MainBtn"
    mainBtn.Size = UDim2.new(0.5, -10, 1, 0)
    mainBtn.Position = UDim2.new(0.5, 0, 0, 0)
    mainBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    mainBtn.BorderSizePixel = 0
    mainBtn.Text = defaultOption
    mainBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    mainBtn.TextSize = 13
    mainBtn.Font = Enum.Font.GothamMedium
    mainBtn.Parent = frame

    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = "DropdownFrame"
    dropdownFrame.Size = UDim2.new(0.5, -10, 0, 0)
    dropdownFrame.Position = UDim2.new(0.5, 0, 0, 30)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    dropdownFrame.BorderSizePixel = 1
    dropdownFrame.BorderColor3 = Color3.fromRGB(50, 50, 55)
    dropdownFrame.ClipsDescendants = true
    dropdownFrame.Visible = false
    dropdownFrame.Parent = frame

    local listLayout = Instance.new("UIListLayout")
    listLayout.FillDirection = Enum.FillDirection.Vertical
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 2)
    listLayout.Parent = dropdownFrame

    local function updateDropdown(selected)
        dropdown.Selected = selected
        mainBtn.Text = selected
        dropdownFrame.Visible = false
        dropdown.Open = false
        callback(selected)
    end

    for _, option in ipairs(options) do
        local optBtn = Instance.new("TextButton")
        optBtn.Size = UDim2.new(1, 0, 0, 25)
        optBtn.BackgroundTransparency = 1
        optBtn.Text = option
        optBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        optBtn.TextSize = 13
        optBtn.Font = Enum.Font.GothamMedium
        optBtn.Parent = dropdownFrame

        optBtn.MouseButton1Click:Connect(function()
            updateDropdown(option)
        end)

        optBtn.MouseEnter:Connect(function()
            optBtn.BackgroundTransparency = 0.5
        end)
        optBtn.MouseLeave:Connect(function()
            optBtn.BackgroundTransparency = 1
        end)
    end

    mainBtn.MouseButton1Click:Connect(function()
        dropdown.Open = not dropdown.Open
        dropdownFrame.Visible = dropdown.Open
        if dropdown.Open then
            dropdownFrame.Size = UDim2.new(0.5, -10, 0, #options * 27)
        end
    end)

    dropdown.Frame = frame
    dropdown.Update = updateDropdown
    tab.Elements[#tab.Elements + 1] = dropdown

    return dropdown
end

-- ============================================
-- CREATE KEYBIND
-- ============================================
function CustomUI:CreateKeybind(tab, config, side)
    side = side or 1
    local name = config.Name or "Keybind"
    local defaultKey = config.DefaultKey or "None"
    local callback = config.Callback or function() end

    local page = self:GetActivePage(tab, side)
    local layout = self:GetActiveLayout(tab, side)

    local keybind = {}
    keybind.Name = name
    keybind.Key = defaultKey
    keybind.Listening = false

    local frame = Instance.new("Frame")
    frame.Name = name .. "Keybind"
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = page

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.GothamMedium
    label.Parent = frame

    local keyBtn = Instance.new("TextButton")
    keyBtn.Name = "KeyBtn"
    keyBtn.Size = UDim2.new(0.3, 0, 1, 0)
    keyBtn.Position = UDim2.new(0.7, 0, 0, 0)
    keyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    keyBtn.BorderSizePixel = 0
    keyBtn.Text = defaultKey
    keyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    keyBtn.TextSize = 13
    keyBtn.Font = Enum.Font.GothamMedium
    keyBtn.Parent = frame

    local function updateKey(key)
        local keyName = tostring(key):gsub("Enum.KeyCode.", "")
        if keyName == "Unknown" then keyName = "None" end
        keybind.Key = keyName
        keyBtn.Text = keyName
        keybind.Listening = false
        callback(keyName)
    end

    keyBtn.MouseButton1Click:Connect(function()
        keybind.Listening = not keybind.Listening
        if keybind.Listening then
            keyBtn.Text = "..."
            keyBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
            local con
            con = game:GetService("UserInputService").InputBegan:Connect(function(input, GPE)
                if GPE then return end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    con:Disconnect()
                    updateKey(input.KeyCode)
                    keyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
                end
            end)
        else
            keyBtn.Text = keybind.Key
            keyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        end
    end)

    keybind.Frame = frame
    keybind.Update = updateKey
    tab.Elements[#tab.Elements + 1] = keybind

    return keybind
end

-- ============================================
-- RETURN LIBRARY
-- ============================================
return CustomUI