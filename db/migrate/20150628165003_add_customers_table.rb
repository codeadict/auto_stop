class AddCustomersTable < ActiveRecord::Migration
  def up
    create_table :clientes do |t|
      t.string :tipo_identificacion, null: false, default: 0, index: true
      t.string :identificacion, null: false, index: true
      t.string :empresa
      t.string :nombre_y_apellidos, null: false
      t.string :telefono
      t.string :celular
      t.string :correo
      t.string :direccion

      t.timestamps null: false
    end
  end
end
