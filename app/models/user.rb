class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :cds, through: :cart_items
  validates :email, :family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number, presence: true
  validates :sei, :mei, format: { with: /\A[ァ-ヶー－]+\z/ , message: "全角カタカナのみで入力して下さい" }

end
