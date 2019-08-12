class CreateFinancialDisclosures < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_disclosures do |t|
      t.integer "member_id"
      t.string "cid"
      t.string "cycle"
      t.string "origin"
      t.string "source"
      t.string "notice"
      t.timestamps
    end
  end
end
