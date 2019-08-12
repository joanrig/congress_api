class Donor < ApplicationRecord
  has_many :member_donors
  has_many :members, through: :donors
end
