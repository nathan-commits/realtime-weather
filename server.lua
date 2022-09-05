GlobalState.weatherType = nil

local function DebugLog(string, ...)
	if GetConvar('weather_debugMode', 'false') == 'true' then
		local string = tostring(string)
		print(string:format(...))
	end
end

local function GetWeatherType(weatherCode)
	local weatherTypes = weatherCodes[weatherCode]
	local random = math.random(1, 100)
	local weatherType = weatherTypes[1].type

	if GetConvar('weather_disableDynamic', 'false') ~= 'true' then
		for i = 1, #weatherTypes do
			random = random - weatherTypes[i].chance

			if random < 0 then
				weatherType = weatherTypes[i].type
				break
			end
		end
	end

	if weatherType == 'xmas' and GetConvar('weather_disableSnow', 'false') == 'true' then
		weatherType = 'snow'
	end

	return weatherType
end

local function RequestWeather(cb)
	local requestStart = GetGameTimer()
	local latitude = GetConvar('weather_latitude', '0')
	local longitude = GetConvar('weather_longitude', '0')
	local location = string.lower(GetConvar('weather_presetLocation', 'paris'))

	if latitude == '0' and longitude == '0' and presetLocations[location] then
		latitude = presetLocations[location].lat
		longitude = presetLocations[location].long
	end

	local url = ('https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&current_weather=true'):format(latitude,
		longitude)

	if GetConvar('weather_useFahrenheit', 'false') == 'true' then
		url = url .. '&temperature_unit=fahrenheit'
	end

	DebugLog('Weather data update starting for %s (latitude) %s (longitude)', latitude, longitude)
	PerformHttpRequest(url, function(errorCode, resultData)
		local resultObject = json.decode(resultData)

		if errorCode == 400 or not resultObject then
			return DebugLog('Weather data update failed')
		end

		DebugLog('Weather data update finished in %d ms', GetGameTimer() - requestStart)
		cb(resultObject)
	end)
end

local function UpdateWeather()
	RequestWeather(function(weather)
		local currentWeather = weather.current_weather
		local weatherCode = math.floor(currentWeather.weathercode)
		local weatherType = GetWeatherType(weatherCode)

		GlobalState.weatherType = weatherType
		GlobalState.temperature = currentWeather.temperature

		DebugLog('New weather type: %s', weatherType)
	end)
end

CreateThread(function()
	while true do
		UpdateWeather()
		Wait(GetConvarInt('weather_updateFrequency', 600000))
	end
end)

RegisterNetEvent('realtimeWeather:requestTime', function()
	if GetConvar('weather_realtimeTime', 'false') == 'false' then return end

	DebugLog('Updating realtime time for %d', source)
	TriggerClientEvent('realtimeWeather:updateTime', source, os.date('*t'))
end)
