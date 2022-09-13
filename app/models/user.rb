class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー]+\z/}
  validates :birthday, presence: true
  validates :password, format: {with: /\A(?=.*?[A-Za-z])(?=.*?[\d])[A-Za-z\d]+\z/ }

  has_many :items
  
end
