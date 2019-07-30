class Bill < ApplicationRecord
  belongs_to :member, optional: true


  def self.update_party_color
    if bill.cosponsors
      if bill.cosponsors_by_party["R"] &&
        bill.cosponsors_by_party["R"] > bill.cosponsors_by_party["D"]
          color = "red"
      elsif bill.cosponsors_by_party["D"] &&
        bill.cosponsors_by_party["D"] > bill.cosponsors_by_party["R"]
          color = "blue"
      elsif bill.cosponsors_by_party["R"] &&
        bill.cosponsors_by_party["D"] && bill.cosponsors_by_party["R"] == bill.cosponsors_by_party["D"]
          color = "purple"
      else
        color = "white"
      end
    end
  end


end
