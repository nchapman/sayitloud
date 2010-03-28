class CreateSubdomains < ActiveRecord::Migration
  def self.up
    create_table :subdomains do |t|
      t.integer :site_id
      t.string :name
      t.integer :views_today, :default => 0
      t.integer :views_all_time, :default => 0

      t.timestamps
    end
    
    add_index :subdomains, :site_id
  end

  def self.down
    drop_table :subdomains
  end
end
