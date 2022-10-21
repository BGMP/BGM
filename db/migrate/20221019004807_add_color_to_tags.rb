class AddColorToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :color, :string
  end
end
