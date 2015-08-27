class MensajeMailer < ActionMailer::Base

  default from: "Autosop LC <info@autostoplc.ec>"
  default to: "Autosop LC <info@autostoplc.ec>"

  def new_message(message)
    @message = message

    mail subject: "Contacto de #{message.nombre_y_apellidos} en la Web"
  end

  def status_changed(status)
    @status = status
    mail(to: @user.email, subject: 'Estado de su Vehículo')
  end

end