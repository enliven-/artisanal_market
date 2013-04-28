class AddImgFileToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :img_file
  end
end
