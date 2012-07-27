class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @offerings = Offering.find_all_by_user_id @user.id
    @negociations = Negociation.find_all_by_user_id current_user.id
    @comment = Comment.new
    @comments = Comment.find_all_by_user_id @user.id
    @avg = 0.0
    i = 0.0
    @comments.each do |c|
      unless c.grade == 0 or c.grade.nil?
        @avg += c.grade
        i += 1
      end
    end
    @avg = (@avg/i).round unless i == 0.0
  end
end
