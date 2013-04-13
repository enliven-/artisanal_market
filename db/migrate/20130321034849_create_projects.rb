class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :customer
      t.references :artisan
      
      t.timestamps
    end
  end
end
