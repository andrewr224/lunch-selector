class MealForm < Reform::Form
  properties :name, :course
  validates  :name, :course, presence: true, length: { within: (3..25) }
end
