class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string  "photo_title"
      t.text    "photo_message"
      t.integer "user_id"

      t.timestamps null: false
    end
  end
end
