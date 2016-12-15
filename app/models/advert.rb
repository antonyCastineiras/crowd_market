class Advert < ApplicationRecord
	belongs_to :post
	belongs_to :user
	belongs_to :product
end
