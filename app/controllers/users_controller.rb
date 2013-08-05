#encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @offerings = Offering.find_all_by_user_id @user.id
    @negociations = Negociation.find_all_by_user_id current_user.id
    @comment = Comment.new
    @comments = Comment.paginate :conditions => ["user_id = ?", @user.id], :order => "id desc", :per_page => 10, :page => params[:page]
    @avg = 0
    @avg = @user.ratings.average(:rating).round unless @user.ratings.blank?
    @rating = Rating.new
    @total_ratings = @user.ratings.count
    @total_comments = @user.comments.count
    @ratings = ["Não avaliado", "Péssimo", "Ruim", "Regular", "Bom", "Ótimo"]
  end
end
