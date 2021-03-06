class Product < ActiveRecord::Base
  validates :name, :pricing, presence: true
  validates :description, presence: true, length:{minimum:7}
  belongs_to :category
  has_many :comments, dependent: :destroy
end
