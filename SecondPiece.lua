local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/flamingboy44/Turtle-Lib/main/source.lua"))()
local window = library:Window("Window")



local player = game:FindService("Players").LocalPlayer
local tpGUI = player.PlayerGui.TeleportGUI["Teleport"]["Load Teleport"]["Teleport"]
local FillTable = {}
local ATable = tpGUI:GetChildren()

for _,v in pairs(ATable) do
    if v:IsA("Part") then
        table.insert(FillTable, tostring(v.Name))
    end
end

for i = 1, #FillTable do
    print(FillTable[i])
end

-- Name, table with names of the button that you want, callback that will be called with the name of the button that was pressed

local dropdown = window:Dropdown("Test", FillTable, function(name)
    print(name, player.Character.Name)
    local RedefinedtpGUI = player.PlayerGui.TeleportGUI["Teleport"]["Load Teleport"]["Teleport"]
    player.Character:FindFirstChild("HumanoidRootPart").CFrame = RedefinedtpGUI:FindFirstChild(name).CFrame
end)