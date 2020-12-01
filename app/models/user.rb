class User < ApplicationRecord
  has_many :students
  has_many :courses, through: :students
  has_many :reviews, through: :students

end
