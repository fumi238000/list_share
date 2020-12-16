class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  def default_url(*args)
     "/images/fallback/" + [version_name, "default.png"].compact.join('_')
   end

   def extension_whitelist
     %w(jpg jpeg gif png)
   end

   def size_range
    0..5.megabytes
   end


   def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end


  
  protected


  
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end


end
