class BillSerializer < ActiveModel::Serializer
  belongs_to :member

  attributes :id, :congress, :bill_id, :chamber, :number, :title, :short, :title, :sponsor_id, :govtrack_url, :introduced_date, :active, :last_vote, :house_passage, :senate_passage, :enacted, :vetoed, :cosponsors, :cosponsors_by_party, :committees, :primary_subject
end
