local player = game:GetService("Players").LocalPlayer
local timer = player.PlayerGui.ScreenGui.Timer
local winFolder = game:GetService("Workspace").Winparts
local character = player.Character
local currLevel = 2.2

function winTP(level)
    print("Attempting to teleport to level " .. currLevel)
    for i, v in pairs(winFolder:getChildren()) do
        if v.Name == tostring(currLevel) then
            character.HumanoidRootPart.CFrame = v.WinPart.CFrame
            print("Teleported to level " .. currLevel)
        end
    end
end

character.HumanoidRootPart.Touched:Connect(function(hit)
    if hit.Name == "WinPart" then
        currLevel = currLevel + 0.1
        currLevel = string.format("%.1f", currLevel)
        print("Level has been updated to " .. currLevel)
        if currLevel == 2.7 then
            currLevel = 2.1
        end
    end
end)

while timer.Visible do
    wait(5)
    winTP(currLevel)
end