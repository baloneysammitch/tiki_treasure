
local playerEnt = nil
local handEnt = nil
local handID = 0
local handAttachment = nil
local isCarried = false
local physhammer = nil
local toolTarget = nil
local physConstraint = nil
local lastFireTime = 0

local DAMAGE_FACTOR = 0.1
local STUCK_SPEED = 5
local THINK_INTERVAL = 0.011
local user = nil
local tracing = false
local lastSoundTime = 0

local constraintKeyvals = {
	classname = "phys_constraint";
	targetname = "";
	attach1 = "";
	attach2 = "";
	linearfrequency = 1.8;
	lineardampingratio = 3;
	enablelinearconstraint = 1;
	enableangularconstraint = 1
}
constraintKeyvals["spawnflags#0"] = "1"

local hammerKeyvals = {
	classname = "prop_destinations_physics";
}


function Activate()

	hammerKeyvals.model = thisEntity:GetModelName()
	--hammerKeyvals.angles = thisEntity:GetAngles()

	-- NOTE TO SELF: you added this line to flip the axis of the hammer
	hammerKeyvals.angles = thisEntity:SetLocalAngles(0, 180, 90)

	hammerKeyvals.origin = thisEntity:GetAbsOrigin()

	physhammer = SpawnEntityFromTableSynchronous(hammerKeyvals.classname, hammerKeyvals)
	physhammer:EnableUse(false)
	local paintColor = thisEntity:GetRenderColor()
	physhammer:SetRenderColor(paintColor.x, paintColor.y, paintColor.z)


	thisEntity:SetEntityName("hammer_ent")
	physhammer:SetEntityName("hammer_phys")

	constraintKeyvals.origin = thisEntity:GetAbsOrigin()
	constraintKeyvals.attach2 = thisEntity:GetName()
	constraintKeyvals.attach1 = physhammer:GetName()

	physConstraint = SpawnEntityFromTableSynchronous(constraintKeyvals.classname, constraintKeyvals)
	physConstraint:SetEntityName(DoUniqueString("hammer_const"))
	physhammer:SetParent(thisEntity, "")
	physhammer:AddEffects(32)
end



function SetEquipped(self, pHand, nHandID, pHandAttachment, pPlayer)

	handID = nHandID
	handEnt = pHand
	playerEnt = pPlayer
	handAttachment = pHandAttachment
	isCarried = true

	handAttachment:AddEffects(32)

	physhammer:SetParent(nil, "")
	physhammer:RemoveEffects(32)
	DoEntFireByInstanceHandle(physConstraint, "TurnOn", "", 0, nil, nil)

	local paintColor = thisEntity:GetRenderColor()
	handAttachment:SetRenderColor(paintColor.x, paintColor.y, paintColor.z)
	physhammer:SetRenderColor(paintColor.x, paintColor.y, paintColor.z)

	tracing = false
	thisEntity:SetParent(nil, "")
	DoEntFireByInstanceHandle(thisEntity, "enablemotion", "", 0 , thisEntity, thisEntity)

	return true
end




function SetUnequipped()

	local paintColor = handAttachment:GetRenderColor()
	thisEntity:SetRenderColor(paintColor.x, paintColor.y, paintColor.z)


	physhammer:AddEffects(32)
	DoEntFireByInstanceHandle(physConstraint, "TurnOff", "", 0, nil, nil)
	physhammer:SetParent(thisEntity, "")

	playerEnt = nil
	handEnt = nil
	isCarried = false
	handAttachment = nil

	return true
end


function OnHandleInput( input )
	if not playerEnt
	then
		return
	end

	-- Even uglier ternary operator
	local IN_TRIGGER = (handID == 0 and IN_USE_HAND0 or IN_USE_HAND1)
	local IN_GRIP = (handID == 0 and IN_GRIP_HAND0 or IN_GRIP_HAND1)
	local IN_PAD = (handID == 0 and IN_PAD_HAND0 or IN_PAD_HAND1)
	local IN_PAD_TOUCH = (handID == 0 and IN_PAD_TOUCH_HAND0 or IN_PAD_TOUCH_HAND1)



	if input.buttonsPressed:IsBitSet(IN_TRIGGER)
	then
		input.buttonsPressed:ClearBit(IN_TRIGGER)
		OnTriggerPressed(self)
	end

	if input.buttonsReleased:IsBitSet(IN_TRIGGER)
	then
		input.buttonsReleased:ClearBit(IN_TRIGGER)
	end

	if input.buttonsReleased:IsBitSet(IN_GRIP)
	then
		input.buttonsReleased:ClearBit(IN_GRIP)
		thisEntity:ForceDropTool()
	end



	-- Needed to disable teleports
	--[[if input.buttonsDown:IsBitSet(IN_PAD)
	then
		input.buttonsDown:ClearBit(IN_PAD)

	end
	if input.buttonsDown:IsBitSet(IN_PAD_TOUCH)
	then
		input.buttonsDown:ClearBit(IN_PAD_TOUCH)
	end]]

	return input
end


local ROCKET_ADDVELOCITY = 500
local THINK_INTERVAL = 0.02
local armCounter = 0
local ARM_DELAY = 1
local TRACE_DISTANCE = 48
local user = nil

local EXPLOSION_RANGE = 300
local EXPLOSION_MAX_IMPULSE = 5000

function Fire(player)
	user = player
  if Time() > lastFireTime + 0.1 then
    lastFireTime = Time()
    physhammer:ApplyAbsVelocityImpulse(thisEntity:GetAngles():Forward():Normalized() * 5000)
  end

	physhammer:SetThink(Think, "ent_think", THINK_INTERVAL)
end

function Think(self)

	if TraceDirectHit(self)
	then
		return false
	end

	return THINK_INTERVAL
end

function TraceDirectHit(thisEntity)
	local traceTable =
	{
		startpos = thisEntity:GetOrigin();
		endpos = thisEntity:GetOrigin() + RotatePosition(Vector(0,0,0), thisEntity:GetAngles(), Vector(-TRACE_DISTANCE, 0, 0));
		ignore = thisEntity

	}
	--DebugDrawLine(traceTable.startpos, traceTable.endpos, 0, 255, 0, false, 0.11)
	TraceLine(traceTable)

	if traceTable.hit
	then
		Explode(traceTable.normal)

		return true
	end

	return false
end

function Explode(normal)

	local entities = Entities:FindAllInSphere(physhammer:GetOrigin(), EXPLOSION_RANGE)

	for _,dmgEnt in ipairs(entities)
	do
		if IsValidEntity(dmgEnt) and dmgEnt:IsAlive() and dmgEnt ~= thisEntity
		then
			local distance = (dmgEnt:GetCenter() - physhammer:GetCenter()):Length()

			local magnitude = (EXPLOSION_MAX_IMPULSE - EXPLOSION_MAX_IMPULSE * distance / EXPLOSION_RANGE)
			local impulse = (dmgEnt:GetCenter() - physhammer:GetCenter()):Normalized() * magnitude

			dmgEnt:ApplyAbsVelocityImpulse(impulse)

			local dmg = CreateDamageInfo(physhammer, user, impulse, physhammer:GetOrigin(), magnitude, DMG_BLAST)
			dmgEnt:TakeDamage(dmg)
			DestroyDamageInfo(dmg)

		end
		dmgEnt = Entities:FindByClassname(dmgEnt, "prop_physics_override")
	end

	thisEntity:AddEffects(32)

	--StartSoundEventFromPosition("Law.Explode", physhammer:GetOrigin())
end



function OnTriggerPressed()
  Fire(self)
end
