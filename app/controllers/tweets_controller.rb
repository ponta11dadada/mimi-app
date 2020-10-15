class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all.includes(:user)
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @user.tweets.create(tweet_params)
    redirect_to tweets_index_path
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = @tweet.comments
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
    redirect_to tweets_path
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end
end
