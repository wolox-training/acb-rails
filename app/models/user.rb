# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, :last_name, :locale, presence: true
  has_many :rents, dependent: :nullify
  has_many :books, through: :rents
  has_many :book_sugestions, dependent: :nullify

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.save!
    end
  end
end
