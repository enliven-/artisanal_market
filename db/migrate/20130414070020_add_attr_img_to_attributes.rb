class AddAttrImgToAttributes < ActiveRecord::Migration
  def change
    add_attachment :attributes, :attr_img
  end
end
