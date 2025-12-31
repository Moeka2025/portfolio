class Spot < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :spot_tags, dependent: :destroy
  has_many :tags, through: :spot_tags

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def get_image
    if image.attached?
      image
    else
      'いらすとや_no_image.jpg'
    end
  end

  def save_tags(save_spot_tags)
    # 登録されているタグを取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?

    # 古いタグを取得（登録されているタグ - フォームから新規に送られてきたタグ）
    old_tags = current_tags - save_spot_tags

    # 新しいタグの取得（フォームから新規に送られてきたタグ - 登録されているタグ
    new_tags = save_spot_tags - current_tags

    # 古いタグを削除
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    # 新しいタグがテーブルに存在しなければ新規登録（重複チェック付き）
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name: new_name)
      self.tags << tag unless self.tags.include?(tag)
    end
  end
end