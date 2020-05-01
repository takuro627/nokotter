class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def top
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def correct_user
    if @current_user.id !=  @tweet.user_id
     redirect_to tweets_path
    end
  end

end
