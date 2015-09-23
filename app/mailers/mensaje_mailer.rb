class MensajeMailer < ActionMailer::Base

  default from: "Autosop LC <info@autostoplc.ec>"
  default to: "Autosop LC <autostop@tvcable.net.ec>"
  default reply_to: "Autosop LC <autostop@tvcable.net.ec>"

  def new_message(message)
    @message = message

    mail subject: "Contacto de #{message.nombre_y_apellidos} en la Web"
  end

  def status_changed(status)
    @status = status
    @mail_cliente = status.vehiculo.cliente.correo
    if status.vehiculo.ejecutivo.nil?
      @mail_ejecutivo = nil
    else
      @mail_ejecutivo = status.vehiculo.ejecutivo.correo
    end
    unless @status.adjuntos.count.zero?
      @status.adjuntos.each do |a|
        attachments[a.archivo_file_name] = File.read(a.archivo.path)
      end
    end
    mail(to: @mail_cliente, cc: @mail_ejecutivo, subject: "Actualización estado de vehículo #{@status.vehiculo.placa}")
  end

end