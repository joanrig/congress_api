

#senators

   @resp = Faraday.get 'https://api.propublica.org/congress/v1/116/senate/members.json' do |req|
     req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
   end
   senate_data = JSON.parse(@resp.body)
   senators = senate_data["results"][0]["members"]


   senators.each do |senator|
   Member.create!(
     chamber: "senate",
     propublica_id: senator["id"],
     title: senator["title"],
     short_title: senator["short_title"],
     first_name: senator["first_name"],
     last_name: senator["last_name"],
     date_of_birth: senator["date_of_birth"],
     gender: senator["gender"],
     party: senator["party"],
     twitter_account: senator["twitter_account"],
     facebook_account: senator["facebook_account"],
     youtube_account: senator["youtube_account"],
     website: senator["url"],
     seniority: senator["seniority"],
     next_election: senator["next_election"],
     office: senator["office"],
     phone: senator["phone"],
     state: senator["state"],
     district: senator["district"],
     missed_votes_pct: senator["missed_votes_pct"],
     votes_with_party_pct: senator["votes_with_party_pct"]
   )
  end


# house members

  @resp = Faraday.get 'https://api.propublica.org/congress/v1/116/house/members.json' do |req|
    req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
  end
  house_data = JSON.parse(@resp.body)
  representatives = house_data["results"][0]["members"]


  representatives.each do |rep|
  Member.create!(
    chamber: "house",
    propublica_id: rep["id"],
    title: rep["title"],
    short_title: rep["short_title"],
    first_name: rep["first_name"],
    last_name: rep["last_name"],
    date_of_birth: rep["date_of_birth"],
    gender: rep["gender"],
    party: rep["party"],
    twitter_account: rep["twitter_account"],
    facebook_account: rep["facebook_account"],
    youtube_account: rep["youtube_account"],
    website: rep["url"],
    seniority: rep["seniority"],
    next_election: rep["next_election"],
    office: rep["office"],
    phone: rep["phone"],
    state: rep["state"],
    district: rep["district"],
    missed_votes_pct: rep["missed_votes_pct"],
    votes_with_party_pct: rep["votes_with_party_pct"]
  )
 end
