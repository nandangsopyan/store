class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :categorizations, dependent: :destroy
  has_many :products, through: :categorizations

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
