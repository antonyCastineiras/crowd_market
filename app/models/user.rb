class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :images
  acts_as_voter

  has_many :friendships

  has_many :friends, -> { where "status = 'accepted'" }, :through => :friendships
  has_many :pending_friends, -> { where "status = 'pending'" }	, :through => :friendships, :source => :friend
  has_many :friend_requests, -> { where "status = 'requested'" }	, :through => :friendships, :source => :friend

  has_many :adverts

  def has_image?
  	!self.images.empty?
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
