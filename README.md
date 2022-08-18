# Realtime Weather
Reallife weather and time sync for FiveM

## Installation
**Git**
```
cd resources
git clone https://github.com/nathan-commits/realtimeWeather
```

**Manual** [download](https://github.com/nathan-commits/realtimeWeather/archive/refs/tags/v.0.1.zip)
- Extract the resource folder into your resources folder

**server.cfg example**
```cfg
# Realtime Weather Convars
set weather_latitude 48.85
set weather_longitude 2.35
set weather_useFahrenheit true
set weather_realtimeTime true

ensure realtimeWeather
```

## Config
The config of this script consists entirely of [convars](https://docs.fivem.net/docs/scripting-reference/convars/). These can be modified during runtime, but it is recommended to do so before starting the script. 

All convars can be set with `set <convar name> <convar value>`

|Convar|Description|Default|
|---|---|---|
|weather_debugMode|Debug prints in the server console|false|
|weather_latitude|Latitude|0|
|weather_longitude|Longitude|0|
|weather_presetLocation|Preset latitude and longitude for: Berlin, Paris, London, Madrid and Amsterdam|"Paris"|
|weather_useFahrenheit|Use fahrenheit for temperature export|false|
|weather_updateFrequency|Weather API update frequency. I strongly recommend not to change this number. The current API only updates once an hour.|600000|
|weather_realtimeTime|Real day and night cycle sync. Works only after relogging or restarting.|false|

## Planned features
- [ ] More dynamic weather. For example, when it rains, several short showers instead of one hour of rain.
- [ ] Possibility to have different weather conditions in Paleto and on Cayo Perico.
- [x] ~~Realistic day and night cycle sync~~.
- [ ] Option to set a different weather or time via an export. 
- [ ] Exports to set or freeze weather and time.
- [ ] Convar value to enable or disable snow on the roads.
- [ ] Possibility of setting a 'personal' time and weather via an export.
- [ ] More preset locations.
