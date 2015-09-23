class Admin::EstadoVehiculosController < AdminController
  def index
    if params[:vehiculo].present?
      @vehiculo = Vehiculo.find(params[:vehiculo])
    end
    @estado = @vehiculo.estado_vehiculos.all
    respond_to do |format|
      format.html {
        @current_nav = 'Vehiculos'
      }
      format.js {}
    end
  end

  def show
    @estado = EstadoVehiculo.find(params[:id])
  end

  def new
    if params[:vehiculo].present?
      @vehiculo = Vehiculo.find(params[:vehiculo])
    end
    if params[:estado].present?
      @status = Estado.find(params[:estado])
    end
    @estado = EstadoVehiculo.new()
  end

  def create
    @estados = EstadoVehiculo.paginate(page: params[:page])
    if params[:vehiculo].present?
      @vehiculo = Vehiculo.find(params[:vehiculo])
    end
    if params[:estado].present?
      @status = Estado.find(params[:estado])
    end
    @estado = EstadoVehiculo.new(vehicle_params)
    respond_to do |format|
      if @estado.save

        unless params[:adjuntos].nil?
          params[:adjuntos].each { |adjunto|
            @estado.adjuntos.create(archivo: adjunto)
          }
        end
        MensajeMailer.status_changed(@estado).deliver
        format.html { redirect_to admin_vehiculos_path, notice: 'Estado cambiado correctamente' }
      end
    end
  end

  def edit
    @estado = EstadoVehiculo.find(params[:id])
  end

  def update
    @vehiculos = Vehiculo.paginate(page: params[:page])
    @vehiculo = Vehiculo.find(params[:id])
    @vehiculo.update_attributes(vehicle_params)
    render :create
  end

  def destroy
    @estado = EstadoVehiculoVehiculo.find(params[:id])
    render js: 'alert("No se puede borrar este estado");' unless @estado.destroy
  end

  private

  def vehicle_params
    params.require(:estado_vehiculo).permit(:vehiculo_id, :estado_id, :notas, :fecha_y_hora, :adjuntos)
  end
end