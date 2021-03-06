class TweetsController < ApplicationController
  before_action :login_check, except:[:index]
  def index
    @tweets = Tweet.all
  end

  def new
    @new_tweet = Tweet.new
  end

  def create
    @new_tweet = Tweet.new(tweet_params)
    @new_tweet.user_id = current_user.id
    @new_tweet.save!
    redirect_to tweets_path
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = Comment.where(tweet_id: @tweet.id)
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
    redirect_to user_path(current_user)
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end

  def login_check
  unless logged_in?
    flash[:alert] = "ログインしてください"
    redirect_to new_session_path
  end
  end
end
