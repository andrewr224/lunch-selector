class MealForm < Reform::Form
  property :name
  property :course
  property :price
  property :menu_id
  validates :name,    presence: true
  validates :course,  presence: true
  validates :price,   presence: true
  validates :menu_id, presence: true
end
