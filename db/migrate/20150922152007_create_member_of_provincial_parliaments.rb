class CreateMemberOfProvincialParliaments < ActiveRecord::Migration
  def change
    create_table :member_of_provincial_parliaments do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :profile_image

      t.timestamps null: false
    end
  end
end
