class Expense < ApplicationRecord
  belongs_to :users
  has_and_belongs_to_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :amount, numericality: true
  validates :user_id, presence: true
  validates :date_of_expense, presence: true
  validates :categories, presence: true
end
