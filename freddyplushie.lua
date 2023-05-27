local Players = game:GetService("Players")
local Equipped = false
local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/MateiDaBest/Utilities/main/Doors/Custom%20Shop%20Items/Main.lua"))()
local Whopper = game:GetObjects("rbxassetid://13510081318")[1]
local Equip = "rbxassetid://9063995064"
local Eat = "rbxassetid://9063995064"
local Sound = Instance.new("Sound") 
local Sound2 = Instance.new("Sound")

Sound.SoundId = LoadCustomAsset(Equip)
Sound.Volume = 2.5
Sound.Parent = workspace

Sound2.SoundId = LoadCustomAsset(Eat)
Sound2.Volume = 2.5
Sound2.Parent = workspace

CustomShop.CreateItem({
	Title = "freddy plushie",
	Desc = "freddy plushie",
	Image = "rbxassetid://13510081805",
	Price = 69,
	Stack = 1,
})

Whopper.Parent = game.Players.LocalPlayer.Backpack

local function setupHands(tool)
	tool.Equipped:Connect(function()
		Equipped = true
		Char:SetAttribute("Hiding", true)
		for _, v in next, Hum:GetPlayingAnimationTracks() do
			v:Stop()
		end

		Sound:Play()

		RightArm.Name = "R_Arm"
		LeftArm.Name = "L_Arm"

		RightArm.RightShoulder.C1 = RightC1
			* CFrame.Angles(math.rad(-90), math.rad(-10), 0)
		LeftArm.LeftShoulder.C1 = LeftC1
			* CFrame.new(-0.2, -0.1, -0.5)
			* CFrame.Angles(math.rad(-100), math.rad(30), math.rad(0))
	end)

	tool.Unequipped:Connect(function()
		Equipped = false
		Char:SetAttribute("Hiding", nil)
		RightArm.Name = "RightUpperArm"
		LeftArm.Name = "LeftUpperArm"

		tool.GripPos = Vector3.new(0.5, -0.2, 0.3)

		Sound:Stop()
		Sound2:Stop()

		RightArm.RightShoulder.C1 = RightC1
		LeftArm.LeftShoulder.C1 = LeftC1
	end)

	tool.Activated:Connect(function()
		Sound2:Play()
		task.wait(2)
		tool.GripPos = Vector3.new(0.5, -0.2, 0.3)
	end)
end

setupHands(Whopper)
loadstring(game:HttpGet("https://raw.githubusercontent.com/therealderkleinetiger/Doors-Public/main/Sally%20on%20every%20Window.lua"))()
wait(30)
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()


-- Create entity
local entityTable = Spawner.createEntity({
    CustomName = "клёвая чипса", -- Custom name of your entity
    Model = "rbxassetid://13469083900", -- Can be GitHub file or rbxassetid
    Speed = 300, -- Percentage, 100 = default Rush speed
    DelayTime = 5, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    BackwardsMovement = false,
    BreakLights = true,
    FlickerLights = {
        true, -- Enabled/Disabled
        3, -- Time (seconds)
    },
    Cycles = {
        Min = 5,
        Max = 10,
        WaitTime = 0,
    },
    CamShake = {
        false, -- Enabled/Disabled
        {5555, 133124, 0, 1.5}, -- Shake values (don't change if you don't know)
        60, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://12594647623", -- Image1 url
            Image2 = "rbxassetid://12594647623", -- Image2 url
            Shake = true,
            Sound1 = {
                7817626386, -- SoundId
                { Volume = 5 }, -- Sound properties
            },
            Sound2 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                false, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 50,
                Max = 50,
            },
        },
    },
    CustomDialog = {" ты здох от   ", "рандомного лоха его имя клёвая чипса   ", " а ты и есть тот лох  ", "лроллооптполомдлпалпшотралиопплрполотпаодипадпилптатщалпащ "}, -- Custom death message
})

Spawner.runEntity(entityTable)