class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :cd

  validates :number,numericality: { only_integer: true,greater_than: 0 }
  validates :number, presence: true
  validate :check_number

  def check_number
    if number > cd.stock
      errors.add(:number, " が在庫数を超えています")
    end
  end

end
