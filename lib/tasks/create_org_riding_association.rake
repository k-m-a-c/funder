namespace :organizations do
  desc "Create an ActiveRecord between an organization and its riding"
  task :create_riding_associations => :environment do
    puts "Starting task..."
    Organization.all.each do |org|
      next if org.imported_riding_name.nil?
      riding_object = Riding.find_by(url_safe_name: org.imported_riding_name)
      next if riding_object.nil?
      puts "Creating ActiveRecord assocation between #{org.name} and #{riding_object.name}"
      org.riding = riding_object
      org.save
      puts "Association successfully created."
    end
    puts "Task complete."
  end
end