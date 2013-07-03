class EventsController < ApplicationController
  load_and_authorize_resource
  
  # GET /events
  # GET /events.json
  def index
    if params[:search].blank?
      @events = Event.all
    else
      search = Event.search do
      	fulltext params[:search] do
      		boost_fields :name => 3.0
      		boost_fields :description => 2.0
      		boost_fields :city => 2.0
      		boost_fields :state => 1.5
      		query_phrase_slop 1
      	end
      end
      @events = search.results
    end
    @events = @events.paginate :per_page => 5, :page => params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @offerings = Offering.paginate :conditions => ["event_id = ?", @event.id], :per_page => 5, :page => params[:page]
    if request.path != event_path(@event)
      redirect_to @event, :event => :moved_permanently
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
