class RelationshipsController < ApplicationController
  before_action :move_to_login

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private 
  def move_to_login
    redirect_to user_session_path unless user_signed_in?
  end
end
