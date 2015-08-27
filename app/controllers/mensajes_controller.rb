class MensajesController < ApplicationController

  def new
    @location = "contacto"
    @message = Mensaje.new
  end

  def create
    @message = Mensaje.new(message_params)

    if @message.valid?
      MensajeMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Su mensaje ha sido enviado correctamente."
    else
      flash[:alert] = "Ha ocurrido un error, revise que estén correctos todos los campos."
      render :new
    end
  end

  private

  def message_params
    params.require(:mensaje).permit(:nombre_y_apellidos, :correo, :asunto, :mensaje)
  end

end