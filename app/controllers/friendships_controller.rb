class FriendshipsController < ApplicationController
	def create
		friend = User.where(email: params[:friend_email]).first
		Friendship.request(current_user,friend)
		redirect_to user_profile_path(current_user)
	end

	def accept
		friend = User.where(id: params[:friend_id])
		Friendship.accept(current_user, friend)
		redirect_to user_profile_path(current_user)
	end

	def reject
		friend = User.where(id: params[:friend_id])
		Friendship.reject(current_user, friend)
		redirect_to user_profile_path(current_user)
	end

	def friendship_params
		params.require(:friendship).permit(:friend_email, :friend_id)
	end
end
