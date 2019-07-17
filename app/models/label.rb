class Label < ApplicationRecord
  has_many :cds, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
end
