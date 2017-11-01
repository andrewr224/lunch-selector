class Meal < ApplicationRecord
  belongs_to :menu
  validates :name,   presence: true
  validates :course, presence: true
  validates :price,  presence: true
end
