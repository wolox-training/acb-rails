class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, presence: true
  include DeviseTokenAuth::Concerns::User
  has_many :rents, dependent: :nullify
  has_many :books, through: :rents
end
