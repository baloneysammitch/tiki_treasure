function PurpleEggNest()
  _G.Eggs = _G.Eggs + 1
  print("Purple egg nested")
  EggNestReward()
end

function LavaEggNest()
  _G.Eggs = _G.Eggs + 1
  print("Purple egg nested")
  EggNestReward()
end

function FireEggNest()
  _G.Eggs = _G.Eggs + 1
  print("Purple egg nested")
  EggNestReward()
end

function EggNestReward()
  if _G.Eggs == 3 then

    print("All three eggs are happily nesting")

  end
end


function SunBookPlaced()
  _G.Books = _G.Books + 1
  print("Sun book nested")
  BookReward()
end

function NecroBookPlaced()
  _G.Books = _G.Books + 1
  print("Necro book nested")
  BookReward()
end

function GrimoireBookPlaced()
  _G.Books = _G.Books + 1
  print("Grimoire book nested")
  BookReward()
end

function EvilBookPlaced()
  _G.Books = _G.Books + 1
  print("Evil book nested")
  BookReward()
end

function CrystalBookPlaced()
  _G.Books = _G.Books + 1
  print("Evil book nested")
  BookReward()
end

function FaunBookPlaced()
  _G.Books = _G.Books + 1
  print("Evil book nested")
  BookReward()
end

function BookReward()
  if _G.Books == 6 then

    print("All books placed")

  end
end
