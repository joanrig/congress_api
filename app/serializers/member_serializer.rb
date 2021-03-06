class MemberSerializer < ActiveModel::Serializer
  has_many :bills
  has_one :financial_disclosure
  has_many :donors


  attributes :id, :propublica_id, :crp_id, :chamber, :title, :short_title, :first_name, :last_name, :full_name, :title_and_name, :date_of_birth, :age, :gender, :search_term, :party, :party_full_name, :party_logo, :image_url, :twitter_account, :facebook_account, :youtube_account, :website, :contact_form, :seniority, :next_election, :office, :phone, :state, :state_full_name, :district, :missed_votes_pct, :votes_with_party_pct, :running_for_president, :status, :status_note, :phone_clickable
end
