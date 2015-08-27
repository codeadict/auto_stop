class CaseStatusesTable < ActiveRecord::Migration
  def up
    create_table :estado_vehiculos do |t|
      t.references :vehiculo, index: true, foreign_key: true
      t.references :estado, foreign_key: true
      t.text :notas, null: false
      t.datetime :fecha_y_hora, null: false, default: Date.today
      t.timestamps
    end
  end
end
