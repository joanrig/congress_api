class Member < ApplicationRecord



  def self.senators
    Member.where(chamber:"senate")
  end

  def self.senate_party_loyalists
    self.senators.order(votes_with_party_pct: :desc)
  end

  def self.senators_with_most_missed_votes
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

  def self.house_party_loyalists
    self.reps.order(votes_with_party_pct: :desc)
  end

  def self.reps_with_most_missed_votes
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
