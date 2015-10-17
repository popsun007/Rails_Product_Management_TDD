class Product < ActiveRecord::Base
  validates :name, :pricing, presence: true
  validates :description, presence: true, length:{minimum:7}
end
