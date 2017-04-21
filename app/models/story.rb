class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :tags
  mount_uploader :image, StoryimageUploader
end
