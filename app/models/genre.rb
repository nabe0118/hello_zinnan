class Genre < ApplicationRecord
  has_many :cds, dependent: :destroy
  validates :name, presence: true
end
