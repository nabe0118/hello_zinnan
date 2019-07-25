class Disk < ApplicationRecord
  has_many :musics, dependent: :destroy, inverse_of: :disk
  belongs_to :cd
  accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true

  validates :number, numericality: { only_integer: true,greater_than: 0, message: "は正しい値を入力してください"}
  validates_associated :musics
end
