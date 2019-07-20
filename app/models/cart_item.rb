class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :cd

  validates :number, numericality: { only_integer: true,greater_than: 0,  message: "は正しい値を入力してください"}
  validate :check_number


  def check_number
    if number.to_i > cd.stock
      errors.messages[:number] << "が在庫数を超えています"
    end
  end

end
