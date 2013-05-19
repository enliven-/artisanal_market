class AddPaletteIdToPRoject < ActiveRecord::Migration
  def change
    
    add_column :projects, :palette_id, :integer
    
    # create_table :palettes_projects do |t|
#       t.integer :project_id
#       t.integer :palette_id
#     end
  end
end
