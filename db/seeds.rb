# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


   @resp = Faraday.get 'https://api.propublica.org/congress/v1/116/senate/members.json' do |req|
     req.headers['X-API-Key'] = 'RSrJDAWkzJmRolbAUbHDv4ArZmtuE3NoyLX5OVh1'
   end
   data = JSON.parse(@resp.body)
   senators = data["results"][0]["members"]


   senators.each do |senator|
   Member.create!(
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
     next_election: senator["next_election"],
     office: senator["office"],
     phone: senator["phone"],
     state: senator["state"],
     district: senator["district"],
     missed_votes_pct: senator["missed_votes_pct"],
     votes_with_party_pct: senator["votes_with_party_pct"]
   )
  end
