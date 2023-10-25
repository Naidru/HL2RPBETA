ITEM.name = "Air Filter"
ITEM.model = Model("models/items/airfilter.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An air filter meant to be attached to a respirator."
ITEM.price = 40
--ITEM.flag = "v"

function ITEM:PaintOver(item, w, h)
    local airFilterLeft = item:GetData("airFilterLeft")

    if airFilterLeft != nil then
        surface.SetDrawColor(equipped and HSVToColor((.25 * 360) * airFilterLeft, 1, 1) or Color(118,118,118))
        surface.DrawRect(2, h - 4, (w - 4) * airFilterLeft, 2)
    end
end

ITEM.functions.AttachAirFilter = {
    name = "Attach to gas mask",
	OnRun = function(itemTable)
        local character = itemTable.player:GetCharacter()
        if not character then return false end
        
        local inventory = character:GetInventory()
        local mask
        
        for _, v in pairs(inventory:GetItems()) do
            if v.uniqueID == "gasmask" and v:GetData("airfilter", false) == false then
                mask = v
            end
        end

		local airFilterLeft = 1
        if mask then
			itemTable:Remove()
			airFilterLeft = itemTable:GetData("airFilterLeft", 1)
        else
            return false
        end

        mask.player = itemTable.player

        mask:SetData("airFilterLeft", airFilterLeft)
		mask:SetData("airfilter", true)
		mask.player:SetNetVar("airfilter", true)

        mask:UpdateBodyGroups()
        mask:RefreshPAC()

		return false
	end,
    OnCanRun = function(item)
        if not item.player then return false end

        local character = item.player:GetCharacter()
        if not character then return false end
        
        local inventory = character:GetInventory()
        
        for _, v in pairs(inventory:GetItems()) do
            if v.uniqueID == "gasmask" and v:GetData("airfilter", false) == false then
                return true
            end
        end
        
        return false
    end
}