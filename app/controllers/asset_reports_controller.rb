class AssetsReportsController < ApplicationController

  def get_member_assets
    id = params[:id]
    @member = Member.find_by(crp_id: id)
    @resp = Faraday.get 'https://www.opensecrets.org/api/?method=candContrib&output=json&cid='+id+'&apikey='+ENV['OPEN_SECRETS_API_KEY']

    assets_data = JSON.parse(@resp.body)


  end#def method_name

end
