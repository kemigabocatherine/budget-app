class Group < ApplicationRecord
  belongs_to :user
  has_many :group_purchase
  has_many :purchases, through: :group_purchase

  validates :name, presence: true
  validates :icon, presence: true
end
