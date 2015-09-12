class Store < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true, length: { maximum: 280 }
  
  def self.location_items(lat,lng)
    # http://mononofu.hatenablog.com/entry/20090324/1237894846
    metrePerLat = 111263.283 # 緯度1度辺りの距離m
    metrePerLng = 25.3219892 * 60 * 60 # 経度1度辺りの距離m(東京) # TODO 経度により調整
    latMargin = 1000 / metrePerLat
    lngMargin = 1000 / metrePerLng
    maxlat = lat.to_f + latMargin
    minlat = lat.to_f - latMargin
    maxlng = lng.to_f + lngMargin 
    minlng = lng.to_f - lngMargin
    Store.where(latitude: minlat..maxlat, longitude: minlng..maxlng)
  end
end
