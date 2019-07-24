class BillsController < ApplicationController

#get 20 most recent bills by member id
  def search
    id = params[:id]

    if id
      @resp = Faraday.get `https://api.propublica.org/congress/v1/members/#{id}/bills/introduced.json` do |req|
        req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
      end
      bills_data = JSON.parse(@resp.body)
      bills = bills_data["results"][0]["members"]
      Bill.create(bills)

      member = Member.find_by(propublica_id: id)
      if member.bills
        render json: member.bills
      else
        response={error:"We could not find any bills sponsored by this Congress Member. Please try again"}
      end
    end
  end


  def index
    @bills = Bill.all
    render json: @bills
  end

  def create(bills)
    #use faraday data packet bills
    bills.each do |bill|
      new_bill = Bill.new(
        bill_id: bill["bill_id"],
        )

  #but first make sure they aren't already in db.
      if !Bill.find_by(bill_id: new_bill.id)
        new_bill.update(
          congress: bill["congress"],
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
        member = Member.find_by(propublica_id: new_bill.sponsor_id)
        member.bills << new_bill
      end
    end

  end






end
