class MemberSerializer < ActiveModel::Serializer
  attributes :id, :chamber, :title, :short_title, :first_name, :last_name, :date_of_birth, :age, :gender, :party, :party_logo, :twitter_account, :facebook_account, :youtube_account, :website, :contact_form, :seniority, :next_election, :office, :phone, :state, :district, :missed_votes_pct, :votes_with_party_pct, :favorite
end
