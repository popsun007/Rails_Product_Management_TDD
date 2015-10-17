class Product < ActiveRecord::Base
  validates :name, :price, presence: true
  validates :description, presence: true, length:{minimum:7}
end
