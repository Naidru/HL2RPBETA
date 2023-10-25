ITEM.name = "Gas Mask"
ITEM.model = Model("models/items/gasmask.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A rubber mask with a metal respirator on it."
ITEM.outfitCategory = "face"
ITEM.price = 60

function ITEM:GetBodyGroups()
    return self:GetData("airfilter", false) and "01" or "00"
end

function ITEM:pacAdjust(outfit, client)
	local val = client:GetNetVar("airfilter", false)
    outfit[1].children[1].children[1].self.ModelIndex = val and 1 or 0
    return outfit
end

function ITEM:pacAdjustServer()
	self.player:SetNetVar("airfilter", self:GetData("airfilter"))
end

ITEM.functions.AttachAirFilter = {
    name = "Attach air filter",
	OnRun = function(itemTable)
        local character = itemTable.player:GetCharacter()
        if not character then return false end
        
        local inventory = character:GetInventory()
		local filter = inventory:HasItem("airfilter")
		local airFilterLeft = 1
        if filter ~= false then
			filter:Remove()
			airFilterLeft = filter:GetData("airFilterLeft", 1)
        else
            return false
        end

        itemTable:SetData("airFilterLeft", airFilterLeft)
		itemTable:SetData("airfilter", true)
		itemTable.player:SetNetVar("airfilter", true)

        itemTable:UpdateBodyGroups()
        itemTable:RefreshPAC()

		return false
	end,
	OnCanRun = function(item)
		if item:GetData("airfilter") then return false end
		
        if not item.player then return false end

        local character = item.player:GetCharacter()
        if not character then return false end
        
        local inventory = character:GetInventory()
        if inventory:HasItem("airfilter") ~= false then
            return true
        end
        
        return false
    end
}

ITEM.functions.DetachAirFilter = {
    name = "Detach air filter",
	OnRun = function(itemTable)
        local character = itemTable.player:GetCharacter()
        if not character then return false end
        
        local inventory = character:GetInventory()

		local airFilterLeft = itemTable:GetData("airFilterLeft")
		inventory:Add("airfilter", 1, {
			airFilterLeft = airFilterLeft
		})

        itemTable:SetData("airFilterLeft", 0)
		itemTable:SetData("airfilter", false)
		itemTable.player:SetNetVar("airfilter", false)

        itemTable:UpdateBodyGroups()
        itemTable:RefreshPAC()

		return false
	end,
	OnCanRun = function(item)
        return item:GetData("airfilter", false)
    end
}

ITEM.pacData = {
	[1] = {
		["children"] = {
			[1] = {
				["children"] = {
					[1] = {
						["children"] = {},
						["self"] = {
							["ModelIndex"] = 1,
							["UniqueID"] = "4041606633",
							["AimPartUID"] = "",
							["Hide"] = false,
							["Name"] = "",
							["ClassName"] = "bodygroup",
							["OwnerName"] = "self",
							["IsDisturbing"] = false,
							["EditorExpand"] = false,
							["BodyGroupName"] = "airfilter"
						}
					}
				},
				["self"] = {
					["Skin"] = 0,
					["Invert"] = false,
					["LightBlend"] = 1,
					["CellShade"] = 0,
					["OwnerName"] = "self",
					["AimPartName"] = "",
					["IgnoreZ"] = false,
					["AimPartUID"] = "",
					["Passes"] = 1,
					["Name"] = "gasmask male",
					["NoTextureFiltering"] = false,
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["IsDisturbing"] = false,
					["Fullbright"] = false,
					["EyeAngles"] = false,
					["DrawOrder"] = 0,
					["TintColor"] = Vector(0, 0, 0),
					["UniqueID"] = "1673967573",
					["Translucent"] = false,
					["LodOverride"] = -1,
					["BlurSpacing"] = 0,
					["Alpha"] = 1,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["UsePlayerColor"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "eyes",
					["Color"] = Vector(255, 255, 255),
					["Brightness"] = 1,
					["BoneMerge"] = false,
					["BlurLength"] = 0,
					["Position"] = Vector(-2.49609375, -0.234130859375, -4.0348052978516),
					["AngleOffset"] = Angle(0, 0, 0),
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["OwnerEntity"] = false,
					["Scale"] = Vector(1, 1, 1.1499999761581),
					["ClassName"] = "model",
					["EditorExpand"] = true,
					["Size"] = 1,
					["ModelFallback"] = "",
					["Angles"] = Angle(36.54178237915, -0.33553421497345, -0.19983570277691),
					["TextureFilter"] = 3,
					["Model"] = "models/items/gasmask.mdl",
					["BlendMode"] = ""
				}
			}
		},
		["self"] = {
			["DrawOrder"] = 0,
			["UniqueID"] = "1464469529",
			["AimPartUID"] = "",
			["Hide"] = false,
			["Duplicate"] = false,
			["ClassName"] = "group",
			["OwnerName"] = "self",
			["IsDisturbing"] = false,
			["Name"] = "",
			["EditorExpand"] = true
		}
	}
}

ITEM.iconCam = {
	pos = Vector(-8.3524475097656, -5.462616443634, 11.989459037781),
	ang = Angle(42.727111816406, 30.021291732788, -3.8562169075012),
	fov = 63.662600579639
}

function ITEM:PaintOver(item, w, h)
    local airFilterLeft = item:GetData("airFilterLeft")
    local equipped = item:GetData("equip", false)

    if airFilterLeft != nil then
        surface.SetDrawColor(equipped and HSVToColor((.25 * 360) * airFilterLeft, 1, 1) or Color(118,118,118))
        surface.DrawRect(2, h - 4, (w - 4) * airFilterLeft, 2)
    end

    if (equipped) then
		surface.SetDrawColor(110, 255, 110, 100)
		surface.DrawRect(w - 14, h - 14, 8, 8)
	end
end

if SERVER then
	timer.Create("gasMaskTimer", 1, 0, function()
		for _, ply in ipairs(player.GetAll()) do
			local character = ply:GetCharacter()
			if not character then continue end
			local inventory = character:GetInventory()
			local items = inventory:GetItems()

			for _, item in pairs(items) do
				if item.uniqueID ~= "gasmask" then continue end

				local equipped = item:GetData("equip", false)
				local airFilterLeft = item:GetData("airFilterLeft", 1)
                local airFilter = item:GetData("airfilter", false)
				ply:SetNetVar("airfilter", airFilter)
				
				if not ply.inToxicGas then continue end

				if equipped 
                and airFilter then
                    local timeInGas = 60 * 10
                    local adjusted = airFilterLeft - (1 / timeInGas)

					item:SetData("airFilterLeft", adjusted)

					if airFilterLeft <= 0 then
						item:SetData("airfilter", false)
						ply:SetNetVar("airfilter", false)
						item.player = ply
						item:RefreshPAC()
					end
				end
			end
		end
	end)
end