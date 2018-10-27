class Product < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images


  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  def published?
    published == 1
  end
end
