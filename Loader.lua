-- skid of the month the source is full chatgpt departK
-- “wannabetapper” a scammer and chagpt user all ur sources are from chatgpt
-- credits to @hegof. & @idontknowanymorehelpme
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua",true))()

getgenv().Depart = {
    ["Aimbot"] = {
        ["Enabled"] = true,
        ["Notifications"] = false,
        ["PINGBASED"] = false,
        ["PredictionValue"] = 0.143214443,
        ["Radius"] = 150,
        ["AirPrediction"] = 0.14633
    },
    ["AimbotCamlock"] = {
        ["Smoothness"] = 0.350,
        ["AirSmoothness"] = 0.217,
        ["Campred"] = 0.449,
        ["ShakeValue"] = 0,
        ["AimPart"] = "HumanoidRootPart"
    },
    ["FOVSettings"] = {
        ["FOVVisible"] = false,
        ["FOVSize"] = 150
    },
    ["Checks"] = {
        ["FriendCheck"] = false,
        ["UnlockOnKO"] = true,
        ["AntiGroundShots"] = true
    },
    ["Visuals"] = {
        ["Line"] = false,
        ["Highlight"] = false,
        ["Emoji"] = false,
        ["EmojiType"] = "🥵"
    },
    ["BulletRedirection"] = { 
        ["Enabled"] = true,
        ["HitPart"] = "HumanoidRootPart",
        ["AirPart"] = "Head",
        ["Prediction"] = 0.14633,
        ["AirPrediction"] = 0.129,
        ["FOV"] = {
            ["Visible"] = false,
            ["Size"] = 25
        },
        ["Checks"] = {
            ["WallCheck"] = true,
            ["FriendCheck"] = false,
            ["KOCheck"] = true,
            ["AntiGroundShots"] = true
        },
        ["Hitchance"] = {
            ["Value"] = 100
        }
    },
    ["Triggerbot"] = {
        ["Enabled"] = false,
        ["Delay"] = 0.2,
        ["TapDelay"] = 0.01,
        ["UsePrediction"] = true,
        ["Prediction"] = 0.125,
        ["Tolerance"] = 15,
        ["Distance"] = 300,
        ["FOVSize"] = 80,
        ["FOVShow"] = false,
        ["Whitelisted"] = {"[Double-Barrel SG]", "[DoubleBarrel]", "[Revolver]", "[TacticalShotgun]"},
        ["UseWhitelist"] = true, 
        ["AimParts"] = {"HumanoidRootPart", "Head"},
        ["WallCheck"] = true,
        ["KOCheck"] = true
    },
    ["Utility"] = {
        ["Tool"] = false,
        ["Button"] = true,
        ["ButtonSize"] = 150,
        ["Macro"] = true
    }
}

-- credits to chatgpt tapn with the method
--dont laugh at how gen it is i just used teh method

wait(0.5)
getgenv().Depart = getgenv().Depart
local plr = game:GetService("Players").LocalPlayer



local cclosure = syn_newcclosure or newcclosure or nil



if not cclosure or not hookmetamethod then

   plr:Kick("\n\nYour exploit doesn't support hookmetamethod\n")

end



local oldNamecall

oldNamecall = hookmetamethod(game, "__namecall", cclosure(function(self,...)

   local NamecallMethod = getnamecallmethod()

   local args = {...}

   

   if (NamecallMethod == "Kick" or NamecallMethod == "kick") and not checkcaller() then

       if self ~= plr then

           return oldNamecall(self,...)

       end

       return

   end

   

   return oldNamecall(self,...)

end))
        local function playIntro()
            local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "IntroScreen"
            screenGui.Parent = playerGui

            local frame = Instance.new("Frame")
            frame.Name = "IntroFrame"
            frame.Parent = screenGui
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 1

            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Name = "IntroImage"
            imageLabel.Parent = frame
            imageLabel.Size = UDim2.new(0.4, 0, 0.4, 0)
            imageLabel.Position = UDim2.new(0.3, 0, 0.3, 0)
            imageLabel.Image = "rbxassetid://137104433421526"
            imageLabel.BackgroundTransparency = 1
            imageLabel.ImageTransparency = 1

            local sound = Instance.new("Sound")
            sound.Name = "IntroSound"
            sound.Parent = frame
            sound.SoundId = "rbxassetid://7556198569"
            sound.Volume = 10
            sound:Play()

            local tweenService = game:GetService("TweenService")

            local blurEffect = Instance.new("BlurEffect")
            blurEffect.Parent = game.Lighting
            blurEffect.Size = 24

            local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

            local fadeIn = tweenService:Create(imageLabel, tweenInfo, {ImageTransparency = 0.5})
            local fadeOut = tweenService:Create(imageLabel, tweenInfo, {ImageTransparency = 1})
            local blurTween = tweenService:Create(blurEffect, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0})

            fadeIn:Play()
            fadeIn.Completed:Wait()

            wait(2)

            fadeOut:Play()
            fadeOut.Completed:Wait()

            blurTween:Play()
            blurTween.Completed:Wait()

            blurEffect:Destroy()
            screenGui:Destroy()
        end

        playIntro()
        
wait(0.5)
print("Loaded!")
if Depart.Aimbot.Enabled then
local CC = game:GetService("Workspace").CurrentCamera
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
placemarker.Anchored = true
placemarker.CanCollide = false
placemarker.Size = Vector3.new(6, 6, 6)
placemarker.Transparency = 1

local AimlockState = false
local Victim = nil
local Plr
local function shouldLockOntoPlayer(targetPlayer)
    -- If FriendCheck is enabled and the target is a friend, do not lock onto the player
    if Depart.Checks.FriendCheck then
        -- If FriendCheck is enabled and the target is a friend, return false to avoid locking onto friends
        if isFriend(targetPlayer) then
            return false
        end
    end
    -- If FriendCheck is disabled, allow locking onto friends
    return true
end


local function Notify(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification",
        Text = text,
        Duration = 2,
    })
end

local highlightInstance  -- Variable to hold the highlight instancegg

local function highlightPlayer(targetPlayer)
    if targetPlayer.Character then
        local highlight = Instance.new("Highlight")
        highlight.Parent = targetPlayer.Character
        highlight.FillColor = Color3.fromRGB(127, 0, 255)  -- Set the highlight color
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)  -- Set the outline color
        highlight.FillTransparency = 0.5  -- Set the transparency
        highlight.OutlineTransparency = 0.5  -- Set the outline transparency
        return highlight
    end
end




local function lockOntoPlayer(player)
    Plr = player
    AimlockState = true
    if Depart.Aimbot.Notifications then
        Notify("Locked On: " .. tostring(Plr.Name))
    end

    -- Apply highlight if Visuals.Highlight is enabled
    if Depart.Visuals.Highlight and player.Character then
        highlightInstance = highlightPlayer(player)  -- Call the highlight function
    end

    -- Create and show emoji if Emoji is enabled
    if Depart.Visuals.Emoji then
        if not emojiLabel then
            createEmoji()  -- Create emoji if it doesn't exist
        end
    end
end

local function unlockPlayer()
    AimlockState = false
    Plr = nil
    
    if Depart.Aimbot.Notifications then
        Notify("Unlocked")
    end
end

if Depart.Aimbot.PINGBASED then
    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    ping = tonumber(string.split(ping, '(')[1]) or 0 -- Safe parse
    
    if ping < 10 then
        Depart.Aimbot.PredictionValue = 0.10087127181718181 -- For pings below 10ms
    elseif ping < 20 then
        Depart.Aimbot.PredictionValue = 0.10087127181718181 -- Same as original for 10-20ms range
    elseif ping < 30 then
        Depart.Aimbot.PredictionValue = 0.11027333333333333 -- Updated for 20-30ms
    elseif ping < 40 then
        Depart.Aimbot.PredictionValue = 0.11561500000000001 -- Updated for 30-40ms
    elseif ping < 50 then
        Depart.Aimbot.PredictionValue = 0.12109333333333334 -- Updated for 40-50ms
    elseif ping < 60 then
        Depart.Aimbot.PredictionValue = 0.12670833333333334 -- Updated for 50-60ms
    elseif ping < 70 then
        Depart.Aimbot.PredictionValue = 0.13246 -- Updated for 60-70ms
    elseif ping < 80 then
        Depart.Aimbot.PredictionValue = 0.13834833333333335 -- Updated for 70-80ms
    elseif ping < 90 then
        Depart.Aimbot.PredictionValue = 0.14437333333333335 -- Updated for 80-90ms
    elseif ping < 100 then
        Depart.Aimbot.PredictionValue = 0.15053500000000003 -- Updated for 90-100ms
    elseif ping < 110 then
        Depart.Aimbot.PredictionValue = 0.15683333333333335 -- Updated for 100-110ms
    elseif ping < 120 then
        Depart.Aimbot.PredictionValue = 0.16326833333333332 -- Updated for 110-120ms
    elseif ping < 130 then
        Depart.Aimbot.PredictionValue = 0.16984 -- Updated for 120-130ms
    elseif ping < 140 then
        Depart.Aimbot.PredictionValue = 0.17654833333333333 -- Updated for 130-140ms
    elseif ping < 150 then
        Depart.Aimbot.PredictionValue = 0.18339333333333335 -- Updated for 140-150ms
    elseif ping < 160 then
        Depart.Aimbot.PredictionValue = 0.190375 -- Updated for 150-160ms
    elseif ping < 170 then
        Depart.Aimbot.PredictionValue = 0.19749333333333333 -- Updated for 160-170ms
    elseif ping < 180 then
        Depart.Aimbot.PredictionValue = 0.20474833333333334 -- Updated for 170-180ms
    elseif ping < 190 then
        Depart.Aimbot.PredictionValue = 0.21214 -- Updated for 180-190ms
    elseif ping < 200 then
        Depart.Aimbot.PredictionValue = 0.21966833333333335 -- Updated for 190-200ms
    else
        Depart.Aimbot.PredictionValue = 0.22733333333333333 -- For pings above 200ms
    end
end




local function isFriend(player)
    return player:IsFriendsWith(game.Players.LocalPlayer.UserId)
end
local function unlockIfKOedOrFriend(victim)
    local koCheck = victim.Character:FindFirstChild("BodyEffects") and victim.Character.BodyEffects:FindFirstChild("K.O")
    local grabbedCheck = victim.Character:FindFirstChild("GRABBING_CONSTRAINT")
    
    -- Check if the target is K.O. or grabbed, and also utilize the shouldLockOntoPlayer check
    if (koCheck and koCheck.Value) or grabbedCheck or not shouldLockOntoPlayer(victim) then
        AimlockState = false
        Victim = nil
    end
end



game:GetService("RunService").Heartbeat:Connect(function()
    if AimlockState and Victim then
        unlockIfKOedOrFriend(Victim)
    end
end)





local function getClosestPlayerInFOV()
    local closestPlayer = nil
    local shortestDistance = Depart.FOVSettings.FOVSize
    local screenCenter = Vector2.new(CC.ViewportSize.X / 2, CC.ViewportSize.Y / 2)
    local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Humanoid") and otherPlayer.Character.Humanoid.Health > 0 then
            -- Check if the player should be locked onto, considering FriendCheck
            if shouldLockOntoPlayer(otherPlayer) then
                local humanoidRootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local distance = (humanoidRootPart.Position - playerPosition).magnitude
                    if distance <= Depart.Aimbot.Radius then
                        local pos = CC:WorldToViewportPoint(humanoidRootPart.Position)
                        local fovPos = Vector2.new(pos.X, pos.Y)
                        local magnitude = (fovPos - screenCenter).magnitude
                        
                        if magnitude < Depart.FOVSettings.FOVSize and magnitude < shortestDistance then
                            closestPlayer = otherPlayer
                            shortestDistance = magnitude
                        end
                    end
                end
            end
        end
    end
    return closestPlayer
end


-- Create the Drawing line
local line = Drawing.new("Line")
line.Thickness = 2 -- Set the thickness of the line
line.Color = Color3.fromRGB(127, 0, 255) -- Set the color of the line (e.g., red)
line.Visible = false -- Initially not visible
line.Transparency = 1 -- Fully transparent initially




local emojiLabel -- Declare the emoji label variable

local function isTargetInAir(character)
    return character.Humanoid.FloorMaterial == Enum.Material.Air
end

local function updateAimlockAndMarker()
    if AimlockState and Victim and Victim.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local aimPart = Depart.AimbotCamlock.AimPart
            local target = Victim.Character[aimPart]

            -- AntiGroundShots logic
            if Depart.Checks.AntiGroundShots and Victim.Character then
                local targetBone = Victim.Character:FindFirstChild(aimPart)
                if targetBone and targetBone.Velocity.Y < 0 then
                    targetBone.Velocity = Vector3.new(targetBone.Velocity.X, 0, targetBone.Velocity.Z)
                    targetBone.AssemblyLinearVelocity = Vector3.new(targetBone.Velocity.X, 0, targetBone.Velocity.Z)
                end
            end

            if target then
                -- Calculate the target's predicted position
                local targetVelocity = Victim.Character[aimPart].Velocity
                local predictedPosition = target.Position + (targetVelocity * Depart.Aimbot.PredictionValue)

                -- Use isTargetInAir to adjust prediction when the target is jumping
                if isTargetInAir(Victim.Character) then
                    predictedPosition = predictedPosition + (targetVelocity * Depart.Aimbot.AirPrediction)
                end

                local LookPosition = CFrame.new(CC.CFrame.p, predictedPosition)
                CC.CFrame = CC.CFrame:Lerp(LookPosition, Depart.AimbotCamlock.Smoothness)
                placemarker.CFrame = CFrame.new(Victim.Character.HumanoidRootPart.Position)

                -- Update emoji position if enabled
                if Depart.Visuals.Emoji then
                    if not emojiLabel then
                        emojiLabel = Drawing.new("Text")
                        emojiLabel.Text = Depart.Visuals.EmojiType
                        emojiLabel.Size = 30
                        emojiLabel.Color = Color3.fromRGB(255, 255, 255)
                    end
                    local targetScreenPos = CC:WorldToViewportPoint(predictedPosition)
                    emojiLabel.Position = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
                    emojiLabel.Visible = true
                end

                -- Calculate the 2D positions for the line drawing
                local targetScreenPos = CC:WorldToViewportPoint(Victim.Character.HumanoidRootPart.Position)
                local predictedScreenPos = CC:WorldToViewportPoint(predictedPosition)

                if Depart.Visuals.Line then
                    line.From = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
                    line.To = Vector2.new(predictedScreenPos.X, predictedScreenPos.Y)
                    line.Visible = true
                end
            end
        end
    else
        placemarker.CFrame = CFrame.new(0, 9999, 0)
        line.Visible = false

        if emojiLabel then
            emojiLabel.Visible = false
            emojiLabel:Destroy()
            emojiLabel = nil
        end
        if highlightInstance then
            highlightInstance:Destroy()
            highlightInstance = nil
        end
    end
end


game:GetService("RunService").RenderStepped:Connect(function()
    updateAimlockAndMarker()
end)

-- Create a Screen GUI for toggle button only if Button is enabled
if Depart.Utility.Button then
    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.ResetOnSpawn = false

    local toggleButton = Instance.new("ImageButton")
    toggleButton.Parent = screenGui
    local buttonSize = Depart.Utility.ButtonSize
    toggleButton.Size = UDim2.new(0, buttonSize, 0, buttonSize) -- Set both width and height to the same value
    toggleButton.Position = UDim2.new(0.5, -buttonSize / 2, 0.8, -buttonSize / 2) -- Center the button
    toggleButton.Image = "rbxassetid://137104433421526" -- Replace with the actual image asset ID
    toggleButton.BackgroundTransparency = 1 -- Set to 1 for a transparent background


    local function toggleAimlock()
        if Depart.Aimbot.Enabled then
            AimlockState = not AimlockState
            if AimlockState then
                Victim = getClosestPlayerInFOV()
                if Victim then
                    lockOntoPlayer(Victim)
                else
                    unlockPlayer()
                end
            else
                unlockPlayer()
            end
        end
    end

    toggleButton.MouseButton1Click:Connect(toggleAimlock)

    -- Mobile Draggable Functionality
    local dragging, dragStart, startPos = false, nil, nil
    toggleButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = toggleButton.Position
        end
    end)

    toggleButton.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            toggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    toggleButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end
local tool
if Depart.Utility.Tool then
    tool = Instance.new("Tool")
    tool.Name = "LockTool"
    tool.RequiresHandle = false
    tool.Parent = player.Backpack
tool.Activated:Connect(function()
    if Depart.Aimbot.Enabled then
        AimlockState = not AimlockState
        if AimlockState then
            Victim = getClosestPlayerInFOV()
            if Victim then
                lockOntoPlayer(Victim)
            else
                unlockPlayer()
            end
        else
            unlockPlayer()
        end
    end
end)
end

spawn(function()

    placemarker.Anchored = true
    placemarker.CanCollide = false
    placemarker.Size = Vector3.new(6, 6, 6)
    placemarker.Transparency = 1
end)

-- Patch to prevent FPS drop
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if AimlockState and getnamecallmethod() == "FireServer" then
        if args[2] == "UpdateMousePos" or args[2] == "MOUSE" or args[2] == "UpdateMousePosI2" or args[2] == "MousePosUpdate" then
            if Depart.Aimbot.Enabled and Plr and Plr.Character then
                args[3] = Plr.Character[Depart.AimbotCamlock.AimPart].Position + (Plr.Character[Depart.AimbotCamlock.AimPart].Velocity * Depart.Aimbot.PredictionValue) -- Prediction based on position
                return old(unpack(args))
            end
        end
    end
    return old(...)
end)

-- Clean-up on character removal
player.CharacterRemoving:Connect(function
