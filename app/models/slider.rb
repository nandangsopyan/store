class Slider < ApplicationRecord
  mount_uploader :image, ImageUploader

  def published?
    published == 1
  end

end
