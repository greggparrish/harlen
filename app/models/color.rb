class Color < ApplicationRecord
  belongs_to :product
  has_many :product_images
  mount_uploader :material, MaterialUploader
end
