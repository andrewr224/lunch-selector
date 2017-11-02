class Menu < ApplicationRecord
  has_many :meals,  dependent: :destroy
  has_many :orders, dependent: :destroy
end
