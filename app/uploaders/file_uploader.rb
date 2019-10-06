class FileUploader < CarrierWave::Uploader::Base

  def hashed_path
    secret = '12345678'
    hash = Digest::MD5.hexdigest("--#{model.class.name}--#{model.id}--#{secret}--")
    hash.slice(0, 16)
  end

  def store_dir
    "system/#{Rails.env}#{ENV['RAILS_TEST_NUMBER']}/files/#{model.id}/#{hashed_path}"
  end

  def cache_dir
    '/tmp/image_cache'
  end

  def basename
    if path
      File.basename(path)
    end
  end

  def size_range
    1..10.megabytes
  end
  
end
