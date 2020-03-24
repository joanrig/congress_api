class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.integer :member_id
      t.boolean :active
      t.string :congress
      t.string :bill_id
      t.string :bill_type
      t.string :color
      t.string :number
      t.string :title
      t.string :short_title
      t.string :sponsor_id
      t.string :govtrack_url
      t.string :introduced_date
      t.boolean :active
      t.string :last_vote
      t.boolean :house_passage
      t.boolean :senate_passage
      t.boolean :enacted
      t.boolean :vetoed
      t.integer :cosponsors
      t.text :cosponsors_by_party
      t.text :committees
      t.string :primary_subject
    end
  end
end
