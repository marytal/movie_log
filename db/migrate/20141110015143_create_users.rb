class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :profile_picture, default: "http://cdn.cutestpaw.com/wp-content/uploads/2012/01/silly-turtle-l.jpg"
      t.string :sex
      t.string :share_status, default: "public"

      t.timestamps
    end

    add_index :users, :name, unique: true
  end
end
