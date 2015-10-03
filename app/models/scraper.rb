require 'mechanize'
require 'nokogiri'

class Scraper
  def initialize
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
  end

  def self.url
    "http://fyed.elections.on.ca/fyed/en/form_page_en.jsp"
  end

  def self.element_path
    "td.smallText > p > span"
  end

  def check_for_element(response)
  end

  def get_riding_name(postal_code)
    @page = @agent.get(self.class.url)
    @form = @page.form_with :name => 'pcode'
    @form.field_with(:name => 'pcode').value = postal_code
    @response = @agent.submit @form
    @response.search(self.class.element_path).text
  end
end