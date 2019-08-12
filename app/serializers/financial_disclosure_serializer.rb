class FinancialDisclosureSerializer < ActiveModel::Serializer
  belongs_to :member

  attributes :id, :cid, :cycle, :origin, :source, :notice
end
