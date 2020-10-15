class CommentsController < ApplicationController
  def create
      @comment = Comment.new(comment_params)
      @comment.user = current_user.id
      byebug
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
  end

  private
  def comment_params
    params.permit(:content)
  end
end
