class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :label
      t.string :attr_img
      t.references :attribute_layer

      t.timestamps
    end
  end
end
