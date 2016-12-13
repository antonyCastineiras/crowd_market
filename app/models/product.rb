class Product < ApplicationRecord
	belongs_to :seller
	has_many :adverts
end
