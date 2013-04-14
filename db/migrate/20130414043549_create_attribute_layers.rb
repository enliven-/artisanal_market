class CreateAttributeLayers < ActiveRecord::Migration
  def change
    create_table :attribute_layers do |t|
      t.string :label
      t.references :palette
      t.references :attribute


      t.timestamps
    end
  end
end