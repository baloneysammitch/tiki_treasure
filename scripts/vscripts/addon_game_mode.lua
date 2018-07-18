--[[
Global variables go here
]]

_G.Books = 0
_G.Eggs = 0

function Activate()

  print("Number of books ", _G.Books)
  print("Eggs nested ", _G.Eggs)

  --Disable Bell
  local bell = Entities:FindByName(nil, "bell")
  bell:EnableUse(false)

  --Set gems invisible/disabled until doors are unlocked
  local purple_crystal = Entities:FindByName(nil, "purple_crystal")
  purple_crystal:SetRenderAlpha(0)

  --Set books disabled until doors are unlocked
  local grimoire = Entities:FindByName(nil, "grimoire")
  --grimoire:EnableUse(false)

  --Set inserted keys invisible/disabled until chests are unlocked
  local spiked_key_inserted = Entities:FindByName(nil, "spiked_key_inserted")
  spiked_key_inserted:SetRenderAlpha(0)

  --Set kraken invisible/disabled until bell is rung
  local kraken = Entities:FindByName(nil, "kraken")
  kraken:SetRenderAlpha(0)

end
