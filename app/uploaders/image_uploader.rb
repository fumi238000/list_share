# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # ファイル形式を制限
  def extension_whitelist
    %w[jpg jpeg png]
  end

  # 画像ファイルサイズの制限（5MB）
  def size_range
    0..5.megabytes
  end

  # 画像サイズ
  process resize_to_fill: [250, 250, "Center"]

  version :thumb25 do
    process resize_to_fit: [25, 25]
  end

  version :thumb100 do
    process resize_to_fit: [100, 100]
  end

  version :thumb200 do
    process resize_to_fit: [200, 200]
  end

  # デフォルト画像
  def default_url(*_args)
    "/images/fallback/#{[version_name, 'default.jpeg'].compact.join('_')}"
  end

  # def filename
  #   "#{secure_token}.#{file.extension}" if original_filename.present?
  # end

  # jpgに変換
  process convert: 'jpeg'

  # ファイル名の拡張子を jpg に変更
  # def filename
  #   "#{super.chomp(File.extname(super))}.jpg" if original_filename.present?
  # end

  # protected

  # def secure_token
  #   var = :"@#{mounted_as}_secure_token"
  #   model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  # end
end
