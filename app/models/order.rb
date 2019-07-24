class Order < ApplicationRecord
  has_many :users, dependent: :destroy

  enum payment_method:[:銀行振込,:クレジットカード,:代引き]

end
