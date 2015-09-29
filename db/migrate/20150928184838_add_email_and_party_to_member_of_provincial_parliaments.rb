class AddEmailAndPartyToMemberOfProvincialParliaments < ActiveRecord::Migration
  def change
    add_column :member_of_provincial_parliaments, :email, :string
    add_column :member_of_provincial_parliaments, :party, :string
  end
end
