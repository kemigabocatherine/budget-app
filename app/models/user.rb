class User < ApplicationRecord
  # def index
  #   @users = current_user
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchases, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6, maximum: 50 }
end
