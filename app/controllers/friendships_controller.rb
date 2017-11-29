class FriendshipsController < ApplicationController
  def destroy
    @follower = User.find(params[:id])
    @friendship = current_user.friendships.where(follower_id: params[:id]).first
    @friendship.destroy
    redirect_to user_path(@follower.id)
  end
end
