class AddCrudForExecutiveEmails < ActiveRecord::Migration
  def up
    create_table :ejecutivos do |t|
      t.string :nombre, null: false
      t.string :correo, null: false, index: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :ejecutivos
  end
end
