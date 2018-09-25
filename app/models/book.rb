class Book < ApplicationRecord
  validates :gender, :author, :image, :title, :publisher, :release_date, presence: true
end
