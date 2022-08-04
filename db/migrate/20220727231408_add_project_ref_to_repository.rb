class AddProjectRefToRepository < ActiveRecord::Migration[6.1]
  def change
    add_reference :repositories, :project, :null => false, :foreign_key => true
  end
end
