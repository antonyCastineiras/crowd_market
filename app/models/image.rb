class Image < ApplicationRecord
  belongs_to :user
  has_attached_file :file, :styles => {:thumbnail => "50x50", :profile => "200x200"}
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
