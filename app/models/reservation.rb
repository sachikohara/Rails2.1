class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :guests_count, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validate :check_out_after_check_in

  def total_days
    (check_out - check_in).to_i
  end

  def total_price
    total_days * room.price * guests_count
  end
end
