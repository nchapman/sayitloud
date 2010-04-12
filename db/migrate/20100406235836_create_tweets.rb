class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :site_id
      t.string :twitter_id
      t.string :user
      t.string :profile_image_url
      t.string :body
      t.datetime :originally_created_at

      t.timestamps
    end
    
    add_index :tweets, :site_id
    add_index :tweets, :twitter_id
  end

  def self.down
    drop_table :tweets
  end
end
