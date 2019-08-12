class DonorSerializer < ActiveModel::Serializer
  has_many :members

  attributes :id, :org_name, :total, :pacs, :indivs
end
