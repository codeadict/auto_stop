class Admin::VehiculosController < AdminController
  def index
    @vehiculos = Vehiculo
    if params[:search].present?
      search_param = "%#{params[:search]}%"
      @vehiculos =
          @vehiculos.where('vehiculos.placa like :search or vehiculos.modelo like :search', search: search_param)
    end
    @vehiculos = @vehiculos.paginate(page: params[:page])
    respond_to do |format|
      format.html {
        @current_nav = 'Vehiculos'
      }
      format.js {}
    end
  end

  def show
    @vehiculo = Vehiculo.find(params[:id])
    @statuses = @vehiculo.estado_vehiculos.reorder('fecha_y_hora desc')
  end

  def new
    if params[:client].present?
      @cliente = Cliente.find(params[:client])
    end
    @vehiculo = Vehiculo.new()
    @vehiculo.fecha_ingreso = Date.current
  end

  def create
    @vehiculos = Vehiculo.paginate(page: params[:page])
    @vehiculo = Vehiculo.create(vehicle_params)
  end

  def edit
    @vehiculo = Vehiculo.find(params[:id])
  end

  def update
    @vehiculos = Vehiculo.paginate(page: params[:page])
    @vehiculo = Vehiculo.find(params[:id])
    @vehiculo.update_attributes(vehicle_params)
    render :create
  end

  def destroy
    @vehiculo = Vehiculo.find(params[:id])
    render js: 'alert("No se puede borrar este Vehículo");' unless @vehiculo.destroy
  end

  private

  def vehicle_params
    params.require(:vehiculo).permit(:cliente_id, :placa, :marca, :modelo, :anio, :color, :responsabilidad_civil, :aseguradora, :poliza, :kilometraje_actual, :descripcion_del_trabajo, :fecha_ingreso, :ejecutivo_id)
  end
end