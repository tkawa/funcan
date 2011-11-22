class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :text, null: false, default: ''
      t.belongs_to :funcan
      t.belongs_to :user
      t.string :sid, null: false
      t.string :uid, null: false
      t.integer :quantity, null: false, default: 0
      t.string :type

      t.timestamps
    end
    add_index :votes, [:sid, :user_id, :type]
  end
end
