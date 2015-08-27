class RenameAdjuntosRelatedStatus < ActiveRecord::Migration
  def self.up
    rename_column :adjuntos, :estado_vehiculos_id, :estado_vehiculo_id
  end
end