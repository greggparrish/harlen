class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :colors
  has_many :productimages, dependent: :destroy
  accepts_nested_attributes_for :productimages, reject_if: :all_blank, allow_destroy: true
end
