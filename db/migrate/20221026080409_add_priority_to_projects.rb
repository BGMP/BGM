class AddPriorityToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :priority, :integer, :default => 0
  end
end
