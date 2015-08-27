class AddCmsPages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :layout
      t.text :content
      t.timestamps
    end
  end
end

