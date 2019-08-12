class MemberDonor < ApplicationRecord
  belongs_to :member
  belongs_to :donor
end
