class AddSearchTermColToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :search_term, :string
  end
end
