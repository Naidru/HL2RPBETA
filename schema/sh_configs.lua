
ix.currency.symbol = "ⓣ"
ix.currency.singular = "token"
ix.currency.plural = "tokens"

ix.config.SetDefault("scoreboardRecognition", true)
ix.config.SetDefault("music", "CourragatedDawn/Startup/HL2_E3_Trailer_Music_P1.wav")
ix.config.SetDefault("maxAttributes", 60)

ix.config.Add("rationTokens", 20, "The amount of tokens that a person will get from a ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("rationInterval", 300, "How long a person needs to wait in seconds to get their next ration", nil, {
	data = {min = 0, max = 86400},
	category = "economy"
})
