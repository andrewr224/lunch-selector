class User < ApplicationRecord
  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :menus,  dependent: :destroy
  has_many :orders, dependent: :destroy

  before_save :set_admin

  private

  def set_admin
    self.admin = true if User.count.zero?
  end
end
