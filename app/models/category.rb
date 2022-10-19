class Category < ApplicationRecord
   include ImageHelper
  belongs_to :users
  has_one_attached :image, dependent: :destroy
  has_and_belongs_to_many :expenses, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validate :image_type
  validate :image_size
  validates_length_of :name, maximum: 200
end
