class AssetSerializer < ActiveModel::Serializer
  belongs_to :asset_report


  attributes :id, :name, :holdings_low, :holdings_high, :industry, :sector, :subsidiary_of
end
