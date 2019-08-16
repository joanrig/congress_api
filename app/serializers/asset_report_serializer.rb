class AssetReportSerializer <ActiveModel::Serializer
  belongs_to :member
  has_many :assets


  attributes :id, :crp_id, :data_year, :net_low, :net_high, :asset_count, :asset_low, :asset_high, :source, :origin
end
