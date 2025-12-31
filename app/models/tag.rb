class Tag < ApplicationRecord
  validates :name, presence:true, length:{maximum:20}
  has_many :spot_tags, dependent: :destroy
  has_many :spots, through: :spot_tags
end