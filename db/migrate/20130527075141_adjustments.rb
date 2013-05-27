class Adjustments < ActiveRecord::Migration
  def change
    add_attachment :projects, :img_file
    add_attachment :attributes, :attr_img
  end
end
