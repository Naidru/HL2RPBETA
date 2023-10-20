PLUGIN.name = "PAC3 Flag"
PLUGIN.author = "NS: Alex_07 IX: Vinyl"
PLUGIN.description = "Simple PAC3 flag and PACban command for player."

ix.flag.Add("Z", "Gives access to the PAC3 editor.")

hook.Add( "PrePACEditorOpen", "FlagCheck", function( client )
   if not client:GetChar():HasFlags("Z") then
       return false
   end
end )

ix.command.Add("pacban", {
	description = "Bans a player from using PAC3.",
	adminOnly = true,
	arguments = {
		ix.type.player
	},
	OnRun = function (self, client, target)	
		pace.Ban(target)
		client:Notify("Player "..target:Name().." has been banned from using PAC3")
	end
})

ix.command.Add("pacunban", {
	description = "Unbans a player from using PAC3",
	adminOnly = true,
	arguments = {
		ix.type.player
	},
	OnRun = function (self, client, target)	
		pace.Unban(target)
		client:Notify("Player "..target:Name().." has been unbanned from using PAC3")
	end
})
