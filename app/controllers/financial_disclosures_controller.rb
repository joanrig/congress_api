class FinancialDisclosuresController < ApplicationController


  def get_member_finances
    id = params[:id]
    @member = Member.find_by(crp_id: id)
    @resp = Faraday.get 'https://www.opensecrets.org/api/?method=candContrib&output=json&cid='+id+'&apikey='+ENV['OPEN_SECRETS_API_KEY']

    financial_data = JSON.parse(@resp.body)
    financial_disclosure = financial_data["response"]["contributors"]["@attributes"]
    fd = financial_disclosure


    donors_data = financial_data["response"]["contributors"]["contributor"]
    #works through line 14

    found_financial_disclosure = FinancialDisclosure.find_by(cid: fd["cid"])

    if !found_financial_disclosure
      @new_financial_disclosure = FinancialDisclosure.create!(
        cand_name: fd["cand_name"],
        cid: fd["cid"],
        cycle: fd["cycle"],
        origin: fd["origin"],
        source: fd["source"],
        notice: fd["notice"],
        donors: [],
        member_id: @member.id)
    end

    @donors = []
    if donors_data
      donors_data.each do |donor|
        new_donor = Donor.create!(
        org_name: donor["@attributes"]["org_name"],
        total: donor["@attributes"]["total"],
        pacs: donor["@attributes"]["pacs"],
        indivs: donor["@attributes"]["indivs"],
        )
        @donors << new_donor

        @member.financial_disclosure.donors = @donors

      end
    end

    if @member.financial_disclosure
      render json: { financial_disclosure: @member.financial_disclosure, donors: @member.financial_disclosure.donors }
    else
      response={error:"financial disclosure not found"}
      render response
    end

  end#def method_name

end
