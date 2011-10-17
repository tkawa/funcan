class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text, null: false, default: ''
      t.belongs_to :funcan
      t.belongs_to :user
      t.string :sid, null: false
      t.string :uid, null: false
      t.integer :quantity, null: false, default: 0
      t.string :type

      t.timestamps
    end
    add_index :comments, [:sid, :user_id, :type]
  end
end
