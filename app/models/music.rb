class Music < ApplicationRecord
  belongs_to :disk
  belongs_to :artist

  validates :number,numericality: { only_integer: true,greater_than: 0 }
  validates :number, presence: true
  validates :name, presence: true
  validates :artist, presence: :true

end
