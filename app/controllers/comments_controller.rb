class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = params[:user_id]
    @comment.commenter_id = current_user.id
    
    @comment.save unless @comment.comment.blank?
    redirect_to user_path(params[:user_id])
  end

  def destroy
    comment = Comment.find params[:id]
    user_id = comment.user_id
    comment.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user_id) }
      format.json { head :no_content }
    end
  end

  def update
    @comment = Comment.find params[:id]
    user_id = @comment.user_id

    respond_to do |format|
      if @comment.update_attributes(params[:user])
        format.html { redirect_to user_path(user_id) }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { head :no_content }
      end
    end
  end
end
