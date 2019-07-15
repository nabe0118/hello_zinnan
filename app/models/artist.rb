class Artist < ApplicationRecord
  has_many :musics, dependent: :destroy
  validates :name, uniqueness: true
end
