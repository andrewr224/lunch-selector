class Meal < ApplicationRecord
  has_many :menu_items,  dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :menus,       through:   :menu_items
  has_many :orders,      through:   :order_items
end
