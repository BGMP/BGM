class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :title                           # Repository name
      t.string :description                     # Small description for the repo
      t.boolean :visible                        # Visible in /revisions
      t.string :provider                        # GitHub, GitLab, etc...
      t.string :host                            # Hostname of the application
      t.string :namespace                       # Namespace/Organization
      t.string :repo                            # Repo name
      t.boolean :open                           # Public repo?
      t.string :path                            # Local path
      t.string :branch                          # Target branch to fetch activity from
      t.string :deployed                        # File containing deployed SHA
      t.boolean :auto_deploy                    # Automatically pulled?

      t.timestamps
    end

    add_index :repositories, :title, :unique => true
  end
end
