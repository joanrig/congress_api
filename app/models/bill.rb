class Bill < ApplicationRecord
  belongs_to :member


  def self.get_bills_by_member
    term = params[:term]
    if term
      resp = Faraday.get `https://api.propublica.org/congress/v1/members/#{term}/bills/introduced.json` do |req|
        req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
      end
      bills_data = JSON.parse(@resp.body)
      resonse = bills_data["results"][0]["bills"][0]
      render json: response
    else
      response={error:"We could not find any bills sponsored by that member. Please try again."}
    end
  end

#doesn't make sense to have index since we will only view bills as search results?



end
