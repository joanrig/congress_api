
class AddAgeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :age, :integer
  end
end
