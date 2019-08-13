Member.destroy_all
Bill.destroy_all

#senators
   @resp = Faraday.get 'https://api.propublica.org/congress/v1/116/senate/members.json' do |req|
     req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
   end
   senate_data = JSON.parse(@resp.body)
   senators = senate_data["results"][0]["members"]

#empty string values are assigned in model
#update seeds w/o adding duplicates/ dropping db
  senators.each do |senator|
       Member.create!(
         chamber: "senate",
         propublica_id: senator["id"],
         title: senator["title"],
         short_title: senator["short_title"],
         first_name: senator["first_name"],
         last_name: senator["last_name"],
         age: "",
         date_of_birth: senator["date_of_birth"],
         gender: senator["gender"],
         gender_search_term: "",
         party: senator["party"],
         party_full_name: "",
         party_logo: "",
         image_url: "",
         twitter_account: senator["twitter_account"],
         facebook_account: senator["facebook_account"],
         youtube_account: senator["youtube_account"],
         website: senator["url"],
         contact_form: senator["contact_form"],
         seniority: senator["seniority"],
         next_election: senator["next_election"],
         office: senator["office"],
         phone: senator["phone"],
         state: senator["state"],
         state_full_name: "",
         district: senator["district"],
         missed_votes_pct: senator["missed_votes_pct"],
         votes_with_party_pct: senator["votes_with_party_pct"],
         running_for_president: false
       )
    end


# house members
  @resp = Faraday.get 'https://api.propublica.org/congress/v1/116/house/members.json' do |req|
    req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
  end
  house_data = JSON.parse(@resp.body)
  representatives = house_data["results"][0]["members"]

#update seeds w/o adding duplicates/ dropping db
  representatives.each do |rep|
      Member.create!(
        chamber: "house",
        propublica_id: rep["id"],
        title: rep["title"],
        short_title: rep["short_title"],
        first_name: rep["first_name"],
        last_name: rep["last_name"],
        date_of_birth: rep["date_of_birth"],
        age: "",
        gender: rep["gender"],
        gender_search_term: "",
        party: rep["party"],
        party_full_name: "",
        party_logo: "",
        image_url: "",
        twitter_account: rep["twitter_account"],
        facebook_account: rep["facebook_account"],
        youtube_account: rep["youtube_account"],
        website: rep["url"],
        seniority: rep["seniority"],
        next_election: rep["next_election"],
        office: rep["office"],
        phone: rep["phone"],
        state: rep["state"],
        state_full_name: "",
        district: rep["district"],
        missed_votes_pct: rep["missed_votes_pct"],
        votes_with_party_pct: rep["votes_with_party_pct"],
        favorite: "no",
        running_for_president: false
      )
     end


 Member.get_age
 Member.get_party_logo
 Member.get_social_media_links
 Member.get_full_state_name
 Member.get_gender_search_term
 Member.get_full_party_name
 Member.update_running_for_president
 Member.get_retirement_status
 Member.get_clickable_phone_number
