class Member < ApplicationRecord


  def self.assign_party_logos
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

      twitter_path = "https://twitter.com/"
      twitter_account = member.twitter_account
      twitter_page = twitter_path + twitter_account.to_s
      member.update(twitter_account: twitter_page)

      youtube_path = "https://youtube.com/user/"
      youtube_account = member.youtube_account
      youtube_page = youtube_path + youtube_account.to_s
      member.update(youtube_account: youtube_page)
    end
  end

  def self.get_age
    Member.all.each do |member|
      now = Time.now.utc.to_date
      dob = member.date_of_birth.to_date

      age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)

      member.update(age: age)
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
    self.senators.order(age: :asc)
  end

  def self.senate_loyalists
    self.senators.order(votes_with_party_pct: :desc)
  end

  def self.senate_mavericks
    self.senators.order(votes_with_party_pct: asc)
  end

  def self.truant_senators
    self.senators.order(missed_votes_pct: :desc)
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

  def self.reps_by_seniority
    self.reps.order(seniority: :desc)
  end

  def self.reps_by_age
    self.reps.order(age: :asc)
  end

  def self.house_party_loyalists
    self.reps.order(votes_with_party_pct: :desc)
  end

  def self.house_mavericks
    self.reps.order(votes_with_party_pct: :asc)
  end

  def self.truant_reps
    self.reps.order(missed_votes_pct: :desc)
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




end
