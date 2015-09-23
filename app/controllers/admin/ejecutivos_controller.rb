class Admin::EjecutivosController < AdminController

  def index
    @ejecutivos = Ejecutivo.all

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def new
    @ejecutivo = Ejecutivo.new
  end

  def create
    @ejecutivos = Ejecutivo.all
    @ejecutivo = Ejecutivo.create(ejecutivos_params)
  end

  def edit
    @ejecutivo = Ejecutivo.find(params[:id])
  end

  def update
    @ejecutivos = Ejecutivo.all
    @ejecutivo = Ejecutivo.find(params[:id])
    @ejecutivo.update_attributes(ejecutivos_params)
    render :create
  end

  def destroy
    @ejecutivo = Ejecutivo.find(params[:id])
    render js: 'Error al borrar este ejecutivo' unless @ejecutivo.destroy
  end

  private

  def ejecutivos_params
    params.require(:ejecutivo).permit(:nombre, :correo)
  end
end