class Bill < ApplicationRecord
  belongs_to :member, optional: true


end
