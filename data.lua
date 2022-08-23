weatherCodes = {
	[0] = { { type = 'extrasunny', chance = 100 } }, -- Clear sky
	[1] = { { type = 'neutral', chance = 100 } }, -- Mainly clear
	[2] = { { type = 'clouds', chance = 100 } }, -- Partly cloudy
	[3] = { { type = 'overcast', chance = 100 } }, -- Overcast
	[45] = { { type = 'fog', chance = 100 } }, -- Fog
	[48] = { { type = 'fog', chance = 100 } }, -- Depositing rime fog
	[51] = { { type = 'clearing', chance = 100 } }, -- Drizzle light
	[53] = { { type = 'clearing', chance = 100 } }, -- Drizzle moderate
	[55] = { { type = 'clearing', chance = 100 } }, -- Drizzle dense
	[56] = { { type = 'blizzard', chance = 50 }, { type = 'overcast', chance = 50 } }, -- Freezing drizzle light
	[57] = { { type = 'blizzard', chance = 75 }, { type = 'overcast', chance = 25 } }, -- Freezing drizzle heavy
	[61] = { { type = 'rain', chance = 80 }, { type = 'overcast', chance = 10 } }, -- Rain slight
	[63] = { { type = 'rain', chance = 90 }, { type = 'overcast', chance = 20 } }, -- Rain moderate
	[65] = { { type = 'rain', chance = 100 } }, -- Rain heavy
	[66] = { { type = 'blizzard', chance = 800 }, { type = 'overcast', chance = 20 } }, -- Freezing rain light
	[67] = { { type = 'blizzard', chance = 100 } }, -- Freezing rain heavy
	[71] = { { type = 'snow', chance = 75 }, { type = 'overcast', chance = 25 } }, -- Snow fall slight
	[73] = { { type = 'snow', chance = 100 } }, -- Snow fall moderate
	[75] = { { type = 'xmas', chance = 100 } }, -- Snow fall heavy
	[77] = { { type = 'xmas', chance = 100 } }, -- Snow grains
	[80] = { { type = 'rain', chance = 10 }, { type = 'overcast', chance = 70 }, { type = 'clouds', chance = 20 } }, -- Rain showers slight
	[81] = { { type = 'rain', chance = 20 }, { type = 'overcast', chance = 80 } }, -- Rain showers moderate
	[82] = { { type = 'rain', chance = 40 }, { type = 'overcast', chance = 60 } }, -- Rain showers violent
	[85] = { { type = 'snow', chance = 20 }, { type = 'overcast', chance = 80 } }, -- Snow showers slight
	[86] = { { type = 'snow', chance = 40 }, { type = 'overcast', chance = 60 } }, -- Snow showers heavy
	[95] = { { type = 'thunder', chance = 25 }, { type = 'rain', chance = 75 } }, -- Thunderstorm (only available in central europe)
	[96] = { { type = 'thunder', chance = 50 }, { type = 'rain', chance = 50 } }, -- Thunderstorm slight hail (only available in central europe)
	[99] = { { type = 'thunder', chance = 75 }, { type = 'rain', chance = 25 } }, -- Thunderstorm heavy hail (only available in central europe)
}

presetLocations = {
	['berlin'] = { lat = 52.52, long = 13.41 },
	['paris'] = { lat = 48.85, long = 2.35 },
	['london'] = { lat = 51.50, long = -0.13 },
	['madrid'] = { lat = 40.42, long = -3.70 },
	['amsterdam'] = { lat = 52.37, long = 4.89 },
}
