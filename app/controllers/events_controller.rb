class EventsController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /events
  # GET /events.json
  def index
    if params[:search].blank?
      @events = Event.all
    else
      @events = Event.find_by_sql("select * from events where description like '%#{params[:search]}%' or name like '%#{params[:search]}%' or address like '%#{params[:search]}%' or city like '%#{params[:search]}%' or state like '%#{params[:search]}%'")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @address = Address.find @event.address_id unless @event.address_id.nil?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.user = current_user
    @address = Address.new
    @address.city = params[:city]
    @address.street = params[:street]
    @address.number = params[:number]
    @address.complement = params[:complement] unless params[:complement].blank?
    @address.neightborhood = params[:neightborhood]
    @address.state = params[:state]
    @address.save
    @event.address_id = @address.id
    respond_to do |format|
      if @event.save
        
        format.html { redirect_to @event, notice: 'O Evento foi criado com sucesso.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    unless @event.address_id.nil?
      @address = Address.find @event.address_id
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
    
    @event.address_id = @address.id
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'O Evento foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
