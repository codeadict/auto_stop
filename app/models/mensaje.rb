class Mensaje

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :nombre_y_apellidos, :correo, :asunto, :mensaje

  validates :nombre_y_apellidos,
            presence: true

  validates :correo,
            presence: true
  validates_format_of :correo, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :asunto,
            presence: true

  validates :mensaje,
            presence: true

end