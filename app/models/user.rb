class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, on: :update, allow_blank: true #ユーザー編集画面でパスワードの変更を無視するためのバリデーション
  validates :password_confirmation, presence: true, on: :update, allow_blank: true
  attachment :profile_image
  has_many :bikes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(bike)
    self.favorites.exists?(bike_id: bike.id)
  end

end
