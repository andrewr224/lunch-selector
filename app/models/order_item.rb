class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :meal

  accepts_nested_attributes_for :meal
end
