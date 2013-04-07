class AddProductBaseImageToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :base_image
  end
end
