class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end
  
  def create
    @user = current_user
    @question = Question.new(params[:question])
    puts "\n\n\n\n\n #{params[:offering_id]}   #{offerings_path} \n\n\n\n\n\n"
    @question.offering_id = params[:offering_id]
    @question.user_id = current_user.id
    @question.save
    redirect_to offerings_path + "/" + params[:offering_id]
  end
end