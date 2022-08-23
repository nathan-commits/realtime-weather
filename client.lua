
local function SetWeather(code, instant)
	SetWeatherTypeOvertimePersist(weatherCodes[code].type, instant and 0.0 or 15.0)
end

CreateThread(function()
	SetWeatherOwnedByNetwork(false)

	if GlobalState.weatherType then
		SetWeather(GlobalState.weatherType, true)
	end
end)

AddStateBagChangeHandler('weatherType', 'global', function(bagName, key, value)
	SetWeather(value)
end)

RegisterNetEvent('realtimeWeather:updateTime', function(now)
	SetMillisecondsPerGameMinute(60000)
	NetworkOverrideClockTime(now.hour, now.min, now.sec)
end)

TriggerServerEvent('realtimeWeather:requestTime')
