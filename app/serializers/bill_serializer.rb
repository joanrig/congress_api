class BillSerializer < ActiveModel::Serializer
  belongs_to :member

  attributes :id, :congress, :bill_id, :bill_type, :number, :title, :short_title, :title, :sponsor_id, :govtrack_url, :introduced_date, :active, :last_vote, :house_passage, :senate_passage, :enacted, :vetoed, :cosponsors, :cosponsors_by_party, :committees, :primary_subject
end


#removed :chamber
