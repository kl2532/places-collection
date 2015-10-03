namespace :NYCDataImport do
	desc "Read file and import data"
	task :import_restaurant_inspection_data do
		puts "starting to read in CSV"
		require 'csv'
		CSV.foreach('DOHMH_New_York_City_Restaurant_Inspection_Results.csv', :headers => true) do |row|
			name = row[1].strip
			boro =row[2].strip
			street_num = row[3].strip.to_i
			street_name = row[4].strip
			zip_code = row[5].strip.to_i
			cuisine = row[7].strip
			inspection_date = row[8].strip
			grade = row[14].strip
			puts "row elem0: name = #{name} boro = #{boro} street_num = #{street_num} street_name = #{street_name}" 
			puts "zip_code = #{zip_code} cuisine = #{cuisine} inspection_date = #{inspection_date} grade = #{grade}" 

			Restaurant.create!(:name => name, :boro => boro, :street_num => street_num, 
				:street_name => street_name, :zip_code => zip_code, :cuisine => cuisine,
				:inspection_date => inspection_date, :grade => grade)
			break
			#restaurants.read.each_line do |restaurant|
			#	puts row.inspect
			#	break

				# code, longitude, latitude = zip_code.chomp.split(",")
    			#  to remove the quotes from the csv text:
    			# code.gsub!(/\A"|"\Z/, '')
    			# to create each record in the database
    			# Restaurant.create!(:zip_code => code, :longitude => longitude, :latitude =>      latitude)

    		#end
		end
	end
end