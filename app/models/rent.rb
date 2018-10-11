# frozen_string_literal: true

class Rent < ApplicationRecord
  validates :book, :user, :from, :to, presence: true
  belongs_to :user
  belongs_to :book
end
