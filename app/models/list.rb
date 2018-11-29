class List < ActiveRecord::Base
  validates :title, presence: true
  has_many :products
end
