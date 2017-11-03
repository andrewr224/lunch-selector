class MealForm < Reform::Form
  properties :name, :course
  validates  :name, :course, presence: true
end
