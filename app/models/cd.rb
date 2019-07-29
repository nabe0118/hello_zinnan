class Cd < ApplicationRecord
  acts_as_paranoid
  attachment :image
  has_many :disks, dependent: :destroy, inverse_of: :cd
  has_many :musics, through: :disks
  has_many :cart_items
  has_many :users, through: :cart_items
  has_many :order_details
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true
  # has_many :order_details dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :label
  belongs_to :genre

  enum status:[:販売中, :入荷待ち]

  validates :name, presence: true
  validates :stock, numericality: { only_integer: true,greater_than: -1, message: "は正しい値を入力してください"}
  validates :price, numericality: { only_integer: true,greater_than: 0, message: "は正しい値を入力してください"}
  validates_associated :disks


end
