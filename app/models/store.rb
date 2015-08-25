class Store < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true, length: { maximum: 280 }
end
