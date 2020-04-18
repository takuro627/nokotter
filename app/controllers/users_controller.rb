class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(10).order("created_at DESC")
  end
end
