# encoding: UTF-8
class BuscaController < ApplicationController

  def index
    @busca_dropdown = [["Nome", "name"], ["Descrição", "description"], ["Cidade", "city"]]
    selecionados = params[:selecionados]
    puts selecionados
    query = params[:query]

    unless query.blank? or selecionados.blank?
      sql = "select * from events where "
      puts query
      selecionados.each do |s|
        sql << "#{s} like '%#{query}%' or "
      end
      sql = sql.to (sql.size - 4)
      puts sql
      @events = Event.find_by_sql sql
    end

  end
end
