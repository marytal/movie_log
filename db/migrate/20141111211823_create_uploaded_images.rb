class CreateUploadedImages < ActiveRecord::Migration
  def change
    create_table :uploaded_images do |t|
      t.binary :image, null: false
      t.string :mime_type, null: false
      t.integer :user_id
      t.integer :movie_id
      t.string :used_for

      t.timestamps
    end
  end
end
