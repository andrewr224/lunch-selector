class Menu < ApplicationRecord
  has_many :meals
  has_many :orders
end
