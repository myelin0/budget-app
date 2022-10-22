class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
end
