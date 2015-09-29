class MemberOfProvincialParliament < ActiveRecord::Base
  belongs_to :riding, dependent: :destroy

  def make_first_name(full_name)
    first_name = full_name.slice(/^[a-zA-Z]*/)
  end

  def self.query_open_north_api
    include HTTParty
    base_uri "https://scrapers.herokuapp.com/represent"

    endpoint = "/ca_on/"
    composed_url = "#{endpoint}"
    data = get(composed_url)
  end

  def self.parse_response
    response = query_open_north_api
    array = JSON.parse(response.body)
  end

  def self.import_mpp_data!
    parse_response.map{|mpp|
      member = MemberOfProvincialParliament.new
      member.full_name = mpp['name']
      member.first_name = member.make_first_name(member.full_name)
      member.profile_image = mpp['photo_url']
      member.email = mpp['email']
      # create associated Riding
      member.riding = Riding.create(name: mpp['district_name'])
      member.party = mpp['party_name']
      member.save!
    }
  end
end