class MemberSerializer < ActiveModel::Serializer
  attributes :id, :id, :title, :short_title, :first_name, :last_name, :date_of_birth, :gender, :party, :twitter_account, :facebook_account, :youtube_account, :url, :next_election, :office, :phone, :state, :district, :missed_votes_pct, :votes_with_party_pct
end
