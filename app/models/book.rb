class Book < ApplicationRecord
  validates :gender, :author, :image, :title, :publisher, :release_date, presence: true
  has_many :rents, dependent: :destroy
  has_many :users, through: :rents
end
