class FinancialDisclosuresController < ApplicationController



  def get_member_finances
    id = params[:id]
    @member = Member.find_by(crp_id: id)
    @resp = Faraday.get 'https://www.opensecrets.org/api/?method=candContrib&output=json&cid=N00009888&apikey='+ENV['OPEN_SECRETS_API_KEY']
    binding.pry


    financial_data = JSON.parse(@resp.body)
    financial_disclosure = financial_data["response"]["contributors"]["@attributes"]
    fd = financial_disclosure

    new_financial_disclosure = FinancialDisclosure.create!(
      cand_name: fd["cand_name"],
      cid: fd["cid"],
      cycle: fd["cycle"],
      origin: fd["origin"],
      source: fd["source"],
      notice: fd["notice"],
      donors: [],
      member_id: @member.id
    )

    donors = financial_data["response"]["contributors"]["contributor"]
    donors.each do |donor|
      new_donor = Donor.create!(
      org_name: donor["@attributes"]["org_name"],
      total: donor["@attributes"]["total"],
      pacs: donor["@attributes"]["pacs"],
      indivs: donor["@attributes"]["indivs"],
      )
      new_financial_disclosure.donors << new_donor
    end

    if @member.financial_disclosure
      render json: @member.disclosure
    else
      response={error:"financial disclosure not found"}
      render response
    end
  end
end
