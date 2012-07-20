class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = params[:user_id]
    @comment.commenter_id = current_user.id
    @comment.save
    redirect_to user_path(params[:user_id])
  end
end
