local library = loadstring(game:HttpGet("https://www.tealingg.xyz/library/source.lua"))()
local window = library.new("Two Piece", "Dark")

local Farm = window:addPage("Farming")
local Tp = window:addPage("Teleport")
local Misc = window:addPage("Misc")
local Credits = window:addPage("Credits")

--//Farming\\--
Farm:addButton("-+ Auto Farm Boss +-",function()
end)
local boss = {}
for i,v in pairs(game:GetService("Workspace")["บอส"]:GetChildren()) do
    if v:IsA("Model") then
       table.insert(boss , v.Name) 
    end
end
local useboss
Farm:addDropdown("Boss",boss,1,function(mob) --Replace the Dropdown name with the selected one(A,B,C)
    useboss = mob
    print("Use : "..useboss)
end)

local distance = 3
Farm:addSlider("Distance", 3, 3, 50, function(value)
    distance = value
end)
local opefarm = false
Farm:addToggle("Ope Farm",false,function(bool)
    opefarm = bool
end)
local autofarm = false
Farm:addToggle("Auto Farm",false,function(bool)
    autofarm = bool
end)
spawn(function()
while wait(0) do
    if autofarm == true then
        if opefarm == true then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Ope") then
                game.Players.LocalPlayer.Backpack.Ope.Parent = game.Players.LocalPlayer.Character
            end
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["บอส"][useboss].HumanoidRootPart.CFrame * CFrame.new(0,0,distance)
           game:GetService("Workspace")["บอส"][useboss].HumanoidRootPart.Anchored = true
           workspace[game.Players.LocalPlayer.Name].Ope.LightBeam.Fire:FireServer(unpack({
              [1] = game:GetService("Players").LocalPlayer,
           }))
           else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["บอส"][useboss].HumanoidRootPart.CFrame * CFrame.new(0,0,distance)
            game:GetService("Workspace")["บอส"][useboss].HumanoidRootPart.Anchored = true
        end
    end
end
end)
--//Teleport\\--
Tp:addButton("-+ Auto Item & Devil Fruit +-",function()
end)

local autoitem  = false
Tp:addToggle("Auto Item",false,function(bool)
    autoitem = bool
end)

local autofruit = false
Tp:addToggle("Auto Devil Fruit (Drop)",false,function(bool)
    autofruit = bool
end)

Tp:addButton("-+ Auto Chest +-",function()
end)

Tp:addButton("Tp Chest",function()
    for i,v in pairs(game:GetService("Workspace").chest:GetChildren()) do
        if v:IsA("UnionOperation") then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
        end
    end
end)
local autochest = false
Tp:addToggle("Auto Chest",false,function(bool)
    autochest = bool
end)

spawn(function()
    while wait(0) do
        if autoitem == true then
            for i,v in pairs(game:GetService("Workspace").DevilFruitSpawner.SpawnedDFS:GetChildren()) do
               if v:IsA("Tool") then
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                end
            end
            wait(2.5)
        elseif autochest == true then
        for i,v in pairs(game:GetService("Workspace").chest:GetChildren()) do
        if v:IsA("UnionOperation") then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
        end
        end
        elseif autofruit == true then
        for i,v in pairs(game.workspace:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
               game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end
        end
    end
end)
--//Misc\\--
Misc:addButton("-+ Players +-",function()
end)
Misc:addSlider("WalkSpeed", 16, 16, 100, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value 
end)
Misc:addSlider("JumpPower", 50, 50, 300, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)
Misc:addButton("-+ Auto Stats +-",function()
end)
local stats = "Melee"
Misc:addDropdown("Stats",{"Melee","Defense","Devil Fruit","Sword"},1,function(mob) --Replace the Dropdown name with the selected one(A,B,C)
    if mob == "Devil Fruit" then
       stats = "DF" 
    else
        stats = mob
    end
end)
local autostats = false
Misc:addToggle("AutoStats",false,function(bool)
    autostats = bool
end)

spawn(function()
while wait(0) do
    if autostats == true then
       game:GetService("ReplicatedStorage").StatSystem.Points:FireServer(unpack({
          [1] = stats,
       }))
       wait()
    end
end
end)
--//Credits\\--
Credits:addButton("Discord : Sinny#7741",function()
    print("Sinny#7741")
end)

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
    autochest= false
    autofarm = false
    opefarm = false
    autofruit = false
end)
window:selectPage(window.pages[1])