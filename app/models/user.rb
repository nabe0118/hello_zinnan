class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :cds, through: :cart_items
  # validates :email, :family_name, :first_name, :sei, :mei, :postal_code, :address, :phone_number, presence: true
  validates :sei, :mei, format: { with: /\A[ァ-ヶー－]+\z/ , message: "は全角カタカナで入力してください"}
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/ , message: "が正しく入力されていません"}
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ , message: "が正しく入力されていません"}# 全角ひらがな、全角カタカナ、漢字
  validates :password, format: { with: /\A[a-z0-9]+\z/ , message: "は半角アルファベットの小文字か数値で入力してください"} # 半角アルファベット（小文字・数値）
  validates :email, uniqueness: { case_sensitive: false }
  acts_as_paranoid
  has_many :addresses, dependent: :destroy

end
