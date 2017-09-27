class CreateJoinTableLikes < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :photos, table_name: :likes do |t|
      t.index [:user_id, :photo_id], unique: true # Can see all photos likd by a specific person
      # t.index [:photo_id, :user_id] # Can see all users who like a speciifc photo

      t.timestamp :created_at
    end
  end
end
