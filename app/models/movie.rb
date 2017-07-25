class Movie < ApplicationRecord
  scope  :recent, ->  { order("created_at  DESC") }

  belongs_to  :user
  has_many  :reviews

  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :image, styles: { medium: "400x600>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
