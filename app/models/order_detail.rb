class OrderDetail < ApplicationRecord
  acts_as_paranoid without_default_scope: true
  belongs_to :order, -> { with_deleted }
  belongs_to :cd, -> { with_deleted }
end
