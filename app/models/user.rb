class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :expenses,  dependent: :destroy
  
  validates :name, presence: true
  validates_presence_of :password, :email
end
