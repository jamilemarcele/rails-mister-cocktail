class Review < ApplicationRecord
  belongs_to :cocktail

  validates :rating, inclusion: { in: 1..5 }
  validates :name, :content, :rating, presence: true
end
