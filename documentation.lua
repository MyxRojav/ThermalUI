-- ============================================
-- SHOWCASE — Test All UI Elements
-- ============================================

local CustomUI = loadstring(game:HttpGet("https://pastebin.com/raw/your-custom-ui-code"))()

local window = CustomUI:CreateWindow({
    LogoID = "rbxassetid://137394765830675",
    TopText = "MYX Arsenal v2.0 | UI Showcase",
    UIKeybind = "RightControl"
})

-- ============================================
-- TEST TAB
-- ============================================
local testTab = CustomUI:CreateTab(window, { Name = "Test" })

-- ===== SECTION 1 (Left Side) =====
local section1 = CustomUI:CreateSection(testTab, { Name = "Toggles & Buttons" }, 1)

-- Toggle
CustomUI:CreateToggle(testTab, {
    Name = "Toggle 1",
    DefaultValue = false,
    Callback = function(v)
        print("Toggle 1:", v)
    end
}, 1)

CustomUI:CreateToggle(testTab, {
    Name = "Toggle 2",
    DefaultValue = true,
    Callback = function(v)
        print("Toggle 2:", v)
    end
}, 1)

-- Button
CustomUI:CreateButton(testTab, {
    Name = "Button 1",
    Callback = function()
        print("Button 1 clicked!")
    end
}, 1)

CustomUI:CreateButton(testTab, {
    Name = "Button 2",
    Callback = function()
        print("Button 2 clicked!")
    end
}, 1)

-- ===== SECTION 2 (Left Side) =====
local section2 = CustomUI:CreateSection(testTab, { Name = "Sliders & Dropdowns" }, 1)

-- Slider
CustomUI:CreateSlider(testTab, {
    Name = "Slider 1",
    Min = 0,
    Max = 100,
    Increment = 1,
    DefaultValue = 50,
    Callback = function(v)
        print("Slider 1:", v)
    end
}, 1)

CustomUI:CreateSlider(testTab, {
    Name = "Slider 2",
    Min = 1,
    Max = 20,
    Increment = 1,
    DefaultValue = 8,
    Callback = function(v)
        print("Slider 2:", v)
    end
}, 1)

-- Dropdown
CustomUI:CreateDropdown(testTab, {
    Name = "Dropdown 1",
    Options = {"Option A", "Option B", "Option C"},
    DefaultOption = "Option A",
    Callback = function(v)
        print("Dropdown 1:", v)
    end
}, 1)

-- ===== SECTION 3 (Right Side) =====
local section3 = CustomUI:CreateSection(testTab, { Name = "Keybinds & More" }, 2)

-- Keybind
CustomUI:CreateKeybind(testTab, {
    Name = "Keybind 1",
    DefaultKey = "F",
    Callback = function(v)
        print("Keybind 1 set to:", v)
    end
}, 2)

CustomUI:CreateKeybind(testTab, {
    Name = "Keybind 2",
    DefaultKey = "RightControl",
    Callback = function(v)
        print("Keybind 2 set to:", v)
    end
}, 2)

-- More buttons on right
CustomUI:CreateButton(testTab, {
    Name = "Right Button 1",
    Callback = function()
        print("Right Button 1 clicked!")
    end
}, 2)

CustomUI:CreateButton(testTab, {
    Name = "Right Button 2",
    Callback = function()
        print("Right Button 2 clicked!")
    end
}, 2)

-- ============================================
-- SECOND TAB
-- ============================================
local secondTab = CustomUI:CreateTab(window, { Name = "Second" })

CustomUI:CreateSection(secondTab, { Name = "More Toggles" }, 1)

CustomUI:CreateToggle(secondTab, {
    Name = "Toggle A",
    DefaultValue = false,
    Callback = function(v)
        print("Toggle A:", v)
    end
}, 1)

CustomUI:CreateToggle(secondTab, {
    Name = "Toggle B",
    DefaultValue = false,
    Callback = function(v)
        print("Toggle B:", v)
    end
}, 1)

CustomUI:CreateSlider(secondTab, {
    Name = "Slider 3",
    Min = 0,
    Max = 500,
    Increment = 5,
    DefaultValue = 250,
    Callback = function(v)
        print("Slider 3:", v)
    end
}, 2)

-- ============================================
-- THIRD TAB
-- ============================================
local thirdTab = CustomUI:CreateTab(window, { Name = "Third" })

CustomUI:CreateSection(thirdTab, { Name = "Utilities" }, 1)

CustomUI:CreateButton(thirdTab, {
    Name = "Close UI",
    Callback = function()
        window.ThermalUI:Destroy()
    end
}, 1)

CustomUI:CreateButton(thirdTab, {
    Name = "Minimize UI",
    Callback = function()
        window:Toggle()
    end
}, 1)

CustomUI:CreateButton(thirdTab, {
    Name = "Print All Settings",
    Callback = function()
        print("=== ALL TOGGLES ===")
        for _, tab in ipairs(window.Tabs) do
            print("Tab:", tab.Name)
            for _, el in ipairs(tab.Elements) do
                if el.Value ~= nil then
                    print("  " .. el.Name .. ":", el.Value)
                end
            end
        end
    end
}, 1)

print("UI Showcase loaded! Toggle UI with RightControl.")

local settingsTab = CustomUI:CreateTab(window, { Name = "Settings" })

CustomUI:CreateKeybind(settingsTab, {
    Name = "UI Toggle Keybind",
    DefaultKey = "RightControl",
    Callback = function(key)
        -- Update the UI's toggle keybind
        window:SetKeybind(key)
        print("UI keybind set to:", key)
    end
}, 1)
