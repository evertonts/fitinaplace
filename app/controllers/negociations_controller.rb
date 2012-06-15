class NegociationsController < ApplicationController
  before_filter :authenticate_user!
  # GET /negociations
  # GET /negociations.json
  def index
    if params[:offering_id].blank?
      @negociations = Negociation.find_all_by_user_id current_user.id
    else
      @negociations = Negociation.find_all_by_offering_id params[:offering_id]
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @negociations }
    end
  end

  # GET /negociations/1
  # GET /negociations/1.json
  def show
    @negociation = Negociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @negociation }
    end
  end

  # GET /negociations/new
  # GET /negociations/new.json
  def new
    @negociation = Negociation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @negociation }
    end
  end

  # GET /negociations/1/edit
  def edit
    @negociation = Negociation.find(params[:id])
  end

  # POST /negociations
  # POST /negociations.json
  def create
    @negociation = Negociation.find_by_user_id_and_offering_id current_user.id, params[:offering_id]
    if @negociation.blank?
      @negociation = Negociation.new
      @negociation.status = false
      @negociation.offering_id = params[:offering_id]
      @negociation.user_id = current_user.id
      @negociation.save
      offering = Offering.find params[:offering_id]
      InterestMailer.alert_interest(@negociation).deliver
      redirect_to offerings_path + "/" + params[:offering_id].to_s, :flash => {:info => 'Negociation was successfully created.'}
    else
      flash[:error] = "You already have a pending negociation in progress"
      redirect_to offerings_path + "/" + params[:offering_id].to_s
    end

  end

  # PUT /negociations/1
  # PUT /negociations/1.json
  def update
    @negociation = Negociation.find(params[:id])

    respond_to do |format|
      if @negociation.update_attributes(params[:negociation])
        format.html { redirect_to @negociation, notice: 'Negociation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @negociation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /negociations/1
  # DELETE /negociations/1.json
  def destroy
    @negociation = Negociation.find(params[:id])
    @negociation.destroy

    respond_to do |format|
      format.html { redirect_to negociations_url }
      format.json { head :no_content }
    end
  end

  def update_status
    ids = params[:selected]
    if !ids.blank?
      for id in ids
        tmp = Negociation.find id
        tmp.status = true
        tmp.save
        InterestMailer.alert_reserve(tmp).deliver
      end
    end
    redirect_to negociations_path(:offering_id => params[:offering_id])
  end
end
