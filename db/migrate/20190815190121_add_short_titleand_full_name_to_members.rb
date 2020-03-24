class AddShortTitleandFullNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :full_name, :string
    add_column :members, :title_and_name, :string
  end
end
