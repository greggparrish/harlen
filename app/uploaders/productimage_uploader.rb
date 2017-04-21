class ProductimageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # Create different versions of your uploaded files:
  version :lg do
    process resize_to_fill: [1000, 1000]
  end
  version :md do
    process resize_to_fill: [500, 500]
  end
  version :thumb do
    process resize_to_fill: [250, 250]
  end
end
