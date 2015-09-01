class Post < ActiveRecord::Base
  paginates_per 20
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
end
