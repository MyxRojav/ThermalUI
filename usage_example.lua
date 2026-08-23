local CustomUI = loadstring(game:HttpGet("https://pastebin.com/raw/YOUR_SCRIPT_ID"))()

-- Create window
local window = CustomUI:CreateWindow({
    LogoID = "rbxassetid://137394765830675",
    TopText = "Welcome to ThermalUI!"
})

-- Create tabs
local Tab1 = CustomUI:CreateTab(window, { Name = "Page 1" })
local Tab2 = CustomUI:CreateTab(window, { Name = "Page 2" })
local Tab3 = CustomUI:CreateTab(window, { Name = "Page 3" })

-- ===== MAIN TAB (LEFT SIDE = 1, RIGHT SIDE = 2) =====

-- Aimbot section (left)
CustomUI:CreateSection(mainTab, { Name = "Aimbot" }, 1)

CustomUI:CreateToggle(mainTab, {
    Name = "Toggle1",
    DefaultValue = false,
    Callback = function(v)
        if v then _G.Aimbot.Start() else _G.Aimbot.Stop() end
    end
}, 1)

CustomUI:CreateSlider(mainTab, {
    Name = "Slider",
    Min = 1,
    Max = 20,
    Increment = 1,
    DefaultValue = 8,
    Callback = function(v)
        print("hello shithole")
    end
}, 1)

CustomUI:CreateDropdown(mainTab, {
    Name = "Dropdown",
    Options = {"Option 1", "Option 2", "Option 3"},
    DefaultOption = "Head",
    Callback = function(v)
        print("hello shithole")
    end
}, 1)

-- ESP section (right)
CustomUI:CreateSection(mainTab, { Name = "Section" }, 2)

CustomUI:CreateToggle(mainTab, {
    Name = "Toggle",
    DefaultValue = false,
    Callback = function(v)
        print("hello shithole")
    end
}, 2)

CustomUI:CreateColorPicker? -- not supported yet

-- ===== SETTINGS TAB =====

CustomUI:CreateButton(settingsTab, {
    Name = "Button",
    Callback = function()
        print("hello shithole")
    end
}, 1)

CustomUI:CreateButton(settingsTab, {
    Name = "Button",
    Callback = function()
        print("hello shithole")
    end
}, 1)

-- ===== MISC TAB =====

CustomUI:CreateButton(miscTab, {
    Name = "Button",
    Callback = function()
        print("hello shithole")
    end
}, 1)

CustomUI:CreateButton(miscTab, {
    Name = "Button",
    Callback = function()
        print("hello shithole")
    end
}, 1)

CustomUI:CreateButton(miscTab, {
    Name = "Button",
    Callback = function()
        print("hello shithole")
    end
}, 1)
