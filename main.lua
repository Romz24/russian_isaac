local mod = RegisterMod("Russian language", 1)
local hud = Game():GetHUD()

function mod:onPickupCollision(pickup, collider, low)
	local player = collider:ToPlayer()
	
	if (pickup.Variant == PickupVariant.PICKUP_COIN and pickup.SubType == CoinSubType.COIN_LUCKYPENNY and player) then
		if player:GetNumCoins() >= 99 then
			return false
		else
			player:AddCoins(1)
			player:DonateLuck(1)
			
			pickup:PlayPickupSound()
			pickup:Remove()
			
			hud:ShowItemText("Счастливый Пенни", "Повышает удачу")
			return true
		end
	end
end

mod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, mod.onPickupCollision)
