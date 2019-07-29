class Order < ApplicationRecord
  acts_as_paranoid without_default_scope: true
  belongs_to :address, -> { with_deleted }, optional: true
  belongs_to :user, -> { with_deleted }
  has_many :order_details, dependent: :destroy

  enum payment_method:[:銀行振込,:クレジットカード,:代引き]
  enum status:[:配送準備中, :配送中, :配送済]


end
