namespace :organizations do
  desc "Calculate the total funding for every organization based on its transfer payments"
  task :assign_funding => :environment do
    puts "Starting task..."
    Organization.all.each do |org|
      next if org.transfer_payments.length.nil?
      puts "Calculating #{org.name} funding..."
      org.calculate_funding
      puts "#{org.funding}"
    end
    puts "Task complete."
  end

end