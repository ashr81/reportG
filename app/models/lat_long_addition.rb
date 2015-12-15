

class LatLongAddition < ActiveRecord::Base
	include HTTParty    # HTTParty gem to documentation:https://github.com/jnunemaker/httparty#httparty
	base_uri 'http://api.geonames.org/searchJSON'  
	format :json
	def self.search_for(name,country)
		get("",{query:{name_equals: name, country: country, maxRows: 10, username:"ashr81"}})
	end
end
