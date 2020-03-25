class BillsController < ApplicationController

  #get 20 most recent bills by member id
  def search_by_member
    id = params[:id]
    @member = Member.find_by(propublica_id: id)
    @resp = Faraday.get 'https://api.propublica.org/congress/v1/members/'+id+'/bills/introduced.json' do |req|
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
    bills_data = JSON.parse(@resp.body)
    bills = bills_data["results"][0]["bills"]

  #add bill to db if not already there
    bills.each do |bill|
        found_bill = Bill.find_by(bill_id: bill["bill_id"])
        if !found_bill
          Bill.create!(
            bill_id: bill["bill_id"],
            congress: bill["congress"],
            bill_type: bill["bill_type"],
            color: "",
            number: bill["number"],
            short_title: bill["short_title"],
            sponsor_id: bill["sponsor_id"],
            govtrack_url: bill["govtrack_url"],
            introduced_date: bill["introduced_date"],
            active: bill["active"],
            last_vote: bill["last_vote"],
            house_passage: bill["house_passage"],
            senate_passage: bill["senate_passage"],
            enacted: bill["enacted"],
            vetoed: bill["vetoed"],
            committees: bill["committees"],
            primary_subject: bill["primary_subject"],
            member_id: @member.id
          )
        else
          found_bill.update(
            active: bill["active"],
            last_vote: bill["last_vote"],
            house_passage: bill["house_passage"],
            senate_passage: bill["senate_passage"],
            enacted: bill["enacted"],
            vetoed: bill["vetoed"],
            committees: bill["committees"],
          )
        end
    end

    if @member.bills
      render json: @member.bills
    else
      response={error:"We could not find any bills sponsored by this Congress Member. Please try again"}
      render response
    end
  end


  def search_by_query
    query = params[:query]
    @resp = Faraday.get 'https://api.propublica.org/congress/v1/bills/subjects/'+query+'.json' do |req|
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
    bills_data = JSON.parse(@resp.body)
    data = bills_data["results"]
    @active_bills = data.select{|bill| bill["active"] == true}

    if @active_bills
      @active_bills.sort_by{ |b| b["introduced_date"].split('/') }
      @active_bills.each do |bill|
        if !Bill.find_by(bill_id: bill["bill_id"])
          Bill.create!(
          active: bill["active"],
          bill_id: bill["bill_id"],
          congress: bill["congress"],
          bill_type: bill["bill_type"],
          color: "",
          number: bill["number"],
          short_title: bill["short_title"],
          sponsor_id: bill["sponsor_id"],
          govtrack_url: bill["govtrack_url"],
          introduced_date: bill["introduced_date"],
          last_vote: bill["last_vote"],
          house_passage: bill["house_passage"],
          senate_passage: bill["senate_passage"],
          enacted: bill["enacted"],
          vetoed: bill["vetoed"],
          primary_subject: bill["primary_subject"],
          cosponsors: bill["cosponsors"],
          cosponsors_by_party: bill["cosponsors_by_party"],
          committees: bill["committees"],
        )
        end
      end
      render json: @active_bills
    else
      response={error:"We could not find any active bills on this subject. Please try a broader search term."}
      render response
    end
  end


  def index
    @bills = Bill.all
    render json: @bills
  end


end
