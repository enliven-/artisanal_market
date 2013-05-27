class CreateDesignVersions < ActiveRecord::Migration
  def change
    create_table :design_versions do |t|
      t.text      :design_html
      
      t.integer  :project_id

      t.timestamps
    end
    
    add_column :projects, :design_versions_count, :integer, :default => 0

  end
end
