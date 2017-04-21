class Productimage < ApplicationRecord
  belongs_to :product
  belongs_to :color
  mount_uploader :image, ProductimageUploader
end
