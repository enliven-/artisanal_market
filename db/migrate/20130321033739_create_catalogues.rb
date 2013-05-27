class CreateCatalogues < ActiveRecord::Migration
  def change
    create_table :catalogues do |t|
      t.string :label
      t.text   :description

      t.integer :user_id

      t.timestamps
    end
  end
end
