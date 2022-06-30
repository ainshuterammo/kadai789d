class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :score, presence: true
end