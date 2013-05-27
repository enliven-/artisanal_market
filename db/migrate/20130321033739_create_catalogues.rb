class CreateCatalogues < ActiveRecord::Migration
  def change
    create_table :catalogues do |t|
      t.string :label
      t.text   :description
      t.references :user, :product

      t.timestamps
    end
  end
end
