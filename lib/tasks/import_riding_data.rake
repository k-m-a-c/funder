namespace :organizations do
  desc "Import the riding of origin for all the organizations given a postal code"
  task :import_riding_data => :environment do
    puts "Starting task..."
    puts "Instantiating web scraper..."
    scraper = Scraper.new
    puts "Web scraper up!"
    Organization.all.each do |org|
      next if org.imported_postal_code.nil?
      next if !org.imported_riding_name.nil?
      puts "Getting riding name for #{org.name}..."
      next if scraper.get_riding_name(org.imported_postal_code).nil?
      org.imported_riding_name = scraper.get_riding_name(org.imported_postal_code)
      puts "#{org.name} is located in #{org.imported_riding_name}"
      org.save
    end
    puts "Task complete."
  end
end