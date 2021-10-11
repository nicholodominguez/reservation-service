class Guest < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :reservations

  accepts_nested_attributes_for :reservations
end
