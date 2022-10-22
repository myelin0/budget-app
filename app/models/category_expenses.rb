class CategoryExpenses < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :expense , dependent: :destroy
end