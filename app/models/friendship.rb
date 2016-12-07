class Friendship < ApplicationRecord

	belongs_to :user
	belongs_to :friend, :class_name => "User"

	def self.request(user,friend)
		unless user == friend or Friendship.exists?(user: user, friend: friend)
			transaction do
				create(:user => user, :friend => friend, :status => 'pending')
				create(:user => friend, :friend => user, :status => 'requested')
			end
		end
	end

	def self.accept(user,friend)
		transaction do
			accepted_at = Time.now
			accept_one_side(user,friend,accepted_at)
			accept_one_side(friend,user,accepted_at)
		end
	end

	def self.accept_one_side(user,friend,accepted_at)
		request = find_by_user_id_and_friend_id(user,friend)
		request.update(:status => 'accepted', :accepted_at => accepted_at)
	end

	def self.reject(user,friend)
		transaction do
			reject_one_side(user,friend)
			reject_one_side(friend,user)
		end
	end

	def self.reject_one_side(user,friend)
		request = find_by_user_id_and_friend_id(user,friend)
		request.update(:status => 'rejected')
	end
end
