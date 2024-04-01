--!strict
--[[

	Written by GamingWithDoggy44 (@doggy.dev)
	Created: March 31, 2024

	--  Notes  -- {
	
		- There are some redundancies that I don't feel like fixing right now.  Tech debt, let's go !!!
		- If there are FPS issues, I tried.  Try contacting me about them to get them fixed possibly.
		- When you use a DeltaTime with the base shake functions, the results may differ because of the constant FPS fix I used.
		  I have no idea how to fix this... lol.  The LerpPosition is the only thing really affected but it makes a noticable difference.
	
	}

]]

--  Variables / Types  --

local RunService = game:GetService("RunService")
local ModifierModule = {}

--  Functions  --

local function DetermineHumanoid(Player: Player?): Humanoid?
	if (not Player) then return end
	local Character: Model? = Player.Character
	if (not Character) then return end
	local Humanoid: Humanoid? = Character:FindFirstChildWhichIsA("Humanoid")
	if (not Humanoid) then return end
	return Humanoid
end

function ModifierModule.TrigShake(Player: Player, ShakeDefiner: Vector2, Intensity: number, LerpPosition: number, DeltaTime: number?): Vector3
	local Humanoid: Humanoid? = DetermineHumanoid(Player)
	if (not Humanoid) then return Vector3.new() end
	
	return Humanoid.CameraOffset:Lerp(Vector3.new(
		math.sin(math.random(ShakeDefiner.X, ShakeDefiner.Y) * Intensity),
		math.cos(math.random(ShakeDefiner.X, ShakeDefiner.Y) * Intensity - 1.5),
		math.sin(math.random(ShakeDefiner.X, ShakeDefiner.Y) * Intensity)
	), LerpPosition ^ (DeltaTime or 1))
end

function ModifierModule.TimeTrigShake(Time: number, Player: Player, ShakeDefiner: Vector2, Intensity: number, LerpPosition: number)
	local StartTime: number = os.time()
	local Humanoid: Humanoid? = DetermineHumanoid(Player)
	local Connection: RBXScriptConnection = RunService.RenderStepped:Connect(function(DeltaTime: number)
		if (not Humanoid) then return end
		Humanoid.CameraOffset = ModifierModule.TrigShake(Player, ShakeDefiner, Intensity, LerpPosition, DeltaTime)
	end)
	
	repeat RunService.Heartbeat:Wait() until os.time() >= StartTime + Time
	Connection:Disconnect()
	if (not Humanoid) then return end
	Humanoid.CameraOffset = Vector3.new()
end

--  Return Module  --

return ModifierModule
