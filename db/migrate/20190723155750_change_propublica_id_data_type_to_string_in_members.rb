class ChangePropublicaIdDataTypeToStringInMembers < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :propublica_id, :string
  end
end
