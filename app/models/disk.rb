class Disk < ApplicationRecord
  has_many :musics dependent: :destroy
  belongs_to :cd
end
