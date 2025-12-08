class Spot < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_comments, dependent: :destroy

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
