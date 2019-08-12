class CreateMemberDonors < ActiveRecord::Migration[5.2]
  def change
    create_table :member_donors do |t|
      t.integer "member_id"
      t.integer "donor_id"
      t.timestamps
    end
  end
end
