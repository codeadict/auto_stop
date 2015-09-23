include ValidatorsHelper

class Ejecutivo < ActiveRecord::Base
  has_many :vehiculos, dependent: :nullify
  validates_presence_of :nombre
  validates :correo, presence: true, email: true
end