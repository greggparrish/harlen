class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_and_belongs_to_many :tags
  mount_uploader :image, StoryimageUploader

  def next
    Story.where("created_at > ?", created_at).limit(1).first
  end

  def previous
    Story.where("created_at < ?", created_at).limit(1).first
  end

  def self.search(search)
    where("title ILIKE ? OR body ILIKE ?", "%#{search}%", "%#{search}%") 
  end

end
