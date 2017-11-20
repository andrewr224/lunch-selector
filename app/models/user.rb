class User < ApplicationRecord
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :menus,  dependent: :destroy
  has_many :orders, dependent: :destroy
end
