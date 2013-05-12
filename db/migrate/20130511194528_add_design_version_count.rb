class AddDesignVersionCount < ActiveRecord::Migration
  def change
    add_column :projects, :design_versions_count, :integer, :default => 0
    
    # Project.reset_column_information
    # Project.find(:all).each do |p|
    #   p.update_attribute :design_versions_count, p.design_versions.length
    # end
  end
end
