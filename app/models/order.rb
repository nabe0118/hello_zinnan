class Order < ApplicationRecord
  belongs_to :address
  belongs_to :user

  enum payment_method:[:銀行振込,:クレジットカード,:代引き]
  enum status:[:配送準備中, :配送中, :配送済]

end
