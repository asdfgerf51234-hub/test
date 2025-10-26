local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Remotes
local SetTechnique = ReplicatedStorage:WaitForChild("SetTechnique")
local SetRace = ReplicatedStorage:WaitForChild("SetRace")
local SetClan = ReplicatedStorage:WaitForChild("SetClan")
local information = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("information")

local auraRunning = false
local auraCoroutine
local crashRunning = false
local crashCoroutine

local validKey = "MrPeabodyLooksMaxxing"

local userHasAccess = false
if player:GetAttribute("HasJJKey") == true then
    userHasAccess = true
end

local function createMainUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "JJLegacyV1"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 300, 0, 340)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -170)
    mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.ClipsDescendants = true

    local title = Instance.new("TextLabel", mainFrame)
    title.Text = "JJ Legacy V1"
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255, 115, 0)
    title.BackgroundTransparency = 1

    local closeBtn = Instance.new("TextButton", mainFrame)
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 24
    closeBtn.TextColor3 = Color3.fromRGB(255, 85, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    closeBtn.MouseButton1Click:Connect(function()
        auraRunning = false
        crashRunning = false
        screenGui:Destroy()
    end)

    local tabFrame = Instance.new("Frame", mainFrame)
    tabFrame.Size = UDim2.new(1, 0, 0, 35)
    tabFrame.Position = UDim2.new(0, 0, 0, 40)
    tabFrame.BackgroundTransparency = 1

    local function createTabBtn(name, position)
        local btn = Instance.new("TextButton", tabFrame)
        btn.Text = name
        btn.Size = UDim2.new(0.5, 0, 1, 0)
        btn.Position = position
        btn.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 18
        btn.TextColor3 = Color3.new(1, 1, 1)
        return btn
    end

    local opTabBtn = createTabBtn("OP", UDim2.new(0, 0, 0, 0))
    local auraTabBtn = createTabBtn("Aura", UDim2.new(0.5, 0, 0, 0))

    local pages = Instance.new("Frame", mainFrame)
    pages.Size = UDim2.new(1, 0, 1, -75)
    pages.Position = UDim2.new(0, 0, 0, 75)
    pages.BackgroundTransparency = 1
    pages.ClipsDescendants = true

    local opPage = Instance.new("Frame", pages)
    opPage.Size = UDim2.new(1, 0, 1, 0)
    opPage.BackgroundTransparency = 1
    opPage.Visible = true

    local function createInput(labelText, placeholder, yPos)
        local label = Instance.new("TextLabel", opPage)
        label.Text = labelText
        label.Font = Enum.Font.Gotham
        label.TextSize = 16
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 10, 0, yPos)
        label.Size = UDim2.new(0, 80, 0, 30)
        label.TextXAlignment = Enum.TextXAlignment.Left

        local textbox = Instance.new("TextBox", opPage)
        textbox.PlaceholderText = placeholder
        textbox.Font = Enum.Font.Gotham
        textbox.TextSize = 16
        textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
        textbox.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
        textbox.Position = UDim2.new(0, 100, 0, yPos)
        textbox.Size = UDim2.new(0, 180, 0, 30)

        textbox.Focused:Connect(function()
            if textbox.Text ~= "" then
                textbox.Text = ""
            end
        end)

        return textbox
    end

    local techniqueBox = createInput("Technique:", "Type technique", 10)
    local techniqueBtn = Instance.new("TextButton", opPage)
    techniqueBtn.Text = "Set Technique"
    techniqueBtn.Size = UDim2.new(0, 180, 0, 30)
    techniqueBtn.Position = UDim2.new(0, 100, 0, 45)
    techniqueBtn.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
    techniqueBtn.Font = Enum.Font.GothamBold
    techniqueBtn.TextSize = 16
    techniqueBtn.TextColor3 = Color3.new(1, 1, 1)
    techniqueBtn.MouseButton1Click:Connect(function()
        if techniqueBox.Text ~= "" then
            SetTechnique:FireServer(techniqueBox.Text, techniqueBox.Text, 1, 0.001)
        end
    end)

    local raceBox = createInput("Race:", "Type race", 90)
    local raceBtn = Instance.new("TextButton", opPage)
    raceBtn.Text = "Set Race"
    raceBtn.Size = UDim2.new(0, 180, 0, 30)
    raceBtn.Position = UDim2.new(0, 100, 0, 125)
    raceBtn.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
    raceBtn.Font = Enum.Font.GothamBold
    raceBtn.TextSize = 16
    raceBtn.TextColor3 = Color3.new(1, 1, 1)
    raceBtn.MouseButton1Click:Connect(function()
        if raceBox.Text ~= "" then
            SetRace:FireServer("None", raceBox.Text, 1, 0.1)
        end
    end)

    local clanBox = createInput("Clan:", "Type clan", 170)
    local clanBtn = Instance.new("TextButton", opPage)
    clanBtn.Text = "Set Clan"
    clanBtn.Size = UDim2.new(0, 180, 0, 30)
    clanBtn.Position = UDim2.new(0, 100, 0, 205)
    clanBtn.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
    clanBtn.Font = Enum.Font.GothamBold
    clanBtn.TextSize = 16
    clanBtn.TextColor3 = Color3.new(1, 1, 1)
    clanBtn.MouseButton1Click:Connect(function()
        if clanBox.Text ~= "" then
            SetClan:FireServer("None", clanBox.Text, 1, 0.1)
        end
    end)

    local auraPage = Instance.new("Frame", pages)
    auraPage.Size = UDim2.new(1, 0, 1, 0)
    auraPage.BackgroundTransparency = 1
    auraPage.Visible = false

    local auraToggleBtn = Instance.new("TextButton", auraPage)
    auraToggleBtn.Text = "Start Aura"
    auraToggleBtn.Size = UDim2.new(0.7, 0, 0, 50)
    auraToggleBtn.Position = UDim2.new(0.15, 0, 0.25, 0)
    auraToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
    auraToggleBtn.Font = Enum.Font.GothamBold
    auraToggleBtn.TextSize = 20
    auraToggleBtn.TextColor3 = Color3.new(1, 1, 1)
    auraToggleBtn.MouseButton1Click:Connect(function()
        auraRunning = not auraRunning
        if auraRunning then
            auraToggleBtn.Text = "Stop Aura"
            if not auraCoroutine or coroutine.status(auraCoroutine) == "dead" then
                auraCoroutine = coroutine.create(function()
                    while auraRunning do
                        information:FireServer("TojiNormal", "UseV")
                        task.wait(0.1)
                    end
                end)
                coroutine.resume(auraCoroutine)
            end
        else
            auraToggleBtn.Text = "Start Aura"
        end
    end)

    local serverCrashBtn = Instance.new("TextButton", auraPage)
    serverCrashBtn.Text = "Server Crasher (reset to reduce your lag)"
    serverCrashBtn.Size = UDim2.new(0.7, 0, 0, 50)
    serverCrashBtn.Position = UDim2.new(0.15, 0, 0.6, 0)
    serverCrashBtn.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
    serverCrashBtn.Font = Enum.Font.GothamBold
    serverCrashBtn.TextSize = 14
    serverCrashBtn.TextColor3 = Color3.new(1, 1, 1)
    serverCrashBtn.TextWrapped = true
    serverCrashBtn.TextScaled = true

    serverCrashBtn.MouseButton1Click:Connect(function()
        crashRunning = not crashRunning
        if crashRunning then
            serverCrashBtn.Text = "Stop Crasher"
            if not crashCoroutine or coroutine.status(crashCoroutine) == "dead" then
                crashCoroutine = coroutine.create(function()
                    while crashRunning do
                        information:FireServer("Gojo", "UseV")
                        task.wait(0.1)
                    end
                end)
                coroutine.resume(crashCoroutine)
            end
        else
            serverCrashBtn.Text = "Server Crasher (reset to reduce your lag)"
        end
    end)

    local function showPage(page)
        opPage.Visible = false
        auraPage.Visible = false
        page.Visible = true
    end

    opTabBtn.MouseButton1Click:Connect(function()
        showPage(opPage)
    end)

    auraTabBtn.MouseButton1Click:Connect(function()
        showPage(auraPage)
    end)

    showPage(opPage)
end

if userHasAccess then
    createMainUI()
else
    -- Create key entry UI
    local keyScreenGui = Instance.new("ScreenGui")
    keyScreenGui.Name = "KeyGUI"
    keyScreenGui.ResetOnSpawn = false
    keyScreenGui.Parent = player:WaitForChild("PlayerGui")

    local keyFrame = Instance.new("Frame", keyScreenGui)
    keyFrame.Size = UDim2.new(0, 350, 0, 180)
    keyFrame.Position = UDim2.new(0.5, -175, 0.5, -90)
    keyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    keyFrame.Active = true
    keyFrame.Draggable = true

    local keyTitle = Instance.new("TextLabel", keyFrame)
    keyTitle.Text = "Enter Access Key"
    keyTitle.Size = UDim2.new(1, 0, 0, 40)
    keyTitle.Font = Enum.Font.GothamBold
    keyTitle.TextSize = 24
    keyTitle.TextColor3 = Color3.fromRGB(255, 115, 0)
    keyTitle.BackgroundTransparency = 1

    local keyBox = Instance.new("TextBox", keyFrame)
    keyBox.PlaceholderText = "Type key here"
    keyBox.Font = Enum.Font.Gotham
    keyBox.TextSize = 20
    keyBox.TextColor3 = Color3.new(0, 0, 0)
    keyBox.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
    keyBox.Size = UDim2.new(0.8, 0, 0, 40)
    keyBox.Position = UDim2.new(0.1, 0, 0, 50)
    keyBox.ClearTextOnFocus = false

    keyBox.Focused:Connect(function()
        if keyBox.Text ~= "" then
            keyBox.Text = ""
        end
    end)

    local discordButton = Instance.new("TextButton", keyFrame)
    discordButton.Text = "Join our Discord"
    discordButton.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
    discordButton.Font = Enum.Font.GothamBold
    discordButton.TextSize = 18
    discordButton.Size = UDim2.new(0.8, 0, 0, 40)
    discordButton.Position = UDim2.new(0.1, 0, 0, 100)
    discordButton.TextColor3 = Color3.new(1, 1, 1)

    discordButton.MouseButton1Click:Connect(function()
        local discordInvite = "https://discord.gg/HmTWR2gBpe"
        local success, ClipboardService = pcall(function() return game:GetService("ClipboardService") end)
        if success and ClipboardService then
            ClipboardService:SetClipboard(discordInvite)
            discordButton.Text = "Invite link copied!"
        else
            discordButton.Text = "Copy this link: " .. discordInvite
        end
    end)

    keyBox.FocusLost:Connect(function(enterPressed)
        if not enterPressed then return end
        if keyBox.Text == validKey then
            userHasAccess = true
            player:SetAttribute("HasJJKey", true)
            keyScreenGui:Destroy()
            createMainUI()
        else
            keyBox.Text = ""
            keyBox.PlaceholderText = "Invalid key, try again"
        end
    end)
end
