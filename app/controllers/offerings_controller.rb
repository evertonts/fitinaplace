class OfferingsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /offerings
  # GET /offerings.json
  def index
    if params[:event_id].blank?
      @offerings = Offering.all
    else
      @offerings = Offering.find_all_by_event_id params[:event_id]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offerings }
    end
  end

  # GET /offerings/1
  # GET /offerings/1.json
  def show
    @offering = Offering.find(params[:id])
    @question = Question.new
    @questions = @offering.questions
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offering }
    end
  end

  # GET /offerings/new
  # GET /offerings/new.json
  def new
    @offering = Offering.new
    @houses = House.find_all_by_user_id current_user.id
    @select = []
    @houses.each do |h|
      resources = Resource.find_all_by_house_id h.id
      resources.each do |resource|
        @select << [h.street + ", " + h.number.to_s + " - " + resource.place, resource.id]
      end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offering }
    end
  end

  # GET /offerings/1/edit
  def edit
    @offering = Offering.find(params[:id])
    @houses = House.find_all_by_user_id current_user.id
    @select = []
    @houses.each do |h|
      resources = Resource.find_all_by_house_id h.id
      resources.each do |resource|
        @select << [h.street + ", " + h.number.to_s + " - " + resource.place, resource.id]
      end
    end
  end

  # POST /offerings
  # POST /offerings.json
  def create
    @offering = Offering.new(params[:offering])
    @offering.event_id = params[:event_id]

    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: 'Offering was successfully created.' }
        format.json { render json: @offering, status: :created, location: @offering }
      else
        format.html { render action: "new" }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offerings/1
  # PUT /offerings/1.json
  def update
    @offering = Offering.find(params[:id])

    respond_to do |format|
      if @offering.update_attributes(params[:offering])
        format.html { redirect_to @offering, notice: 'Offering was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1
  # DELETE /offerings/1.json
  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy

    respond_to do |format|
      format.html { redirect_to offerings_url }
      format.json { head :no_content }
    end
  end
end
