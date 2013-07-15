class RatingsController < ApplicationController
  def create
    @rating = Rating.find_or_create_by_user_id_and_commenter_id(params[:user_id], current_user.id)
    @rating.rating = params[:star1].to_i
    if @rating.rating == 0
      @rating.destroy
    else
      @rating.save
    end
    redirect_to user_path(params[:user_id])
  end
end
