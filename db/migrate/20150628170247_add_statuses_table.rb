class AddStatusesTable < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nombre, null: false, index: true
      t.timestamps null: false
    end
  end
end
