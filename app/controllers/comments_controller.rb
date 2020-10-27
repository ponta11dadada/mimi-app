class CommentsController < ApplicationController
before_action :login_check
def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :tweet_id, :user_id)
  end

  def login_check
    unless logged_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_session_path
    end
  end
end

