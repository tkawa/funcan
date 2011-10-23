class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :screen_name, :null => false
      t.string :uid, :null => false
      t.string :image, :null => false
      t.string :provider, :null => false
      t.string :token, :null => false
      t.string :secret, :null => false

      t.timestamps
    end
    add_index :users, [:screen_name]
    add_index :users, [:provider, :uid]
  end
end
