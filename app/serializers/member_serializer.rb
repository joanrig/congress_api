class MemberSerializer < ActiveModel::Serializer
  has_many :bills
  has_one :financial_disclosure
  has_many :donors


  # attributes :age, :chamber, :contact_form, :crp_id, :date_of_birth, :district, :facebook_account, :first_name, :full_name, :gender, :id, :image_url, :last_name, :missed_votes_pct, :next_election, :office, :party, :party_full_name, :party_logo, :phone, :phone_clickable, :propublica_id, :running_for_president, :searchable_string, :search_term, :seniority, :short_title, :state, :state_full_name, :status, :status_note, :title, :title_and_name, :twitter_account, :votes_with_party_pct, :website, :youtube_account

  def attributes(*args)
    object.attributes.symbolize_keys
  end

end
