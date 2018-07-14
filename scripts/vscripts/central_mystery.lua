function BlueTrigger()
  local blue_gem = Entities:FindByName(nil, "blue_gem")
  blue_gem:Kill()

  _G.Gems = _G.Gems + 1
  print("Blue gem placed")
  EndGame()
end

function YellowTrigger()
  local yellow_gem = Entities:FindByName(nil, "yellow_gem")
  yellow_gem:Kill()

  _G.Gems = _G.Gems + 1
  print("Yellow gem placed")
  EndGame()
end

function GreenTrigger()
  local green_gem = Entities:FindByName(nil, "green_gem")
  green_gem:Kill()

  _G.Gems = _G.Gems + 1
  print("Green gem placed")
  EndGame()
end

function PurpleTrigger()
  local purple_gem = Entities:FindByName(nil, "purple_gem")
  purple_gem:Kill()

  _G.Gems = _G.Gems + 1
  print("Purple gem placed")
  EndGame()
end

function RedTrigger()
  local red_gem = Entities:FindByName(nil, "red_gem")
  StopSoundOn("Tick.Clock", red_gem);
  --timer.Simple( 3, function()
    red_gem:Kill()
  --end )



  _G.Gems = _G.Gems + 1
  print("Red gem placed")
  EndGame()
end

function OrangeTrigger()
  local orange_gem = Entities:FindByName(nil, "orange_gem")
  orange_gem:Kill()

  _G.Gems = _G.Gems + 1
  print("Orange gem placed")
  EndGame()
end

function EndGame()
  print("Gems placed", _G.Gems)

  if _G.Gems == 6 then

    local hammer = nil
    local hammer_holder = Entities:FindByName(nil, "hammer_holder")
    local hammer = nil
    local hammerKeyvals =
    {
    	targetname = "hammer";
      classname = "prop_destinations_tool";
    	model = "models/third_party/props/toys/wrath_of_loki_hammer.vmdl";
    	vscripts = "hammer";
      angles = Vector(0, 180, 90)
    }

    hammerKeyvals.origin = hammer_holder:GetAbsOrigin()
    hammer = SpawnEntityFromTableSynchronous(hammerKeyvals.classname, hammerKeyvals)

    local saiyan_hair = Entities:FindByName(nil, "saiyan_hair")
    saiyan_hair:SetRenderAlpha(255)

  end
end





--Don't let jupiter go black when we turn off the sun
local jupiter = nil

function  JupiterOn()
  local jupiter = Entities:FindByName(nil, "jupiter")
  print("Light on")
	jupiter:SetLightGroup("")
end

function  JupiterOff()
  local jupiter = Entities:FindByName(nil, "jupiter")
  print("Light off")
	jupiter:SetLightGroup("sun_group")
end
