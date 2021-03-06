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
    
    @offering = Offering.find_by_id(params[:id])
    @resource = Resource.find @offering.resource_id
    @question = Question.new
    @negociation = Negociation.new
    @questions = @offering.questions
    @event = Event.find @offering.event_id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offering }
    end
  end

  # GET /offerings/new
  # GET /offerings/new.json
  def new
    @offering = Offering.new
    @resources = Resource.find_all_by_user_id current_user.id
    @select = []
    @resources.each do |resource|
      addresses = Address.find_all_by_id resource.address_id
      addresses.each do |address|
        @select << [address.street + ", " + address.number.to_s + " - " + resource.place, resource.id]
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
    @offering.user_id = current_user.id

    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: 'Oferta criada com sucesso.' }
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
        format.html { redirect_to @offering, notice: 'Oferta atualizada com sucesso.' }
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
