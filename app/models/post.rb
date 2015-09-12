class Post < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  belongs_to :store
  accepts_nested_attributes_for :store, reject_if: proc { |attributes| attributes['name'].blank? }
  
  validates :user_id, presence: true
  # validates :store_id, presence: true
  validates :content, presence: true, length: { maximum: 280 }
  has_many :favorites
  has_many :favorite_users, class_name: "User", through: :favorites, source: :user 
  has_many :comments

  mount_uploader :image, ImageUploader
  
  def self.location_items(lat,lng)
    metrePerLat = 111263.283 # 緯度1度辺りの距離m
    metrePerLng = 25.3219892 * 60 * 60 # 経度1度辺りの距離m(東京) # TODO 経度により調整
    latMargin = 1000 / metrePerLat
    lngMargin = 1000 / metrePerLng
    maxlat = lat.to_f + latMargin
    minlat = lat.to_f - latMargin
    maxlng = lng.to_f + lngMargin 
    minlng = lng.to_f - lngMargin
    Post.where(latitude: minlat..maxlat, longitude: minlng..maxlng)
  end
end
