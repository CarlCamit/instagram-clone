class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :name
      t.text :biography
      t.references :user, foreign_key: true

      t.timestamps

      # No one can have the same username
      t.index  :username, unique: true
    end
  end
end
