class Group < ApplicationRecord
  belongs_to :user
  has_many :group_purchase, dependent: :destroy
  has_many :purchases, through: :group_purchase, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
