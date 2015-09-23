class Vehiculo < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :ejecutivo
  has_many :estado_vehiculos, :dependent => :destroy
  validates_presence_of :placa, :cliente, :marca, :modelo, :anio, :descripcion_del_trabajo, :color, :fecha_ingreso

  enum mail: {
           Guido_Merino: 'merinogu@asegsur.com.ec',
           Juan_Carlos_Pazmino: 'pazminoj@asegsur.com.ec',
           Jose_Paredes: 'paredesj@asegsur.com.ec',
           Jaime_Cevallos: 'cevallosj@asegsur.com.ec',
           Diego_Checa: 'checadie@asegsur.com.ec'
       }
end