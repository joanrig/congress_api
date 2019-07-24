class BillsController < ApplicationController


#get bills from database by member id
  def search
    id = params[:id]
    resp = Faraday.get `https://api.propublica.org/congress/v1/members/#{id}/bills/introduced.json` do |req|
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    binding.pry
    end

    data = JSON.parse(@resp.body)
    bills = data["results"][0]["bills"][0]
    @member = Member.find_by(propublica_id: id)

    bills.each do |bill|
      new_bill = Bill.new(
        congress: bill["congress"],
        #more fields here
      )

      #check to see if bill already in db
      Bills.each do |bill|
        if !Bill.find_by_id(bill_id: new_bill_id)
        new_bill.save
        @member.bills << new_bill
      end
      render json: member.bills
    end
  end

  def index
    @bills = Bill.all
    #need to change this to show only member's bills etc.
    render json: @bills
  end




end
