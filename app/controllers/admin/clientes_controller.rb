class Admin::ClientesController < AdminController
  def index
    @entities = Cliente
    if params[:search].present?
      search_param = "%#{params[:search]}%"
      @entities =
          @entities.where('clientes.nombre_y_apellidos like :search or clientes.identificacion like :search', search: search_param)
    end
    @entities = @entities.paginate(page: params[:page])
    respond_to do |format|
      format.html {
        @current_nav = 'Clientes'
      }
      format.js {}
    end
  end

  def show
    @entity = Cliente.find(params[:id])
  end

  def new
    @from_autocomplete = 'true'.eql? params[:from_autocomplete]
    @autocomplete_id = params[:autocomplete_id]
    @entity = Cliente.new()
  end

  def create
    @entities = Cliente.paginate(page: params[:page])
    @from_autocomplete = 'true'.eql? params[:from_autocomplete]
    @autocomplete_id = params[:autocomplete_id]
    @entity = Cliente.create(entity_params)
  end

  def edit
    @entity = Cliente.find(params[:id])
  end

  def update
    @entities = Cliente.paginate(page: params[:page])
    @entity = Cliente.find(params[:id])
    @entity.update_attributes(entity_params)
    render :create
  end

  def destroy
    @entity = Cliente.find(params[:id])
    render js: 'alert("Could not delete entity");' unless @entity.destroy
  end

=begin
  def autocomplete
    entities =
        @company
            .entities
            .joins("left outer join property_entities on entities.id = property_entities.entity_id and property_entities.property_id = #{params[:pid]}")
            .where("entities.company_name LIKE :search or entities.contact_name LIKE :search or entities.contact_last_name LIKE :search", search: "%#{params[:term]}%")
            .select("entities.id, entities.company_name, entities.contact_name, entities.contact_last_name, entities.phone, property_entities.account_number")
            .uniq

    result = entities.collect do |e|
      {id: e.id, value: e.display_name, contact: e.contact_name + ' ' + e.contact_last_name, phone: e.phone, company_name: e.company_name, account: e.account_number}
    end
    render json: result
  end
=end

  private

  def entity_params
    params.require(:cliente).permit(:nombre_y_apellidos, :empresa, :tipo_identificacion, :identificacion, :direccion, :correo, :telefono, :celular, :tipo)
  end
end