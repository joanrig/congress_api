class AddStatusAndStatusNoteColumnToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :status, :string
    add_column :members, :status_note, :string
  end
end
