p "Where are you located"

# user_location = gets.chomp
user_location = "Taj Mahal"

p user_location 
gmaps_key = ENV.fetch("GMAPS_KEY")

gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"

# p gmaps_api_endpoint
# get lat and long

require "open-uri"

raw_response = URI.open(gmaps_api_endpoint).read

require "json"

parsed_response = JSON.parse(raw_response)

parsed_response

results_array =  parsed_response.fetch("results")

first_result = results_array.at(0)

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

p loc

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

p latitude
p longitude

pirate_weather_key = ENV.fetch("PIRATE_WEATHER_KEY")


pirate_weather_url = "https://api.pirateweather.net/forecast/#{pirate_weather_key}/#{latitude},#{longitude}"
raw_pirate_weather_data = URI.open(pirate_weather_url).read


parsed_weather = JSON.parse(raw_pirate_weather_data)

p parsed_weather.keys

currently_weather = parsed_weather.fetch("currently")

p currently_weather

currently_temp = currently_weather.fetch("temperature")

p "It is currently #{currently_temp}°F."

p currently_temp
# give info
