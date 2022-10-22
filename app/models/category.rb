class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses
  # mount_uploader :icon, IconUploader
  validates :name, presence: true
end
