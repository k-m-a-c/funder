class Organization < ActiveRecord::Base
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/place/textsearch/json?query="

  has_many :transfer_payments
  has_many :ministries, through: :transfer_payments
  belongs_to :riding

  def self.api_key
    Figaro.env.google_places_api_key
  end

  def query_google_places_api
    unless build_web_safe_query.nil?
      composed_url = "#{build_web_safe_query}&key=#{self.class.api_key}"
      data = self.class.get(composed_url)
    end
  end

  def build_web_safe_query
    unless name.nil?
      web_safe_name = name.gsub("\u{00C8}", "E").gsub("\u{00C9}", "E").gsub(
        "\u{00C0}", "A").gsub("\u{00C7}", "C").gsub("\u{00D4}", "O").gsub(
        "\u{300}", "").gsub("\u{301}", "").gsub("$", "").gsub(
        "&", "AND").gsub("/", " ").gsub("\\", " ").gsub(":", "").gsub(
        ",", " ").gsub("\"", "").gsub("\u{2019}","'").gsub("[", "").gsub(
        "]", "").gsub("\u{a0}", " ").strip.gsub(/\s/, "+")
    end
  end

  def parse_response
    response = query_google_places_api
    hash = JSON.parse(response.body)
  end

  def import_location_data!
    hash = parse_response
    results = hash['results'].first

    if hash['status'] === "OK" && results['formatted_address'].include?('Canada')
      self.imported_mailing_address = results['formatted_address']
      self.imported_latitude = results['geometry']['location']['lat']
      self.imported_longitude = results['geometry']['location']['lng']
      self.save!
    elsif hash['status'] != "OK"
      puts "Error. Status: #{hash['status']}"
    elsif !results['formatted_address'].include?('Canada')
      puts "Error: Address isn't in Canada"
    else
      puts "Error: An unknown issue occurred"
    end
  end

  def calculate_funding
    self.funding = transfer_payments.inject(0){|sum, payment|
      next if payment.amount.nil?
      sum += payment.amount
    }
    save!
  end

  def find_postal_code
    self.imported_postal_code = imported_mailing_address.slice(
      /[A-Z]{1}\d{1}[A-Z]{1}\s{1}\d{1}[A-Z]{1}\d{1}/
    )
    save!
  end

  def funding_by_ministry
    totals = transfer_payments.group(:ministry_id).sum('amount').map{|k,v|
      {
        value: v.to_i,
        label: Ministry.find(k).name
      }
    }
    totals.map{|hash|
      hash[:label].gsub!(/\W$/, "")
    }
    totals
  end

  def self.sort_most_to_least_funding
    Organization.order(funding: :desc).reject{|org|
      org.funding.nil?
    }
  end
end