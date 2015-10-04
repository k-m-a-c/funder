class Riding < ActiveRecord::Base
  has_one :member_of_provincial_parliament
  has_many :organizations

  def self.format_imported_riding(name)
    if name.include?("--") && name.include?(" ")
        name.downcase!.gsub!("--", "-").gsub!(" ", "-")

    elsif name.include?("--")
      name.downcase!.gsub!("--", "-")

    # handle "ST. PAUL'S"
    elsif name.include?("'")
      name.downcase!.gsub!("'", "").gsub!(
        ".", "").gsub!(" ", "-")

    elsif name.include?(".") && !name.include?("'")
      name.downcase!.gsub!(".", "").gsub!(" ", "-")

    else
      if name.include?(" ")
        name.gsub!(" ", "-")
      end
      name.downcase!
    end
    name
  end

  def self.get_user_riding(postal_code)
    # ensure postal code is properly formatted
    if postal_code.include?(" ")
      postal_code.gsub!(" ", "")
    end

    # post form on Elections Canada site
    # url: "http://fyed.elections.on.ca/fyed/en/form_page_en.jsp"
    scraper = Scraper.new
    response = scraper.get_riding_name(postal_code)

    # format imported riding name & match to riding
    riding_name = self.format_imported_riding(response)
    id = self.find_by(url_safe_name: riding_name).id
  end

  def total_funding
    amounts = []
    organizations.each do |org|
      amounts << org.transfer_payments.sum(:amount).to_i
    end
    amounts.inject(:+)
  end

end
