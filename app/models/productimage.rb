class Productimage < ApplicationRecord
  belongs_to :product
  belongs_to :color
  mount_uploader :front, ProductimageUploader
  mount_uploader :side1, ProductimageUploader
  mount_uploader :side2, ProductimageUploader
  mount_uploader :top, ProductimageUploader
  mount_uploader :bottom, ProductimageUploader
  mount_uploader :with_model, ProductimageUploader
end
