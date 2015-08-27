class Admin::EstadosController < AdminController

  def index
    @estados = Estado.all

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def new
    @estado = Estado.new
  end

  def create
    @estados = Estado.all
    @estado = Estado.create(status_params)
  end

  def edit
    @estado = Estado.find(params[:id])
  end

  def update
    @estados = Estado.all
    @estado = Estado.find(params[:id])
    @estado.update_attributes(status_params)
    render :create
  end

  def destroy
    @estado = Estado.find(params[:id])
    render js: 'Error al borrar este estado' unless @estado.destroy
  end

  private

  def status_params
    params.require(:estado).permit(:nombre)
  end
end