class BillsController < ApplicationController

  def search
    Bill.get_bills_by_member
  end

  def create
    if Bill.get_bills_by_member
      Bill.get_bills_by_member.each do |bill|
      Bill.create(
        congress: bill["congress"],
        bill_id: bill["bill_id"],
        chamber: bill["bill_type"],
        number: bill["number"],
        title: bill["title"],
        short_title: bill["short_title"],
        sponsor_id: bill["sponsor_id"],
        gov_track_url: bill["govtrack_url"],
        introduced_date: bill["introduced_date"],
        active: bill["active"],
        last_vote: bill["last_vote"],
        house_passage: bill["house_passage"],
        senate_passage: bill["senate_passage"],
        enacted: bill["enacted"],
        vetoed: bill["vetoed"],
        cosponsors: bill["cosponsors"],
        consponsors_by_party: bill["consponsors_by_party"],
        committees: bill["committees"],
        primary_subject: bill["primary_subject"]
      )
  end

  def index

    @bills = Bill.all
    render json: @bills
  end




end
