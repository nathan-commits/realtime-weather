local weatherCodes = {
	[0]  = { type = "extrasunny", title = "Clear sky" },
	[1]  = { type = "neutral", title = "Mainly clear" },
	[2]  = { type = "clouds", title = "Partly cloudy" },
	[3]  = { type = "overcast", title = "Overcast" },
	[45] = { type = "fog", title = "Fog" },
	[48] = { type = "smog", title = "Depositing rime fog" },
	[51] = { type = "rain", title = "Drizzle light" },
	[53] = { type = "rain", title = "Drizzle moderate" },
	[55] = { type = "rain", title = "Drizzle dense" },
	[56] = { type = "blizzard", title = "Freezing drizzle light" },
	[57] = { type = "blizzard", title = "Freezing drizzle heavy" },
	[61] = { type = "rain", title = "Rain slight" },
	[63] = { type = "rain", title = "Rain moderate" },
	[65] = { type = "rain", title = "Rain heavy" },
	[66] = { type = "blizzard", title = "Freezing rain light" },
	[67] = { type = "blizzard", title = "Freezing rain heavy" },
	[71] = { type = "snow", title = "Snow fall slight" },
	[73] = { type = "xmas", title = "Snow fall moderate" },
	[75] = { type = "xmas", title = "Snow fall heavy" },
	[77] = { type = "xmas", title = "Snow grains" },
	[80] = { type = "rain", title = "Rain showers slight" },
	[81] = { type = "rain", title = "Rain showers moderate" },
	[82] = { type = "rain", title = "Rain showers violent" },
	[85] = { type = "snow", title = "Snow showers slight" },
	[86] = { type = "snow", title = "Snow showers heavy" },
	[95] = { type = "thunder", title = "Thunderstorm" }, -- only available in central europe
	[96] = { type = "thunder", title = "Thunderstorm slight hail" }, -- only available in central europe
	[99] = { type = "thunder", title = "Thunderstorm heavy hail" }, -- only available in central europe
}

local function setWeatherByCode(code, instant)
	SetWeatherTypeOvertimePersist(weatherCodes[code].type, instant and 0.0 or 15.0)
end

CreateThread(function()
	SetWeatherOwnedByNetwork(false)
	
	if GlobalState.weatherCode then
		setWeatherByCode(GlobalState.weatherCode, true)
	end
end)

AddStateBagChangeHandler("weatherCode", "global", function(bagName, key, value)
	setWeatherByCode(value)
end)

RegisterNetEvent("realtimeWeather:updateTime", function(now)
	SetMillisecondsPerGameMinute(60000)
	NetworkOverrideClockTime(now.hour, now.min, now.sec)
end)

TriggerServerEvent("realtimeWeather:requestTime")