class Spot < ApplicationRecord
  belongs_to :user_signed_in
  validates :title, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/いらすとや_no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
