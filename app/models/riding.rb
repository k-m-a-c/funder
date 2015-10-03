class Riding < ActiveRecord::Base
  has_one :member_of_provincial_parliament

  def total_funding
  end
end
