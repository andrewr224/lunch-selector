class Order < ApplicationRecord
  belongs_to :menu
  has_many   :order_items, dependent: :destroy
  has_many   :meals,       through:   :order_items

  accepts_nested_attributes_for :order_items
end
