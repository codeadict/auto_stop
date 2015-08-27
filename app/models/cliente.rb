class Cliente < ActiveRecord::Base
  has_many :vehiculos
  validates_presence_of :identificacion, :nombre_y_apellidos, :tipo_identificacion, :celular, :direccion, :tipo

  enum tipo: {
           asegurado: 'Asegurado', responsabilidad_civil: 'Responsabilidad Civil', particular: 'Particular'
       }
end