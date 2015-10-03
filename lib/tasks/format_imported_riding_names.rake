namespace :organizations do
  desc "Clean up the formatting of an organization's imported riding name"
  task :format_imported_riding_names => :environment do
    puts "Starting task..."

    Organization.all.each do |org|
      next if org.imported_riding_name.nil?
      puts "Formatting #{org.imported_riding_name}"
      if org.imported_riding_name.include?("--") && org.imported_riding_name.include?(" ")
        org.imported_riding_name.downcase!.gsub!("--", "-").gsub!(
          " ", "-")
        org.save
        puts "New formatting: #{org.imported_riding_name}"

      elsif org.imported_riding_name.include?("--")
        org.imported_riding_name.downcase!.gsub!("--", "-")
        org.save
        puts "New formatting: #{org.imported_riding_name}"

      # handle "ST. PAUL'S"
      elsif org.imported_riding_name.include?("'")
        org.imported_riding_name.downcase!.gsub!("'", "").gsub!(
          ".", "").gsub!(" ", "-")
        org.save
        puts "New formatting: #{org.imported_riding_name}"

      elsif org.imported_riding_name.include?(".") && !org.imported_riding_name.include?("'")
        org.imported_riding_name.downcase!.gsub!(".", "").gsub!(
          " ", "-")
        org.save
        puts "New formatting: #{org.imported_riding_name}"

      else
        if org.imported_riding_name.include?(" ")
          org.imported_riding_name.gsub!(" ", "-")
        end
        org.imported_riding_name.downcase!
        org.save
        puts "New formatting: #{org.imported_riding_name}"
      end
    end

    puts "Task complete."
  end
end