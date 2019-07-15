class CartItem < ApplicationRecord
  # optional: true userが登録できないので一時的にnilを許可
  belongs_to :user, optional: true
  belongs_to :cd

  #validates :number,numericality: { only_integer: true,greater_than: 0　}
end
