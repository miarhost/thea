class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick


  if Rails.env.development? || Rails.env.test?
  storage :file
elsif Rails.env.production?
  storage :fog
 end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

 
  def default_url
 
 ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

  end


  version :thumb do
  process :resize_to_fit => [50, 50]
  end
  
  version :medium do
  process :resize_to_limit => [400,400]
  end

  version :large do
  process :resize_to_limit => [500,500]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end