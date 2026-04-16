local Reii = {}
Reii.__index = Reii

local Colors = {
    DarkBlue = Color3.fromRGB(15, 25, 50),
    LightBlue = Color3.fromRGB(150, 200, 255),
    PureWhite = Color3.fromRGB(255, 255, 255),
    LightPurple = Color3.fromRGB(200, 180, 255),
    Gold = Color3.fromRGB(255, 215, 100),
    GrayText = Color3.fromRGB(100, 100, 120),
}

local function ShowLoadingScreen()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    
    local Player = Players.LocalPlayer
    local PlayerGui = Player:WaitForChild("PlayerGui")
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ReiilLoadingScreen"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = PlayerGui
    
    local Background = Instance.new("Frame")
    Background.Name = "Background"
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Colors.DarkBlue
    Background.BorderSizePixel = 0
    Background.BackgroundTransparency = 1
    Background.Parent = ScreenGui
    
    for i = 1, 20 do
        Background.BackgroundTransparency = 1 - (i / 20) * 0.7
        RunService.RenderStepped:Wait()
    end
    Background.BackgroundTransparency = 0.3
    
    local GradientFrame = Instance.new("Frame")
    GradientFrame.Name = "GradientOverlay"
    GradientFrame.Size = UDim2.new(1, 0, 1, 0)
    GradientFrame.BackgroundColor3 = Color3.fromRGB(100, 150, 220)
    GradientFrame.BorderSizePixel = 0
    GradientFrame.BackgroundTransparency = 0.6
    GradientFrame.Parent = Background
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 60, 150)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 150, 220)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 180, 255))
    }
    Gradient.Rotation = 45
    Gradient.Parent = GradientFrame
    
    local MainContainer = Instance.new("Frame")
    MainContainer.Name = "MainContainer"
    MainContainer.Size = UDim2.new(0.5, 0, 0.5, 0)
    MainContainer.Position = UDim2.new(0.25, 0, 0.25, 0)
    MainContainer.BackgroundColor3 = Colors.PureWhite
    MainContainer.BorderSizePixel = 0
    MainContainer.BackgroundTransparency = 1
    MainContainer.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 25)
    UICorner.Parent = MainContainer
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Colors.LightBlue
    UIStroke.Thickness = 3
    UIStroke.Transparency = 1
    UIStroke.Parent = MainContainer
    
    for i = 1, 25 do
        MainContainer.BackgroundTransparency = 1 - (i / 25) * 0.05
        UIStroke.Transparency = 1 - (i / 25) * 0.3
        RunService.RenderStepped:Wait()
    end
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(1, 0, 0.25, 0)
    TitleLabel.Position = UDim2.new(0, 0, 0.05, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Colors.DarkBlue
    TitleLabel.TextSize = 50
    TitleLabel.Text = "✨ REII ✨"
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextTransparency = 1
    TitleLabel.Parent = MainContainer
    
    for i = 1, 20 do
        TitleLabel.TextTransparency = 1 - (i / 20)
        RunService.RenderStepped:Wait()
    end
    TitleLabel.TextTransparency = 0
    
    wait(0.5)
    
    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Name = "Subtitle"
    SubtitleLabel.Size = UDim2.new(0.9, 0, 0.15, 0)
    SubtitleLabel.Position = UDim2.new(0.05, 0, 0.3, 0)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.TextColor3 = Colors.GrayText
    SubtitleLabel.TextSize = 16
    SubtitleLabel.Text = "Loading your heavenly experience..."
    SubtitleLabel.Font = Enum.Font.Gotham
    SubtitleLabel.TextWrapped = true
    SubtitleLabel.TextTransparency = 1
    SubtitleLabel.Parent = MainContainer
    
    for i = 1, 15 do
        SubtitleLabel.TextTransparency = 1 - (i / 15)
        RunService.RenderStepped:Wait()
    end
    SubtitleLabel.TextTransparency = 0
    
    local BoxesContainer = Instance.new("Frame")
    BoxesContainer.Name = "BoxesContainer"
    BoxesContainer.Size = UDim2.new(0.85, 0, 0.35, 0)
    BoxesContainer.Position = UDim2.new(0.075, 0, 0.5, 0)
    BoxesContainer.BackgroundTransparency = 1
    BoxesContainer.BorderSizePixel = 0
    BoxesContainer.Parent = MainContainer
    
    local boxCount = 5
    local boxes = {}
    
    for i = 1, boxCount do
        local box = Instance.new("Frame")
        box.Name = "FloatingBox" .. i
        box.Size = UDim2.new(0.15, 0, 0.4, 0)
        box.Position = UDim2.new((i - 1) * 0.2, 0, 0, 0)
        box.BackgroundColor3 = Colors.LightBlue
        box.BorderSizePixel = 0
        box.BackgroundTransparency = 1
        box.Parent = BoxesContainer
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 15)
        corner.Parent = box
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Colors.LightPurple
        stroke.Thickness = 2
        stroke.Transparency = 1
        stroke.Parent = box
        
        table.insert(boxes, {frame = box, stroke = stroke})
    end
    
    local startTime = tick()
    local animationDuration = 2
    
    for idx, boxData in ipairs(boxes) do
        spawn(function()
            wait((idx - 1) * 0.2)
            
            local boxStartTime = tick()
            
            for i = 1, 20 do
                boxData.frame.BackgroundTransparency = 1 - (i / 20) * 0.1
                boxData.stroke.Transparency = 1 - (i / 20) * 0.5
                RunService.RenderStepped:Wait()
            end
            
            local floatStartTime = tick()
            while true do
                local elapsed = tick() - floatStartTime
                local sine = math.sin(elapsed * 2) * 15
                boxData.frame.Position = UDim2.new(
                    boxData.frame.Position.X.Scale, 
                    boxData.frame.Position.X.Offset, 
                    0.05 + sine / 1000, 
                    0
                )
                RunService.RenderStepped:Wait()
            end
        end)
    end
    
    wait(3)
    
    for i = 1, 30 do
        ScreenGui.BackgroundTransparency = ScreenGui.BackgroundTransparency + 0.05
        MainContainer.BackgroundTransparency = MainContainer.BackgroundTransparency + 0.05
        TitleLabel.TextTransparency = TitleLabel.TextTransparency + 0.05
        SubtitleLabel.TextTransparency = SubtitleLabel.TextTransparency + 0.05
        
        for _, boxData in ipairs(boxes) do
            boxData.frame.BackgroundTransparency = boxData.frame.BackgroundTransparency + 0.05
        end
        
        RunService.RenderStepped:Wait()
    end
    
    ScreenGui:Destroy()
end

function Reii.Init()
    ShowLoadingScreen()
    return Reii
end

function Reii.CreateWindow(title)
    return {}
end

function Reii.CreateSection(window, name)
    return {}
end

function Reii.CreateButton(section, text, callback)
    return {}
end

Reii.Init()

return Reii
