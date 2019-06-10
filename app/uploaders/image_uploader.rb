class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def hashed_path
    secret = '12345678'
    hash = Digest::MD5.hexdigest("--#{model.class.name}--#{model.id}--#{secret}--")
    hash.slice(0, 16)
  end

  def store_dir
    "system/#{Rails.env}#{ENV['RAILS_TEST_NUMBER']}/images/#{model.id}/#{hashed_path}"
  end

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def cache_dir
    '/tmp/image_cache'
  end

  def content_type_whitelist
    /image\//
  end

  def basename
    if path
      File.basename(path)
    end
  end
end
