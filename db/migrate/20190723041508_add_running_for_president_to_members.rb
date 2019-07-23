class AddRunningForPresidentToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :running_for_president, :boolean
  end
end
