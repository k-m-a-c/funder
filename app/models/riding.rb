class Riding < ActiveRecord::Base
  has_one :member_of_provincial_parliament
  has_many :organizations

  def total_funding
  end
end
