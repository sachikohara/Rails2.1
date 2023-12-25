class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :guests_count, presence: { message: "人数を入力してください" }, numericality: { greater_than_or_equal_to: 1, message: "人数は1以上でなければなりません" }
  validate :check_out_after_check_in
  validates :check_in, presence: { message: "チェックイン日を入力してください" }
  validates :check_out, presence: { message: "チェックアウト日を入力してください" }
  
  def total_days
    (check_out - check_in).to_i
  end

  def check_out_after_check_in
    if check_in && check_out && check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後でなければなりません")
    end
  end

  
  def total_price
    total_days * room.price * guests_count
  end
end

