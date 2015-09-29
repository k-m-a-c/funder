namespace :organization do
  desc "Import location data for a given organization from the Google Places API"
  task :get_location_data => :environment do
    puts "Starting task..."
    Organization.all.each do |org|
      if !org.imported_mailing_address.nil?
        puts "#{org.name} already has location data"
      elsif org.name.nil?
        puts "#{org.id} has no name to query"
      else
        puts "Getting location data for #{org.name}"
        org.import_location_data!
      end
    end
    puts "Task complete."
  end
end