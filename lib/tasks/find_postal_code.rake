namespace :organizations do
  desc "Find the postal code for all organizations given an imported mailing address"
  task :find_postal_code => :environment do
    puts "Starting task..."
    Organization.all.each do |org|
      if org.imported_postal_code.nil?
        puts "#{org.name} looking for postal code..."
        next if org.imported_mailing_address.nil?
        next if org.imported_mailing_address.slice(
          /[A-Z]{1}\d{1}[A-Z]{1}\s{1}\d{1}[A-Z]{1}\d{1}/
        ).nil?
        org.find_postal_code
        puts "#{org.name}, postal code: #{org.imported_postal_code}"
      else
        puts "#{org.name} already has a postal code"
      end
    end
    puts "Task complete."
  end
end