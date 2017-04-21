class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :colors
  has_many :productimages
end
