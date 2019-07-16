class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :cd

  #validates :number,numericality: { only_integer: true,greater_than: 0　}
end
