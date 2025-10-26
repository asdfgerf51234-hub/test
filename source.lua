--[[
	Code generated using github.com/Herrtt/luamin.js
	An open source Lua beautifier and minifier.
--]]




local L_1_ = game:GetService("Players")
local L_2_ = game:GetService("ReplicatedStorage")
local L_3_ = L_1_.LocalPlayer

-- Remotes
local L_4_ = L_2_:WaitForChild("SetTechnique")
local L_5_ = L_2_:WaitForChild("SetRace")
local L_6_ = L_2_:WaitForChild("SetClan")
local L_7_ = L_2_:WaitForChild("RemoteEvent"):WaitForChild("information")

local L_8_ = false
local L_9_
local L_10_ = false
local L_11_

local L_12_ = "MrPeabodyLooksMaxxing"

local L_13_ = false
if L_3_:GetAttribute("HasJJKey") == true then
	L_13_ = true
end

local function L_14_func()
	local L_15_ = Instance.new("ScreenGui")
	L_15_.Name = "JJLegacyV1"
	L_15_.ResetOnSpawn = false
	L_15_.Parent = L_3_:WaitForChild("PlayerGui")
	local L_16_ = Instance.new("Frame", L_15_)
	L_16_.Size = UDim2.new(0, 300, 0, 340)
	L_16_.Position = UDim2.new(0.5, -150, 0.5, -170)
	L_16_.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	L_16_.Active = true
	L_16_.Draggable = true
	L_16_.ClipsDescendants = true
	local L_17_ = Instance.new("TextLabel", L_16_)
	L_17_.Text = "JJ Legacy V1"
	L_17_.Size = UDim2.new(1, 0, 0, 40)
	L_17_.Font = Enum.Font.GothamBold
	L_17_.TextSize = 20
	L_17_.TextColor3 = Color3.fromRGB(255, 115, 0)
	L_17_.BackgroundTransparency = 1
	local L_18_ = Instance.new("TextButton", L_16_)
	L_18_.Size = UDim2.new(0, 30, 0, 30)
	L_18_.Position = UDim2.new(1, -35, 0, 5)
	L_18_.Text = "X"
	L_18_.Font = Enum.Font.GothamBold
	L_18_.TextSize = 24
	L_18_.TextColor3 = Color3.fromRGB(255, 85, 0)
	L_18_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	L_18_.MouseButton1Click:Connect(function()
		L_8_ = false
		L_10_ = false
		L_15_:Destroy()
	end)
	local L_19_ = Instance.new("Frame", L_16_)
	L_19_.Size = UDim2.new(1, 0, 0, 35)
	L_19_.Position = UDim2.new(0, 0, 0, 40)
	L_19_.BackgroundTransparency = 1
	local function L_20_func(L_36_arg0, L_37_arg1)
		local L_38_ = Instance.new("TextButton", L_19_)
		L_38_.Text = L_36_arg0
		L_38_.Size = UDim2.new(0.5, 0, 1, 0)
		L_38_.Position = L_37_arg1
		L_38_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
		L_38_.Font = Enum.Font.GothamBold
		L_38_.TextSize = 18
		L_38_.TextColor3 = Color3.new(1, 1, 1)
		return L_38_
	end
	local L_21_ = L_20_func("OP", UDim2.new(0, 0, 0, 0))
	local L_22_ = L_20_func("Aura", UDim2.new(0.5, 0, 0, 0))
	local L_23_ = Instance.new("Frame", L_16_)
	L_23_.Size = UDim2.new(1, 0, 1, -75)
	L_23_.Position = UDim2.new(0, 0, 0, 75)
	L_23_.BackgroundTransparency = 1
	L_23_.ClipsDescendants = true
	local L_24_ = Instance.new("Frame", L_23_)
	L_24_.Size = UDim2.new(1, 0, 1, 0)
	L_24_.BackgroundTransparency = 1
	L_24_.Visible = true
	local function L_25_func(L_39_arg0, L_40_arg1, L_41_arg2)
		local L_42_ = Instance.new("TextLabel", L_24_)
		L_42_.Text = L_39_arg0
		L_42_.Font = Enum.Font.Gotham
		L_42_.TextSize = 16
		L_42_.TextColor3 = Color3.new(1, 1, 1)
		L_42_.BackgroundTransparency = 1
		L_42_.Position = UDim2.new(0, 10, 0, L_41_arg2)
		L_42_.Size = UDim2.new(0, 80, 0, 30)
		L_42_.TextXAlignment = Enum.TextXAlignment.Left
		local L_43_ = Instance.new("TextBox", L_24_)
		L_43_.PlaceholderText = L_40_arg1
		L_43_.Font = Enum.Font.Gotham
		L_43_.TextSize = 16
		L_43_.TextColor3 = Color3.fromRGB(0, 0, 0)
		L_43_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
		L_43_.Position = UDim2.new(0, 100, 0, L_41_arg2)
		L_43_.Size = UDim2.new(0, 180, 0, 30)
		L_43_.Focused:Connect(function()
			if L_43_.Text ~= "" then
				L_43_.Text = ""
			end
		end)
		return L_43_
	end
	local L_26_ = L_25_func("Technique:", "Type technique", 10)
	local L_27_ = Instance.new("TextButton", L_24_)
	L_27_.Text = "Set Technique"
	L_27_.Size = UDim2.new(0, 180, 0, 30)
	L_27_.Position = UDim2.new(0, 100, 0, 45)
	L_27_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
	L_27_.Font = Enum.Font.GothamBold
	L_27_.TextSize = 16
	L_27_.TextColor3 = Color3.new(1, 1, 1)
	L_27_.MouseButton1Click:Connect(function()
		if L_26_.Text ~= "" then
			L_4_:FireServer(L_26_.Text, L_26_.Text, 1, 0.001)
		end
	end)
	local L_28_ = L_25_func("Race:", "Type race", 90)
	local L_29_ = Instance.new("TextButton", L_24_)
	L_29_.Text = "Set Race"
	L_29_.Size = UDim2.new(0, 180, 0, 30)
	L_29_.Position = UDim2.new(0, 100, 0, 125)
	L_29_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
	L_29_.Font = Enum.Font.GothamBold
	L_29_.TextSize = 16
	L_29_.TextColor3 = Color3.new(1, 1, 1)
	L_29_.MouseButton1Click:Connect(function()
		if L_28_.Text ~= "" then
			L_5_:FireServer("None", L_28_.Text, 1, 0.1)
		end
	end)
	local L_30_ = L_25_func("Clan:", "Type clan", 170)
	local L_31_ = Instance.new("TextButton", L_24_)
	L_31_.Text = "Set Clan"
	L_31_.Size = UDim2.new(0, 180, 0, 30)
	L_31_.Position = UDim2.new(0, 100, 0, 205)
	L_31_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
	L_31_.Font = Enum.Font.GothamBold
	L_31_.TextSize = 16
	L_31_.TextColor3 = Color3.new(1, 1, 1)
	L_31_.MouseButton1Click:Connect(function()
		if L_30_.Text ~= "" then
			L_6_:FireServer("None", L_30_.Text, 1, 0.1)
		end
	end)
	local L_32_ = Instance.new("Frame", L_23_)
	L_32_.Size = UDim2.new(1, 0, 1, 0)
	L_32_.BackgroundTransparency = 1
	L_32_.Visible = false
	local L_33_ = Instance.new("TextButton", L_32_)
	L_33_.Text = "Start Aura"
	L_33_.Size = UDim2.new(0.7, 0, 0, 50)
	L_33_.Position = UDim2.new(0.15, 0, 0.25, 0)
	L_33_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
	L_33_.Font = Enum.Font.GothamBold
	L_33_.TextSize = 20
	L_33_.TextColor3 = Color3.new(1, 1, 1)
	L_33_.MouseButton1Click:Connect(function()
		L_8_ = not L_8_
		if L_8_ then
			L_33_.Text = "Stop Aura"
			if not L_9_ or coroutine.status(L_9_) == "dead" then
				L_9_ = coroutine.create(function()
					while L_8_ do
						L_7_:FireServer("TojiNormal", "UseV")
						task.wait(0.1)
					end
				end)
				coroutine.resume(L_9_)
			end
		else
			L_33_.Text = "Start Aura"
		end
	end)
	local L_34_ = Instance.new("TextButton", L_32_)
	L_34_.Text = "Server Crasher (reset to reduce your lag)"
	L_34_.Size = UDim2.new(0.7, 0, 0, 50)
	L_34_.Position = UDim2.new(0.15, 0, 0.6, 0)
	L_34_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
	L_34_.Font = Enum.Font.GothamBold
	L_34_.TextSize = 14
	L_34_.TextColor3 = Color3.new(1, 1, 1)
	L_34_.TextWrapped = true
	L_34_.TextScaled = true
	L_34_.MouseButton1Click:Connect(function()
		L_10_ = not L_10_
		if L_10_ then
			L_34_.Text = "Stop Crasher"
			if not L_11_ or coroutine.status(L_11_) == "dead" then
				L_11_ = coroutine.create(function()
					while L_10_ do
						L_7_:FireServer("Gojo", "UseV")
						task.wait(0.1)
					end
				end)
				coroutine.resume(L_11_)
			end
		else
			L_34_.Text = "Server Crasher (reset to reduce your lag)"
		end
	end)
	local function L_35_func(L_44_arg0)
		L_24_.Visible = false
		L_32_.Visible = false
		L_44_arg0.Visible = true
	end
	L_21_.MouseButton1Click:Connect(function()
		L_35_func(L_24_)
	end)
	L_22_.MouseButton1Click:Connect(function()
		L_35_func(L_32_)
	end)
	L_35_func(L_24_)
end

if L_13_ then
	L_14_func()
else
    -- Create key entry UI
	local L_45_ = Instance.new("ScreenGui")
	L_45_.Name = "KeyGUI"
	L_45_.ResetOnSpawn = false
	L_45_.Parent = L_3_:WaitForChild("PlayerGui")
	local L_46_ = Instance.new("Frame", L_45_)
	L_46_.Size = UDim2.new(0, 350, 0, 180)
	L_46_.Position = UDim2.new(0.5, -175, 0.5, -90)
	L_46_.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	L_46_.Active = true
	L_46_.Draggable = true
	local L_47_ = Instance.new("TextLabel", L_46_)
	L_47_.Text = "Enter Access Key"
	L_47_.Size = UDim2.new(1, 0, 0, 40)
	L_47_.Font = Enum.Font.GothamBold
	L_47_.TextSize = 24
	L_47_.TextColor3 = Color3.fromRGB(255, 115, 0)
	L_47_.BackgroundTransparency = 1
	local L_48_ = Instance.new("TextBox", L_46_)
	L_48_.PlaceholderText = "Type key here"
	L_48_.Font = Enum.Font.Gotham
	L_48_.TextSize = 20
	L_48_.TextColor3 = Color3.new(0, 0, 0)
	L_48_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
	L_48_.Size = UDim2.new(0.8, 0, 0, 40)
	L_48_.Position = UDim2.new(0.1, 0, 0, 50)
	L_48_.ClearTextOnFocus = false
	L_48_.Focused:Connect(function()
		if L_48_.Text ~= "" then
			L_48_.Text = ""
		end
	end)
	local L_49_ = Instance.new("TextButton", L_46_)
	L_49_.Text = "Join our Discord"
	L_49_.BackgroundColor3 = Color3.fromRGB(255, 115, 0)
	L_49_.Font = Enum.Font.GothamBold
	L_49_.TextSize = 18
	L_49_.Size = UDim2.new(0.8, 0, 0, 40)
	L_49_.Position = UDim2.new(0.1, 0, 0, 100)
	L_49_.TextColor3 = Color3.new(1, 1, 1)
	L_49_.MouseButton1Click:Connect(function()
		local L_50_ = "https://discord.gg/HmTWR2gBpe"
		local L_51_, L_52_ = pcall(function()
			return game:GetService("ClipboardService")
		end)
		if L_51_ and L_52_ then
			L_52_:SetClipboard(L_50_)
			L_49_.Text = "Invite link copied!"
		else
			L_49_.Text = "Copy this link: " .. L_50_
		end
	end)
	L_48_.FocusLost:Connect(function(L_53_arg0)
		if not L_53_arg0 then
			return
		end
		if L_48_.Text == L_12_ then
			L_13_ = true
			L_3_:SetAttribute("HasJJKey", true)
			L_45_:Destroy()
			L_14_func()
		else
			L_48_.Text = ""
			L_48_.PlaceholderText = "Invalid key, try again"
		end
	end)
end
