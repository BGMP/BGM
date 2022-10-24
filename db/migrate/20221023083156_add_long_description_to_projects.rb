class AddLongDescriptionToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :long_desc, :text
  end
end
