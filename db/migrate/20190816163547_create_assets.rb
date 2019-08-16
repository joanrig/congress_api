class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.integer "asset_report_id"
      t.string "name"
      t.integer "holdings_low"
      t.integer "holdings_high"
      t.string "industry"
      t.timestamps
    end
  end
end
