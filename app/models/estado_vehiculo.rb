class EstadoVehiculo < ActiveRecord::Base
  belongs_to :vehiculo
  belongs_to :estado
  has_many :adjuntos, :dependent => :destroy
  validates_presence_of :vehiculo, :estado, :notas,  :fecha_y_hora
end