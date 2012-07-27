class CommentsController < ApplicationController
  def create
    star = params[:star1]
    @comment = Comment.new(params[:comment])
    @comment.user_id = params[:user_id]
    @comment.commenter_id = current_user.id
    @comment.grade = star.to_i
    
    @comment.save unless @comment.grade == 0 and @comment.comment.blank?
    redirect_to user_path(params[:user_id])
  end
end
