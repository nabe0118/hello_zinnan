class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :cd
end
