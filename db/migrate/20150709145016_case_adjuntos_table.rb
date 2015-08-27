class CaseAdjuntosTable < ActiveRecord::Migration
  def up
    create_table :adjuntos do |t|
      t.integer :estado_vehiculos_id
      t.attachment :archivo
      t.timestamps
    end
  end

  def self.down
    drop_attached_file :adjuntos, :archivo
    drop_table :adjuntos
  end
end
