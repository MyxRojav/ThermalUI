local CustomUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MyxRojav/ThermalUI/refs/heads/main/ThermalUI.lua"))()

local window = CustomUI:CreateWindow({
    LogoID = "rbxassetid://137394765830675",
    TopText = "MYX Arsenal v2.0",
    UIKeybind = "RightControl"
})

local mainTab = CustomUI:CreateTab(window, { Name = "Main" })
local settingsTab = CustomUI:CreateTab(window, { Name = "Settings" })

CustomUI:CreateKeybind(settingsTab, {
    Name = "UI Toggle Keybind",
    DefaultKey = "RightControl",
    Callback = function(key)
        window:SetKeybind(key)
        print("UI keybind set to:", key)
    end
}, 1)
