namespace :ridings do
  desc "Calculate the total funding for every riding based on its organizations"
  task :assign_funding => :environment do
    puts "Starting task..."
    Riding.all.each do |riding|
      puts "Calculating #{riding.name} funding..."
      riding.funding = riding.total_funding
      puts "#{riding.name}: #{riding.funding}"
      riding.save
    end
    puts "Task complete."
  end
end