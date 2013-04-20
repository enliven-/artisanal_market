class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :label
      t.string :attr_img

      t.timestamps
    end
  end
end
