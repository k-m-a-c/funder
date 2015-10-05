namespace :ridings do
  desc "Remove non-url-safe characters from all riding names"
  task :get_url_safe_name => :environment do
    puts "Starting task..."
    Riding.all.each do |riding|
      puts "Getting url safe name for #{riding.name}..."
      if riding.name.include?("\u{2014}")
        riding.url_safe_name = riding.name.gsub(/\u{2014}/, "-").downcase
        riding.url_safe_name.gsub!(" ", "-")
        riding.save

      elsif riding.name.include?(".")
        riding.url_safe_name = riding.name.gsub(".", "").downcase
        riding.url_safe_name.gsub!(" ", "-")
        riding.save

      # to handle "St. Paul's"
      elsif riding.name.include?("'")
        riding.url_safe_name = riding.name.gsub("'", "").downcase
        riding.url_safe_name.gsub!(".", "")
        riding.url_safe_name.gsub!(" ", "-")
        riding.save

      else
        riding.url_safe_name = riding.name.downcase
        riding.url_safe_name.gsub!(" ", "-")
        riding.save
      end
      puts "url_safe_name: #{riding.url_safe_name}"
    end
    puts "Task complete."
  end
end