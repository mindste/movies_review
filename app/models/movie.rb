class Movie < ApplicationRecord
  scope  :recent, ->  { order("created_at  DESC") }

  belongs_to  :user
  validates :title, presence: true
  validates :description, presence: true
end
