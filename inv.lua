--checks if the inventory is full
function isInventoryFull()
	for i=1, 16 do
		if turtle.getItemCount(i) == 0 then
			return false
		end
	end
	return true
end
-- Fixes inventory scattering.
function stackItems()
	-- Remember seen items
	m = {}	
	for i=1, 16 do
		local this = turtle.getItemDetail(i)
		if this ~= nil then
			-- Slot is not empty
			local saved = m[this.name .. this.damage]
			if saved ~= nil then
				-- We've seen this item before in the inventory
				local ammount = this.count
				turtle.select(i)
				turtle.transferTo(saved.slot)
				if ammount > saved.space then
					-- We have leftovers, and now the
					-- saved slot is full, so we replace
					-- it by the current one
					saved.slot = i
					saved.count = ammount - saved.space
					-- Update on table.
					m[this.name .. this.damage] = saved
				elseif ammount == saved.space then
					-- Just delete the entry
					m[this.name .. this.damage] = nil
				end
			else
				-- There isn't another slot with this
				-- item so far, so sign this one up.
			this.slot = i
			this.space = turtle.getItemSpace(i)
			m[this.name .. this.damage] = this
			end
		end
	end
end
--select items from the inventory by name
function selectItem(name)
	for i=1, 16 do
		local data = turtle.getItemDetail(i)
		if data and data.name == name then
			turtle.select(i)
			return true
		end
	end
	return false
end
--gets the amount of items in a stack
function getItemCount(name)
	local count = 0
	for i=1, 16 do
		local data = turtle.getItemDetail(i)
		if data and data.name == name then
			count = count + data.count
		end
	end
	return count
end
--nuts the wheat into the chest... but holds some seeds behind
function dropInChest()
	local stacks = 0
	turtle.turnLeft()
	turtle.turnLeft()
	local success, data = turtle.inspect()
	if success then
		if data.name == "appliedenergistics2:sky_stone_chest" then
			for i=1, 16 do
				turtle.select(i)
				data = turtle.getItemDetail()
				if (data ~= nil) and data.name == "minecraft:wheat_seeds" and data.count == 64 then
					stacks = stacks + 1
				end
				if (data ~= nil) and (data.name == "minecraft:wheat_seeds" and stacks > 8) then
					turtle.drop()
				elseif (data ~= nil) and (data.name ~= "minecraft:coal") and (data.name ~= "minecraft:wheat_seeds") then
					turtle.drop()
				end
			end
		end
	end
	turtle.turnRight()
	turtle.turnRight()
end
--gets fuel from the chest to its left not the same as the drop off chest only call if the turtle is at home
function getFuel()
    turtle.turnLeft()
	turtle.suck()
	if selectItem("minecraft:coal") then
		turtle.refuel()
		turtle.turnRight()
		return true
	else
		turtle.turnRight()
		return false
	end
end
--check fuel level is less than specified 2000 in this case
function checkFuel()
	if turtle.getFuelLevel() < 2000 then
		return false
	else
		return true
	end
end