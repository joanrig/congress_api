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
         age: "",
         chamber: "senate",
         contact_form: senator["contact_form"],
         crp_id: senator["crp_id"],
         date_of_birth: senator["date_of_birth"],
         district: senator["district"],
         facebook_account: senator["facebook_account"],
         first_name: senator["first_name"],
         gender_search_term: "",
         gender: senator["gender"],
         image_url: "",
         last_name: senator["last_name"],
         missed_votes_pct: senator["missed_votes_pct"],
         next_election: senator["next_election"],
         office: senator["office"],
         party_full_name: "",
         party_logo: "",
         party: senator["party"],
         phone: senator["phone"],
         propublica_id: senator["id"],
         running_for_president: false
         seniority: senator["seniority"],
         short_title: senator["short_title"],
         state_full_name: "",
         state: senator["state"],
         title: senator["title"],
         twitter_account: senator["twitter_account"],
         votes_with_party_pct: senator["votes_with_party_pct"],
         website: senator["url"],
         youtube_account: senator["youtube_account"],
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
        crp_id: rep["crp_id"],
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
 Member.get_full_name
 Member.get_title_and_name
 Member.get_searchable_string
