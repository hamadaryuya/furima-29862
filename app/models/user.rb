class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :nickname
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
    validates :family_name, format: { with: NAME_REGEX }
    validates :given_name, format: { with: NAME_REGEX }
    validates :family_name_kana, format: { with: KANA_REGEX }
    validates :given_name_kana, format: { with: KANA_REGEX }
    validates :birth
  end
end
