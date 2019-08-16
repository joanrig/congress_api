class CreateAssetReports < ActiveRecord::Migration[5.2]
  def change
    create_table "asset_reports", force: :cascade do |t|
      t.integer "member_id"
      t.string "crp_id"
      t.integer "data_year"
      t.integer "net_low"
      t.integer "net_high"
      t.integer "asset_count"
      t.integer "asset_low"
      t.integer "asset_high"
      t.string "source"
      t.string "origin"
    end
  end
end
