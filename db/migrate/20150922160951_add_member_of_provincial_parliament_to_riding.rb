class AddMemberOfProvincialParliamentToRiding < ActiveRecord::Migration
  def change
    add_reference :ridings, :MemberOfProvincialParliament, index: true, foreign_key: true
  end
end
