class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :omniauthable, omniauth_providers: %i[github] # optional
  has_many :students
  has_many :courses, through: :students
  has_many :reviews, through: :students

end
