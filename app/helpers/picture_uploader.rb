class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process tags: ['post_picture']
  cloudinary_transformation :effect => "saturation"

  version :standard do
    process resize_to_fit: [350, 450, :north]
  end

  version :mobile do
    process resize_to_fit: [200, 300, :north]
  end
end
