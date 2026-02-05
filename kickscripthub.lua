-- Admin Panel by Gemini for Master
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local PlayerList = Instance.new("ScrollingFrame")
local KickButton = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local CloseButton = Instance.new("TextButton")

-- UI Setup
ScreenGui.Parent = game.CoreGui

MainFrame.Name = "MasterPanel"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -160)
MainFrame.Size = UDim2.new(0, 220, 0, 340)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Text = "ADMIN PANEL"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold

CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextSize = 20
CloseButton.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

PlayerList.Name = "List"
PlayerList.Parent = MainFrame
PlayerList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PlayerList.Position = UDim2.new(0, 10, 0, 40)
PlayerList.Size = UDim2.new(0, 200, 0, 230)
PlayerList.CanvasSize = UDim2.new(0, 0, 5, 0)
PlayerList.ScrollBarThickness = 3

UIListLayout.Parent = PlayerList
UIListLayout.Padding = UDim.new(0, 5)

KickButton.Name = "KickAction"
KickButton.Parent = MainFrame
KickButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
KickButton.Position = UDim2.new(0, 10, 0, 285)
KickButton.Size = UDim2.new(0, 200, 0, 45)
KickButton.Text = "طرد اللاعب"
KickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KickButton.Font = Enum.Font.SourceSansBold
KickButton.TextSize = 22

local BtnCorner = Instance.new("UICorner")
BtnCorner.Parent = KickButton

local selectedPlayer = nil

-- Update Player List Function
local function updateList()
    for _, item in pairs(PlayerList:GetChildren()) do
        if item:IsA("TextButton") then item:Destroy() end
    end
    
    for _, p in pairs(game.Players:GetPlayers()) do
        local pBtn = Instance.new("TextButton")
        pBtn.Parent = PlayerList
        pBtn.Size = UDim2.new(1, -5, 0, 35)
        pBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        pBtn.Text = p.Name
        pBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        local pCorner = Instance.new("UICorner")
        pCorner.Parent = pBtn

        pBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(PlayerList:GetChildren()) do
                if v:IsA("TextButton") then v.BackgroundColor3 = Color3.fromRGB(40, 40, 40) end
            end
            pBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- المربع يصبح أخضر
            selectedPlayer = p
        end)
    end
end

-- Kick Logic
KickButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        -- الرسالة المطلوبة من السيد
        selectedPlayer:Kick("Rip_dark67084 تم طردك بواسطه")
    end
end)

game.Players.PlayerAdded:Connect(updateList)
game.Players.PlayerRemoving:Connect(updateList)
updateList()

