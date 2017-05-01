class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_and_belongs_to_many :tags
  mount_uploader :image, StoryimageUploader

  def next
    Story.unscoped.where("created_at >= ? AND id != ?", created_at, id).order("created_at DESC").first
  end

  def previous
    Story.unscoped.where("created_at <= ? AND id != ?", created_at, id).order("created_at DESC").first
  end

  def self.search(search)
    where("title ILIKE ? OR body ILIKE ? OR tagline ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end

end
