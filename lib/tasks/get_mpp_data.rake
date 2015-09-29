namespace :mpp do
  desc "Import all current Ontario MPPs from the Open North API"
  task :import_all => :environment do
    puts "Starting import..."
    MemberOfProvincialParliament.import_mpp_data!
    puts "Import complete."
  end
end