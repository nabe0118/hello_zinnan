class Order < ApplicationRecord
  belongs_to :address, optional: true
  belongs_to :user
  has_many :order_details, dependent: :destroy

  enum payment_method:[:銀行振込,:クレジットカード,:代引き]
  enum status:[:配送準備中, :配送中, :配送済]


end
