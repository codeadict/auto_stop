class VisitorsController < ApplicationController

  def index

  end

  def servicios
    @page = Page.servicios.first
    @location = "servicios"
  end

  def nosotros
    @page = Page.nosotros.first
    @location = "nosotros"
  end

  def consultar
    if params[:search].present?
      search_param = "#{params[:search]}"
      @cliente = Cliente.where('clientes.identificacion = :search', search: search_param)
    end
    if not @cliente.nil? and @cliente.count > 0
      @vehiculos = @cliente.first.vehiculos
    end

    respond_to do |format|
      format.html {
        @current_nav = 'consultar'
      }
      format.js {}
    end
  end
end
