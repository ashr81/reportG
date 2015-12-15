class LatLongAdditionController < ApplicationController
	count = 0
	CSV.open("/home/ashrith/Desktop/reportG/vendor/output.csv","wb") do |csv|
		CSV.foreach("/home/ashrith/Desktop/reportG/vendor/data.csv") do |row|
			if count == 0
				row<<"Latitudes"<<"Longitudes"    #adding latitude and longitude headers on the first line
			else
				lat = ''
				lng = ''
				if row[5] == "City"
					#byebug
					newLatLng = LatLongAddition.search_for(row[1],row[4]) #fetching data from API
					if newLatLng["totalResultsCount"] > 0
						lat = newLatLng["geonames"][0]["lat"] 
						lng = newLatLng["geonames"][0]["lng"]
						newLatLng["geonames"].each do |arr|      #loop to chose the best results
							fcode = arr["fcode"]                 
							if fcode == "PPL" || fcode == "GOVL"  
							#choose these latitude and longitude as PPL and GOVL are related to a city
								lat = arr["lat"]
								lng = arr["lng"]
								break 
							end
						end
					end
				end
				#byebug
				row<<lat<<lng   #appending latitude and longitude to row of the input csv file
			end
			count += 1
			csv<<row   #inserting formatted row into the output file
			#break if count >= 5	
		end
	end
	def index	
	end
end
