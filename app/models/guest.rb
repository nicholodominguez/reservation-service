class Guest < ApplicationRecord
  validate :email, presence: true, unique: true
end
