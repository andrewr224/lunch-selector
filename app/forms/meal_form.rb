class MealForm < Reform::Form
  include Composition

  model :meal,      on: :meal
  property :name,   on: :meal
  property :course, on: :meal
  property :price,  on: :menu_item

  validates :name,   presence: true, length: { within: (3..25) }
  validates :course, presence: true
  validates :price,  presence: true, numericality: { greater_than: 0 }
end
