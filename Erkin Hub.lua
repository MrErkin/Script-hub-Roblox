local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Erkin Hub Slap battels", "RJTheme3")
local Tab = Window:NewTab("Main Scripts")
local Section = Tab:NewSection("Scripts")

-- Кнопка Fly 
Section:NewButton("Fly", "Activate flying", function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
end)

-- Кнопка WalkSpeed 
Section:NewToggle("WalkSpeed", "Walk Speed 200", function(state)
    if state then
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 200
end

end)

-- Кнопка JumpPower 
Section:NewButton("High Jump", "Increase jump height", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)

-- Кнопка Reset 
Section:NewButton("Reset Stats", "Reset speed and jump", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

local noclipEnabled = false
local noclipConnection = nil

Section:NewToggle("NoClip", "Activate/Deactivate NoClip", function(state)
    noclipEnabled = state
    
    if state then
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            if game.Players.LocalPlayer.Character then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
    end
end)
local Tab = Window:NewTab("Slap battels")
local Section = Tab:NewSection("Scripts Slap battels")
Section:NewButton("AnticheatBypass", "Activate Bypass", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()
end)
Section:NewButton("Instant Debug", "Get Debug glove", function()
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.5)

local room = game:GetService("Workspace"):WaitForChild("Debug Room")
local fcd = function(instance) 
    fireclickdetector(instance:FindFirstChild("ClickDetector"))
    task.wait(0.1)
end

fcd(room.Keypad.Buttons[room.DuckTable.DuckTable.Duckies.Value])
fcd(room.Keypad.Buttons[room.AdminGloves.GlovesCode.SurfaceGui.AdminNumber.Text])
fcd(room.Keypad.Buttons[room.Maze.MazePrize.SurfaceGui.MazeNumber.Text])
fcd(room.Keypad.Buttons["7"])
fcd(room.Keypad.Buttons.Enter)
end)
Section:NewButton("Tp barzil", "Перемещает в Барзил", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Lobby.brazil:GetChildren()[20].CFrame
end)
Section:NewButton("instant riftshot", "Моментальное получение перчатки riftshot", function()
 game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-260, 16, 477)
task.wait(1)
game:GetService("ReplicatedStorage").RemoteEvents.TargetPractice.OnComplete:FireServer()
end)
Section:NewButton("instant box glove", "Моментальное получение перчатки box", function()
 game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Buildings.house.Chimney.Model:GetChildren()[17].CFrame
task.wait(1)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.BoxingGloves.CFrame
local
fireclickdetector(instance:FindFirstChild("ClickDetector"))
    task.wait(0.1)
end)
local Tab = Window:NewTab("Farm")  -- Создаём новую вкладку
local Section = Tab:NewSection("Auto Farm")  -- Создаём секцию внутри вкладки

-- Кнопка фарма Slapples
Section:NewButton("AutoFarm Slapples", "Собирает все Slapples на острове", function()
    if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
        for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                if (v.Name == "Slapple" or v.Name == "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
                end
            end
        end
    end
end)

-- Тумблер автофарма Slapples (будет работать постоянно)
Section:NewToggle("Auto Slapples", "Автоматически собирать Slapples", function(state)
    _G.SlappleFarm = state
    if state then
        spawn(function()
            while _G.SlappleFarm do
                if game.Players.LocalPlayer.Character:FindFirstChild("entered") then
                    for i, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
                        if (v.Name == "Slapple" or v.Name == "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Glove, 1)
                        end
                    end
                end
                task.wait()
            end
        end)
    end
end)

-- Тумблер фарма конфет (Candy Corns)
Section:NewToggle("Auto Candy", "Автоматически собирать конфеты", function(state)
    _G.CandyFarm = state
    if state then
        spawn(function()
            while _G.CandyFarm do
                for i, v in pairs(game.Workspace.CandyCorns:GetChildren()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("Head") and v:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(game.Players.LocalPlayer.Character.Head, v, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.Head, v, 1)
                    end
                end
                task.wait()
            end
        end)
    end
end)

-- Тумблер фарма подарков (Gifts)
Section:NewToggle("Auto Gift", "Автоматически собирать подарки", function(state)
    _G.GiftFarm = state
    if state then
        spawn(function()
            while _G.GiftFarm do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Gift" then
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), v, 1)
                    end
                end
                task.wait()
            end
        end)
    end
end)

-- Тумблер фарма сфер (Phase или Jet Orb)
Section:NewToggle("Auto Orb", "Автоматически собирать Phase/Jet сферы", function(state)
    _G.OrbFarm = state
    if state then
        spawn(function()
            while _G.OrbFarm do
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "JetOrb" or v.Name == "PhaseOrb" then
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                    end
                end
                task.wait()
            end
        end)
    end
end)
