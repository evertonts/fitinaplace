class BuscaController < ApplicationController

  def index
    @busca_dropdown = [["Evento", "event"], ["Cidade", "city"]]
    unless params[:query].blank? or params[:table].blank?
      if params[:table] == 'event'
        @events = Event.find_by_sql("select * from events where description like '%#{params[:query]}%' or name like '%#{params[:query]}%' or address like '%#{params[:query]}%' or city like '%#{params[:query]}%' or state like '%#{params[:query]}%'")
      end
    end
  end
end
