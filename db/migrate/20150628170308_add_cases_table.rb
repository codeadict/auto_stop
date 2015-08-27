class AddCasesTable < ActiveRecord::Migration
  def up
    create_table :vehiculos do |t|
      t.references :cliente, index: true, foreign_key: true
      t.string :placa, null: false, index: true
      t.string :marca, null: false, index: true
      t.string :modelo, null: false, index: true
      t.string :anio, null: false
      t.string :color
      t.string :responsabilidad_civil, null: true
      t.string :aseguradora, null: true
      t.string :poliza
      t.float :kilometraje_actual
      t.text :descripcion_del_trabajo
      t.date :fecha_ingreso

      t.timestamps null: false
    end
  end
end
