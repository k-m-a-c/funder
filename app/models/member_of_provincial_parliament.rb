class MemberOfProvincialParliament < ActiveRecord::Base
  belongs_to :riding, dependent: :destroy
end
