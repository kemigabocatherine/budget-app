class Purchase < ApplicationRecord
  belongs_to :user
  has_many :group_purchase, dependent: :destroy
  has_many :groups, through: :group_purchase

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
