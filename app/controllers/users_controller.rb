class UsersController < ApplicationController
  
  def index
    @user = User.all.page(params[:page]).per(10)
    @search_users = User.all.page(params[:page]).search(params[:search])
  end
  
  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(10).order("created_at DESC")
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end

  def likes 
    @user = User.find_by(id:params[:id])
    @likes = Like.where(user_id: @user.id)
  end

end

