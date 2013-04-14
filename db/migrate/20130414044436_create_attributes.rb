class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :label
      t.references :attribute_layer

      t.timestamps
    end
  end
end
