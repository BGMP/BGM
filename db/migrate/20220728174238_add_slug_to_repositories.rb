class AddSlugToRepositories < ActiveRecord::Migration[6.1]
  def change
    add_column :repositories, :slug, :string
    add_index :repositories, :slug, unique: true
  end
end
