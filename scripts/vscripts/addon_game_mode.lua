--[[
Global variables go here
]]

_G.Books = 0

function Activate()

  GameRules.SetPlayersCanSpawnAnyItems(false)
  GameRules.SetPlayersCanSpawnTools(false)

  print("Number of books ", _G.Books)

  --Disable Bell
  local bell = Entities:FindByName(nil, "bell")
  bell:EnableUse(false)

  --Set gems invisible/disabled until doors are unlocked
  local red_gem = Entities:FindByName(nil, "red_gem")
  red_gem:SetRenderAlpha(0)
  red_gem:EnableUse(false)



end
