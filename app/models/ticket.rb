class Ticket < ApplicationRecord
  validates_presence_of   :name, :price
  belongs_to  :movie
end
