class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user, optional: true
  has_one_attached :room_image

  validates :room_name, :introduction, :address, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.search(keyword)
    return all if keyword.blank?

    where('room_name LIKE ? OR introduction LIKE ? OR address LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
  end
end
