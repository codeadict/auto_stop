class AddInsuranceEmailsOnVehicles < ActiveRecord::Migration
  def change
    add_column :vehiculos, :correo_ejecutivo, :string
  end
end
