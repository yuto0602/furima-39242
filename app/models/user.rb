class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  # ニックネームの文字数のバリデーション
  validates :nickname, presence: true, length: { maximum: 6 }
  # パスワード英数字混合のバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  # 苗字のバリデーション
  validates :user_last_name, presence: true, length: { maximum: 50 }, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # 名前のバリデーション
  validates :user_first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  # カタカナ苗字のバリデーション
  validates :user_last_name_add, presence: true, length: { maximum: 50 }, format: { with: /\A[ァ-ヶー]+\z/ }
  # カタカナ名前のバリデーション
  validates :user_first_name_add, presence: true, length: { maximum: 50 }, format: { with: /\A[ァ-ヶー]+\z/ }
  # 誕生日についてのバリデーション
  validates :birthday, presence: true
end
