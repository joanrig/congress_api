class AddSearchTermColToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :searchable_string, :string
  end
end
