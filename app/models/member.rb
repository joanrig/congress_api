class Member < ApplicationRecord
  has_many :bills
  accepts_nested_attributes_for :bills
  serialize :bills


  def self.get_age
    Member.all.each do |member|
      now = Time.now.utc.to_date
      dob = member.date_of_birth.to_date

      age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)

      member.update(age: age)
    end
  end

  def self.get_party_logo
    Member.all.each do |member|
      if member.party == "D"
        member.update(party_logo: "https://upload.wikimedia.org/wikipedia/commons/0/02/DemocraticLogo.svg")
      elsif member.party == "R"
        member.update(party_logo: "https://upload.wikimedia.org/wikipedia/commons/9/9b/Republicanlogo.svg")
      elsif ["ID", "I"].include?(member.party)
        member.update(party_logo: "https://www.justthinking.us/sites/default/files/image/Photos/Independence.png")
      end
    end
  end

  def self.get_social_media_links
    Member.all.each do |member|

        fb_path = "https://www.facebook.com/"
        fb_account = member.facebook_account
        fb_page = fb_path + fb_account.to_s
        member.update(facebook_account: fb_page)

      if member.twitter_account
        twitter_path = "https://twitter.com/"
        twitter_account = member.twitter_account
        twitter_page = twitter_path + twitter_account.to_s
        member.update(twitter_account: twitter_page, twitter_handle: twitter_account)
      end

      if member.youtube_account
        youtube_path = "https://youtube.com/user/"
        youtube_account = member.youtube_account
        youtube_page = youtube_path + youtube_account.to_s
        member.update(youtube_account: youtube_page)
      end

    end
  end

  def self.get_full_state_name
    states = [ ["AK", "Alaska"],
                ["AL", "Alabama"],
                ["AR", "Arkansas"],
                ["AS", "American Samoa"],
                ["AZ", "Arizona"],
                ["CA", "California"],
                ["CO", "Colorado"],
                ["CT", "Connecticut"],
                ["DC", "District of Columbia"],
                ["DE", "Delaware"],
                ["FL", "Florida"],
                ["GA", "Georgia"],
                ["GU", "Guam"],
                ["HI", "Hawaii"],
                ["IA", "Iowa"],
                ["ID", "Idaho"],
                ["IL", "Illinois"],
                ["IN", "Indiana"],
                ["KS", "Kansas"],
                ["KY", "Kentucky"],
                ["LA", "Louisiana"],
                ["MA", "Massachusetts"],
                ["MD", "Maryland"],
                ["ME", "Maine"],
                ["MI", "Michigan"],
                ["MN", "Minnesota"],
                ["MO", "Missouri"],
                ["MS", "Mississippi"],
                ["MT", "Montana"],
                ["NC", "North Carolina"],
                ["ND", "North Dakota"],
                ["NE", "Nebraska"],
                ["NH", "New Hampshire"],
                ["NJ", "New Jersey"],
                ["NM", "New Mexico"],
                ["NV", "Nevada"],
                ["NY", "New York"],
                ["OH", "Ohio"],
                ["OK", "Oklahoma"],
                ["OR", "Oregon"],
                ["PA", "Pennsylvania"],
                ["PR", "Puerto Rico"],
                ["RI", "Rhode Island"],
                ["SC", "South Carolina"],
                ["SD", "South Dakota"],
                ["TN", "Tennessee"],
                ["TX", "Texas"],
                ["UT", "Utah"],
                ["VA", "Virginia"],
                ["VI", "Virgin Islands"],
                ["VT", "Vermont"],
                ["WA", "Washington"],
                ["WI", "Wisconsin"],
                ["WV", "West Virginia"],
                ["WY", "Wyoming"] ]
    Member.all.each do |member|
      states.each do |state|
        if member.state == state[0]
          member.update(state_full_name: state[1])
        end
      end
    end
  end

  def self.get_gender_search_term
    Member.all.each do |member|
      if member.gender == "M"
        member.update(gender_search_term: "womenfalse")
      elsif member.gender == "F"
        member.update(gender_search_term: "womentrue")
      end
    end
  end

  def self.get_full_party_name
    Member.all.each do |member|
      if member.party == "D"
        member.update(party_full_name: "Democrat")
      elsif member.party == "R"
        member.update(party_full_name: "Republican")
      #api identifies independent variously as "I" or "IN"
    elsif member.party == "ID"
        member.update(party_full_name: "Independent")
      end
    end
  end

  def self.get_headshot
    headshots = [
      ["Feinstein, Dianne", "https://www.feinstein.senate.gov/public/_cache/files/f/7/f784d398-78e2-402f-90da-7c48a8fa4a89/6978A65F6DC241B15DD9752496365D44.04official-hi-res-photogallery.jpg"],
      ["Booker, Cory", "https://upload.wikimedia.org/wikipedia/commons/5/59/Cory_Booker%2C_official_portrait%2C_114th_Congress.jpg"],
      ["Casey, Bob" "https://en.wikipedia.org/wiki/Bob_Casey_Jr.#/media/File:Bob_Casey_Jr._official_photo.jpg"]
      ]
  end

#this info is manual, not auto updated from API
  def self.update_running_for_president
    candidates = %w[Bennet Biden Booker Gabbard Gillibrand Harris Klobuchar Moulton O'Rourke Ryan Sanders Warren]

    Member.all.each do |member|
      candidates.each do |candidate|
        if candidate == member.last_name
          member.update(running_for_president: true)
        end
      end
    end
  end


  def self.get_retirement_status
    @resp = Faraday.get 'https://api.propublica.org/congress/v1/116/senate/members/leaving.json' do |req|
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
    data = JSON.parse(@resp.body)
    leaving_senators = data["results"][0]["members"]

    @resp = Faraday.get 'https://api.propublica.org/congress/v1/116/house/members/leaving.json' do |req|
      req.headers['X-API-Key'] = ENV['PROPUBLICA_API_KEY']
    end
    data = JSON.parse(@resp.body)
    leaving_reps = data["results"][0]["members"]

    leaving = leaving_senators + leaving_reps

    leaving.each do |leaving_member|
      Member.all.each do |member|
        if leaving_member["id"] ==  member.propublica_id
          member.update(
            status: leaving_member["status"],
            status_note: leaving_member["note"]
          )
        end
      end
    end
  end

  # sorting methods

  def self.senators
    Member.where(chamber:"senate")
  end

  def self.senators_by_seniority
    self.senators.order(seniority: :desc)
  end

  def self.senators_by_age
    self.senators.order(age: :desc)
  end

  def self.senate_loyalists
    self.senators.order(votes_with_party_pct: :desc)
  end

  def self.senate_mavericks
    self.senators.order(votes_with_party_pct: :asc)
  end

  def self.truant_senators
    self.senators.order(missed_votes_pct: :desc)
  end

  def self.voting_senators
    self.senators.order(missed_votes_pct: :asc)
  end


  def self.female_senators
    self.senators.where(gender:"F")
  end

  def self.democratic_senators
    self.senators.where(party:"D")
  end

  def self.female_democratic_senators
    self.democratic_senators.where(gender:"F")
  end

  def self.republican_senators
    self.senators.where(party:"R")
  end

  def self.female_republican_senators
    self.republican_senators.where(gender:"F")
  end




  def self.reps
    Member.where(chamber:"house")
  end

  def self.reps_by_age
    self.reps.order(age: :desc)
  end

  def self.reps_by_seniority
    self.reps.order(seniority: :desc)
  end

  def self.house_loyalists
    self.reps.order(votes_with_party_pct: :desc)
  end

  def self.house_mavericks
    self.reps.order(votes_with_party_pct: :asc)
  end

  def self.truant_reps
    self.reps.order(missed_votes_pct: :desc)
  end

  def self.voting_reps
    self.reps.order(missed_votes_pct: :asc)
  end

  def self.female_reps
    self.reps.where(gender:"f")
  end




  def self.democratic_reps
    self.reps.where(party:"D")
  end

  def self.female_democratic_reps
    self.democratic_reps.where(gender:"F")
  end

  def self.republican_reps
    self.reps.where(party:"R")
  end

  def self.female_republican_reps
    self.republican_reps.where(gender:"F")
  end

  def self.presidential_candidates
    Member.where(running_for_president: true)
  end




end
