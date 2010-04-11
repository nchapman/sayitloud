class CreateHits < ActiveRecord::Migration
  def self.up
    create_table :hits do |t|
      t.integer :site_id
      t.string  :uuid
      t.string  :referrer
      t.string  :remote_ip

      t.timestamps
    end
    
    add_index :hits, :site_id
    add_index :hits, :created_at
  end

  def self.down
    drop_table :hits
  end
end
