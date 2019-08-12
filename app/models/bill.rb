class Bill < ApplicationRecord
  belongs_to :member, optional: true


  def self.update_party_color
    if bill.cosponsors
      cbp = bill.cospsonsors_by_party
      if cbp["R"] && cbp["R"] > cbp["D"]
          color = "red"
      elsif cbp["D"] && cbp["D"] > cbp["R"]
          color = "blue"
      elsif cbp["R"] &&
        cbp["D"] && cbp["R"] == cbp["D"]
          color = "purple"
      else
        color = "white"
      end
    end
  end


end
