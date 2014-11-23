class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster
      t.integer :length
      t.integer :year
      t.text :description
      t.date :date_watched
      t.string :watched_with
      t.integer :your_rating
      t.integer :average_rating
      t.string :notes
      t.integer :times_watched
      t.integer :user_id

      t.timestamps
    end
  end
end
