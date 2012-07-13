class HousesController < ApplicationController
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  # GET /houses
  # GET /houses.json
  def index 
    @aux = House.all
    @houses = []
    for house in @aux
      if house.user_id == current_user.id 
        @houses << house 
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    @house = House.find(params[:id])
    @address = Address.find @house.address_id unless @house.address_id.nil?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
    
  end

  # GET /houses/new
  # GET /houses/new.json
  def new
    @house = House.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/1/edit
  def edit
    @house = House.find(params[:id])
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(params[:house])
    @house.user_id = current_user.id
    @address = Address.new
    @address.city = params[:city]
    @address.street = params[:street]
    @address.number = params[:number]
    @address.complement = params[:complement] unless params[:complement].blank?
    @address.neightborhood = params[:neightborhood]
    @address.state = params[:state]
    @address.save
    @house.address_id = @address.id
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'Casa criada com sucesso.' }
        format.json { render json: @house, status: :created, location: @house }
      else
        format.html { render action: "new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /houses/1
  # PUT /houses/1.json
  def update
    @house = House.find(params[:id])
    unless @house.address_id.nil?
      @address = Address.find @house.address_id
    else
      @address = Address.new
    end
    @address.city = params[:city]
    @address.street = params[:street]
    @address.number = params[:number]
    @address.complement = params[:complement] unless params[:complement].blank?
    @address.neightborhood = params[:neightborhood]
    @address.state = params[:state]
    @address.country = params[:country] unless params[:country].blank?
    @address.save
    
    @house.address_id = @address.id
    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to @house, notice: 'Casa foi atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house = House.find(params[:id])
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end
end
