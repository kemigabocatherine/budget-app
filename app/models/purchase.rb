class Purchase < ApplicationRecord
  belongs_to :user
  has_many :group_purchase, dependent: :destroy
  has_many :groups, through: :group_purchase

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  after_save :amount_updater

  private

  def amount_updater
    total_transactions = 0
    total_transactions += purchase.amount
  end
end
