class UsersController < ApplicationController
  before_action :authenticate_user!

  def user_dashboard

  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def my_followers
    @friendships = current_user.followers
  end

  def add_follower
    @follower = User.find(params[:follower])
    current_user.friendships.build(follower_id: @follower.id)
    if current_user.save
    redirect_to user_path(@follower.id), notice: "Friend was successfully added"
    else
    redirect_to user_path(@follower.id), flash[:error] = "There was an error with adding user as friend"
    end
  end


end
