class Spot < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  def get_image
    if image.attached?
      image
    else
      'いらすとや_no_image.jpg'
    end
  end
end
