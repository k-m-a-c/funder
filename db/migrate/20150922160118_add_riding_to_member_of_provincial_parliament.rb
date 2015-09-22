class AddRidingToMemberOfProvincialParliament < ActiveRecord::Migration
  def change
    add_reference :member_of_provincial_parliaments, :riding, index: true, foreign_key: true
  end
end
