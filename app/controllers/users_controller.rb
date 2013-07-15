#encoding: UTF-8
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @offerings = Offering.find_all_by_user_id @user.id
    @negociations = Negociation.find_all_by_user_id current_user.id
    @comment = Comment.new
    @comments = Comment.paginate :conditions => ["user_id = ?", @user.id], :order => "id desc", :per_page => 10, :page => params[:page]
    @avg = 0.0
    @grade = 0.0
    @total_comments = @user.comments.count
    @comments.each do |c|
      unless c.grade == 0 or c.grade.nil?
        @avg += c.grade
        @grade += 1
      end
    end
    @ratings = ["Não avaliado", "Péssimo", "Ruim", "Regular", "Bom", "Ótimo"]
    @avg = (@avg/@grade).round unless @grade == 0.0
  end
end
