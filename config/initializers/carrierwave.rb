CarrierWave.configure do |config| 
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["S3_ACCESS_KEY"],                       # required
    aws_secret_access_key: ENV["S3_SECRET_KEY"],                        # required
    region:                'eu-west-2',                  # optional, defaults to 'us-east-1'
    host:                  'https://s3.eu-west-2.amazonaws.com',             # optional, defaults to nil
    endpoint:              'https://s3.eu-west-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = ENV["S3_BUCKET"]                                 # required
  config.fog_public     = false                                                 # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  config.cache_dir = "#{Rails.root}/public/uploads/tmp" # optional, defaults to {}
end

if Rails.env.development? || Rails.env.production?
  CarrierWave.configure do |config|
   config.storage :file
  end
end

if Rails.env.production?
 CarrierWave.configure do |config|
  config.storage :fog
 end
end