class MenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :meal
end
