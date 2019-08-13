class FinancialDisclosure < ApplicationRecord
  belongs_to :member
  has_many :donors
end
