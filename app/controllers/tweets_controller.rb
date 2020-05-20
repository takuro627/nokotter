class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :top]
  before_action :correct_user, only: [:edit, :update]

  def index
    if current_user.following.present?
      @tweets = current_user.feed.order("created_at DESC").page(params[:page]).per(10)
    
    else
      redirect_to users_path
      flash[:notice] = "フォローしてみましょう"
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    if Tweet.create(tweet_params)
      
      redirect_to tweets_path, notice: "投稿が完了しました"
    else 
      flash[:notice] = "投稿に失敗しました"
      render action: :new
    end
      
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
  rescue ActiveRecord::RecordNotFound => e
    redirect_to tweets_path
    flash[:notice] = 'この投稿は削除済です'
  end

  def top
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :content).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) 
  rescue ActiveRecord::RecordNotFound => e
    redirect_to tweets_path
    flash[:notice] = 'この投稿は存在しません'
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def correct_user
    tweet = Tweet.find(params[:id])
    if @current_user.id !=  tweet.user.id
     redirect_to tweets_path
    end
  end

end
