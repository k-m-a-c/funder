namespace :deploy do
  desc "Populates the db of a new server with data"
  task :populate_db => :environment do
    puts "Starting task..."
    Rake::Task['ministries:import'].invoke
    Rake::Task['organizations:import'].invoke
    Rake::Task['transfer_payments:import'].invoke
    Rake::Task['organization:get_location_data'].invoke
    Rake::Task['organizations:find_postal_code'].invoke
    Rake::Task['organizations:import_riding_data'].invoke
    Rake::Task['organizations:format_imported_riding_names'].invoke
    Rake::Task['ridings:get_url_safe_name'].invoke
    Rake::Task['organizations:create_riding_associations'].invoke
    Rake::Task['organizations:assign_funding'].invoke
    Rake::Task['mpp:import_all'].invoke
    puts "Task complete."
  end
end