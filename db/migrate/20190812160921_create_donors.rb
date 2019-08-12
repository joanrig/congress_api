class CreateDonors < ActiveRecord::Migration[5.2]
  def change
    create_table :donors do |t|
      t.string "org_name"
      t.integer "total"
      t.integer "pacs"
      t.integer "indivs"
      t.timestamps
    end
  end
end
