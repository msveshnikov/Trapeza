class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'jpg'
  process :tags => ['post_picture']

  version :standard do
	eager
	process :resize_to_fit => [300, 400, :north]
  end

end