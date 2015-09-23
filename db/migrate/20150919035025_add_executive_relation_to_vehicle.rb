class AddExecutiveRelationToVehicle < ActiveRecord::Migration
  def up
    #agregar ejecutivos
    Ejecutivo.create(nombre: 'Guido Meriño', correo: 'merinogu@asegsur.com.ec')
    Ejecutivo.create(nombre: 'Juan Carlos Pazmiño', correo: 'pazminoj@asegsur.com.ec')
    Ejecutivo.create(nombre: 'Jose Paredes', correo: 'paredesj@asegsur.com.ec')
    Ejecutivo.create(nombre: 'Jaime Cevallos', correo: 'cevallosj@asegsur.com.ec')
    Ejecutivo.create(nombre: 'Diego Checa', correo: 'checadie@asegsur.com.ec')
    Ejecutivo.create(nombre: 'Luis Paredes', correo: 'paredesl@asegsur.com.ec')
    Ejecutivo.create(nombre: 'Jennifer Perez', correo: 'jperez@vazseguros.com')
    Ejecutivo.create(nombre: 'Daniela Pozo', correo: 'danielap@vazseguros.com')
    Ejecutivo.create(nombre: 'Carolina Guerra', correo: 'cguerra@vazseguros.com')
    remove_column :vehiculos, :correo_ejecutivo
    add_reference :vehiculos, :ejecutivo, index: true
  end

  def down
    add_column :vehiculos, :correo_ejecutivo, :string
    remove_reference :vehiculos, :ejecutivo, index: true
  end
end
