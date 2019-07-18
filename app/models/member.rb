class Member < ApplicationRecord

  def self.data
    @data = [self.senators, self.senators_by_seniority]
  end


  def self.senators
    Member.where(chamber:"senate")
  end

  def self.senators_by_seniority
    self.senators.order(seniority: :desc)
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



# def self.get_age
#   now = Time.now.utc.to_date
#   dob = self.date_of_birth
#
#   dob_year = dob[0..3].to_i
#   dob_month = dob[5..6].to_i
#   dob_day = dob[8..9].to_i
#
#   age = now.year - dob_year - ((now.month > dob_month || (now_month == dob.month && now.day >= dob.day)) ? 0 : 1)
#   binding.pry
# end
#
# def self.senators_by_age
#   self.senators.each do |senator|
#     senator.age = senator.get_age
#   end
#
#   self.senators.order(age: :desc)
# end
