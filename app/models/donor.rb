class Donor < ApplicationRecord
  has_many :members, through: :financial_disclosure
end
