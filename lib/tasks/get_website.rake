namespace :organization do
  desc "Given an org's name, get a website containing its mailing address"
  task :get_website => [:dependent, :tasks] do
    require 'mechanize'
    require 'nokogiri'
    require 'fibonaccia'

    # pick organization to research
    def pick_organization
      number = rand(Organization.first.id..Organization.last.id)
      organization = Organization.find(number)

      if organization.imported_url.nil?
        organization.name
      else
        pick_organization
      end
    end

    # format url to query
    organization_name = pick_organization

    def format_url(org)
      web_safe_name = org.gsub(/\s/, "+")
      url = "https://www.google.ca/search?q=" + web_safe_name
    end

    url = format_url(organization_name)

    # get search results page
    def get_search_result_page(url)
      time_to_wait = (Fibonaccia.PHI * rand(1..25))
      sleep(time_to_wait)
      agent = Mechanize.new
      agent.get(url)
    end

    page = get_search_result_page(url)
  end
end