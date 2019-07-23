class AddMemberIdToBillsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :member_id, :integer    
  end
end
