# Welcome to ThermalUI!

Thermal UI is a barebones UI made for me to use in Bamboozle.hax Scripts (found at https://dsc.gg/myxhub) cause i was bored of the other ui's acting like shit

## BEFORE YOU USE IT

as i said this is a work in development and a barebones UI, any update can break it so do as you please

# Thermal UI by RojavTryhard
![Thermal](https://raw.githubusercontent.com/MyxRojav/ThermalUI/refs/heads/main/Thermal%20UI%20banner.png)


## Botting the library
```lua
local CustomUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MyxRojav/ThermalUI/refs/heads/main/ThermalUI.lua"))()
```
## Creating the Window
```lua
local window = CustomUI:CreateWindow({
    LogoID = "rbxassetid://YOUR_IMAGE_ID",  -- optional, but the big ass image is kinda the whole point of the UI lmao
    TopText = "Welcome to Thermal UI!"      -- optional, just adds a text shit in top left
})
```
> btw ```RightCtrl``` to toggle is hard-coded rn cause i had issues with custom keybind for some obscure reason, anyways you have that and a toggle box for the mobile users

## Making the Tabs
```lua
local Tab = CustomUI:CreateTab(window, {
    Name = "Tab 1"
})
```

### Creating a section
```lua
CustomUI:CreateSection(Tab, {
    Name = "Section"
}, side) -- 'side' refers to the 2 sides the script has to put toggles, 1 is for the left side and 2 is for the right side
```
> change ```side``` to 1 or 2 depending on what side you want the section to be on!!! 1 for left and 2 for right!!!!

## Creating a Toggle
```lua
local toggle = CustomUI:CreateToggle(Tab, {
    Name = "Toggle",
    DefaultValue = false,
    Callback = function(value)
        print(value)
    end
}, side) --dont forget to change the side to 1 for left and 2 for right!!!!!!!
```
> im saying it again here change ```side``` to 1 for the left side and 2 for the right side!
