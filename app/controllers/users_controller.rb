class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @offerings = Offering.find_all_by_user_id @user.id
  end
end
