local window = CustomUI:CreateWindow({
    LogoID = "rbxassetid://137394765830675",
    TopText = "MYX Arsenal v2.0",
    UIKeybind = "RightControl"
})

local settingsTab = CustomUI:CreateTab(window, { Name = "Settings" })

CustomUI:CreateKeybind(settingsTab, {
    Name = "UI Toggle Keybind",
    DefaultKey = "RightControl",
    Callback = function(key)
        window:SetKeybind(key)  -- updates the UI toggle key
        print("UI keybind set to:", key)
    end
}, 1)
