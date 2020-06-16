class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username,  presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  attachment :profile_image
  has_many :bikes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(bike)
    self.favorites.exists?(bike_id: bike.id)
  end

end
