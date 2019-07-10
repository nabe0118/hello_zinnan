class Cd < ApplicationRecord
  attachment :image

  has_many :disks dependent: :destroy
  # has_many :order_details dependent: :destroy
  # has_many :cart_items dependent: :destroy
  belongs_to :label
  belongs_to :genre

  enum status:[:販売中, :販売停止中]

end
