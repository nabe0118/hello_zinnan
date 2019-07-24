class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :cd

  validates :number, presence: true

end
