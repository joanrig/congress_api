class FinancialDisclosureSerializer < ActiveModel::Serializer
  belongs_to :member
  has_many :donors

  attributes :id, :cid, :cycle, :origin, :source, :notice
end
