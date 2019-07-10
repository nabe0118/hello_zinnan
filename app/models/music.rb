class Music < ApplicationRecord
  belongs_to :disk
  belongs_to :artist
end
