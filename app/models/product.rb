class Product < ActiveRecord::Base
  belongs_to :list
  validates :name, :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
