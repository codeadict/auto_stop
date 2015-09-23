include ValidatorsHelper

class Cliente < ActiveRecord::Base
  has_many :vehiculos, :dependent => :destroy
  validates_presence_of :identificacion, :nombre_y_apellidos, :tipo_identificacion, :celular, :direccion, :tipo
  validates :correo, presence: true, email: true

  enum tipo: {
           asegurado: 'Asegurado', responsabilidad_civil: 'Responsabilidad Civil', particular: 'Particular'
       }
end