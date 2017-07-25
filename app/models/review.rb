class Review < ApplicationRecord
  belongs_to  :user
  belongs_to  :movie
  scope  :recent,  ->  { order("created_at  DESC") }
  validates  :content, presence: true
  validates  :rating, presence: true
end
