class AddClientType < ActiveRecord::Migration
  def change
    add_column :clientes, :tipo, :string
  end
end
