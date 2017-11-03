class MealForm < Reform::Form
  properties :name, :course
  validates  :name, :course, presence: true
  #validates_uniqueness_of :name
end
