class AddCrpIdToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :crp_id, :string
  end
end
