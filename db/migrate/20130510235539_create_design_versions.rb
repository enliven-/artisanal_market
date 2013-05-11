class CreateDesignVersions < ActiveRecord::Migration
  def change
    create_table :design_versions do |t|
      t.string      :design_html
      t.references  :project

      t.timestamps
    end
  end
end
