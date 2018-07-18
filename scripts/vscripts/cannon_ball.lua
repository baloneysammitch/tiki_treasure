local THINK_INTERVAL = 0.5
local timer = Time() + 8
local cannon_ball = thisEntity

function CannonThink()
  if Time() > timer then
    print("Cannon ball destroyed")
    cannon_ball:Kill()
  end
  return THINK_INTERVAL
end

function Activate()
  thisEntity:SetThink(CannonThink, "cannon_ball", 0)
end
