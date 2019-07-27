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
      if !Bill.find_by(bill_id: bill["bill_id"])
        Bill.create!(
          bill_id: bill["bill_id"],
          congress: bill["congress"],
          bill_type: bill["bill_type"],
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
      end
    end

    if @member.bills
      render json: @member.bills
    else
      response={error:"We could not find any bills sponsored by this Congress Member. Please try again"}
    end
  end


#works from browser, can't call it from front end.
  def search_by_query
    binding.pry
    query = params[:query]
    @resp = Faraday.get 'https://api.propublica.org/congress/v1/bills/subjects/'+query+'.json' do |req|
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
    bills_data = JSON.parse(@resp.body)
    bills = bills_data["results"]

    if bills
      bills.each do |bill|
        if !Bill.find_by(bill_id: bill["bill_id"])
          Bill.create!(
            bill_id: bill["bill_id"],
            congress: bill["congress"],
            bill_type: bill["bill_type"],
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
          )
        end
      end

      render json: bills
    else
      response={error:"We could not find any recent bills on this subject. Please try again"}
    end
  end


  def index
    @bills = Bill.all
    render json: @bills
  end

    # private
    #   def bill_params
    #     params.require(:bill).permit(:bill_id, :congress, :bill_type, :number, :title, :short_title, :sponsor_id, :gov_track_url, :introduced_date, :active, :last_vote, :house_passage, :senate_passage, :enacted, :vetoed, :cosponsors, :cosponsors_by_party, :committees, :primary_subject, :member_id)
    #   end

end

# Bill.create!(
#   bill_id: bill["bill_id"],
#   congress: bill["congress"],
#   bill_type: bill["bill_type"],
#   number: bill["number"],
#   short_title: bill["short_title"],
#   sponsor_id: bill["sponsor_id"],
#   govtrack_url: bill["govtrack_url"],
#   introduced_date: bill["introduced_date"],
#   active: bill["active"],
#   last_vote: bill["last_vote"],
#   house_passage: bill["house_passage"],
#   senate_passage: bill["senate_passage"],
#   enacted: bill["enacted"],
#   vetoed: bill["vetoed"],
#   committees: bill["committees"],
#   primary_subject: bill["primary_subject"],
# )