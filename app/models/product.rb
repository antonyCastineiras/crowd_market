class Product < ApplicationRecord
	belongs_to :seller

	has_attached_file :image, styles: { large: '500x500>', medium: '300x300>', thumb: '100x100>' },
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_many :adverts

	def has_image?
		image_file_name != nil
	end
end
