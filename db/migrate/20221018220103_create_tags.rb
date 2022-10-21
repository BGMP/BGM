class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name                            # Tag name
      t.string :description                     # Tag description

      t.timestamps
    end
  end
end
