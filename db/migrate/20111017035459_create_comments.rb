class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.belongs_to :tweet
      t.belongs_to :user
      t.string :uid, null: false
      t.integer :quantity, null: false, default: 1
      t.string :type

      t.timestamps
    end
    add_index :comments, :tweet_id
    add_index :comments, :user_id
    add_index :comments, :uid
  end
end
