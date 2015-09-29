require 'mechanize'
require 'nokogiri'
require 'fibonaccia'

class WebScraper

  def initialize
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
  end

  # pick organization to research
  def pick_organization
    number = rand(Organization.first.id..Organization.last.id)
    organization = Organization.find(number)

    if organization.imported_url.nil?
      organization
    else
      pick_organization
    end
  end

  # format url to query
  def format_url(org)
    web_safe_name = org.gsub(/\s/, "+")
    url = "https://www.google.ca/search?q=" + web_safe_name
  end

  # get search results page
  def get_search_result_page(url)
    time_to_wait = (Fibonaccia.PHI * rand(1..25))
    sleep(time_to_wait)
    @agent.get(url)
  end

  # get the first link from the results page
  def get_first_link(page)
    link = page.root.css('h3.r > a[href]').first
    link.attributes["href"].value
  end

  def follow_link(link, page)
     link = Mechanize::Page::Link.new link, @agent, page
     @page = link.click
  end

  def get_mailing_address

  end

  # check to see if an url and address have been collected
  # for each organization
  def is_finished?
    current = []
    total = Organization.count

    Organization.all.each do |org|
      if !org.imported_url.nil? && !org.imported_mailing_address.nil?
        current << org
      end
    end

    unless current.length === total
      puts "#{current.length} of #{total} complete"
      false
    else
      true
    end
  end

  def run
    unless is_finished?
      puts "Picking organization..."
      org = pick_organization.name
      puts "#{org}"

      puts "Formatting Google query..."
      url = format_url(org)
      puts "#{url}"

      puts "Getting search results page..."
      result = get_search_result_page(url)
      puts "#{result}"

      puts "Getting first link on the page and setting it as org imported_url..."
      link = get_first_link(result)
      puts "#{get_first_link(result)}"

      org.imported_url = link
      org.save!
      puts "Saved to organzation record in database"

      puts "Following link..."
      page = follow_link(link)
    else
      puts "Scrape complete."
      break
    end
  end
end