class ProductimageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/"
  end
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
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

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
