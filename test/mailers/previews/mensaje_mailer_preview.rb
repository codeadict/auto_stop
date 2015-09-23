class MensajeMailerPreview < ActionMailer::Preview
  def status_changed_preview
    MensajeMailer.status_changed(EstadoVehiculo.first)
  end
end