function OnPickedUp(self, hand)
	local heartLight = Entities:FindByName(nil, "heart")
	heartLight:SetOrigin(thisEntity:GetAbsOrigin())
	heartLight:SetParent(thisEntity, "")

	EmitSoundOn("Tick.Clock", thisEntity);
end

function OnDropped(self, hand)
	StopSoundOn("Tick.Clock", thisEntity);
end
