class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :sid, null: false
      t.integer :comments_count, null: false, default: 0
      t.integer :like_count, null: false, default: 0
      t.integer :want_count, null: false, default: 0
      t.integer :great_count, null: false, default: 0
      t.integer :interesting_count, null: false, default: 0

      t.timestamps
    end
    add_index :tweets, :sid
  end
end
