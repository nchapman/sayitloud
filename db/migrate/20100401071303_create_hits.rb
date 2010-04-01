class CreateHits < ActiveRecord::Migration
  def self.up
    create_table :hits do |t|
      t.integer :subdomain_id
      t.integer :site_id
      t.string  :uuid
      t.string  :referrer
      t.string  :remote_ip

      t.timestamps
    end
    
    add_index :hits, :subdomain_id
    add_index :hits, :site_id
    add_index :hits, :created_at
    
    remove_column :subdomains, :views_today
    remove_column :subdomains, :views_all_time
  end

  def self.down
    add_column :subdomains, :views_all_time, :integer, :default => 0
    add_column :subdomains, :views_today, :integer, :default => 0
    drop_table :hits
  end
end
