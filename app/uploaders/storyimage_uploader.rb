class StoryimageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # Create different versions of your uploaded files:
  version :banner do
    process resize_to_fill: [1100, 440]
  end
  version :thumb do
    process resize_to_fill: [250, 250]
  end
end
