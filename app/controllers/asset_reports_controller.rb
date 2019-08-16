class AssetReportsController < ApplicationController

  def get_member_assets
    id = params[:id]
    @member = Member.find_by(crp_id: id)
    url = 'https://www.opensecrets.org/api/?method=memPFDprofile&year=2016&output=json&cid='+id+'&apikey='+ENV['OPEN_SECRETS_API_KEY']
    @resp = Faraday.get(url)
    assets_data = JSON.parse(@resp.body)
    report = assets_data["response"]["member_profile"]["@attributes"]
    assets = assets_data["response"]["member_profile"]["assets"]

    found_report = AssetReport.find_by(crp_id: report["member_id"])
    if !found_report
      @new_report = AssetReport.create!(
        member_id: @member.id,
        crp_id: report["member_id"],
        data_year: report["data_year"].to_i,
        net_low: report["net_low"].to_i,
        net_high: report["net_high"].to_i,
        asset_count: report["asset_count"].to_i,
        asset_low: report["asset_low"].to_i,
        asset_high: report["asset_high"].to_i,
        source: report["source"],
        origin: report["origin"]
      )

      if assets
        assets.each do |asset|
          new_asset = Asset.create!(
          name: asset["name"],
          holdings_low: asset["holdings_low"].to_i,
          holdings_high: asset["holdings_high"].to_i,
          industry: asset["industry"]
          )
          @new_report.assets << new_asset
        end#do
      end#if assets
    end#if !found

    @member.asset_report = @new_report
    binding.pry

    if @member.asset_report
      render json: @member.asset_report
    else
      response={error:"asset_report not found"}
      render response
    end


  end#def
end
