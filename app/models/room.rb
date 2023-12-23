class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user, optional: true
  has_one_attached :room_image
  validates :room_name, presence:{ message: '施設の名前を入力して下さい。' }
  validates :introduction, presence:{ message: '施設の詳細を入力して下さい。' }
  validates :address, presence: { message: '所在地を入力して下さい' }
  validates :price, presence:{ message: '価格を入力して下さい' } ,numericality: { greater_than_or_equal_to: 0, message: '価格は１以上で入力して下さい' }

  def self.search(keyword)
    return all if keyword.blank?

    where('room_name LIKE ? OR introduction LIKE ? OR address LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
  end

  def self.search_by_address(key)
    return all if key.blank?

    where('address LIKE ?', "%#{key}%")
  end
end
