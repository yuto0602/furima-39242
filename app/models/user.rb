class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true, length: { maximum: 6 }
    # 苗字のバリデーション
  validates :user_last_name, presence: true, length: { maximum: 50 }, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    # 名前のバリデーション
  validates :user_first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  
    # カタカナ苗字のバリデーション
  validates :user_last_name_add, presence: true, length: { maximum: 50 }, format: { with: /\A[ァ-ンー]+\z/ }
  
    # カタカナ名前のバリデーション
 validates :user_first_name_add, presence: true, length: { maximum: 50 }, format: { with: /\A[ァ-ンー]+\z/ }

    # 誕生日についてのバリデーション
    validates :birthday, presence: true
end
