class Address < ApplicationRecord

belongs_to :user
has_many :orders
validates :sei, :mei, format: { with: /\A[ァ-ヶー－]+\z/ , message: "は全角カタカナで入力してください"}
validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/ , message: "が正しく入力されていません"}
validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ , message: "が正しく入力されていません"}
validates :phone_number, format: { with: /\A[0-9]+\z/ , message: "は半角数字のみで入力してください"}
end
