class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|

      t.text :about_me
      t.string :gender
      t.string :public_email
      t.string :location
      t.string :discord
      t.string :github
      t.string :instagram
      t.string :crowdin
      t.string :steam
      t.string :twitter
      t.string :occupation
      t.string :interests

      t.timestamps
    end
  end
end
