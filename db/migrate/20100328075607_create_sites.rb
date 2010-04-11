class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name
      t.string :domain
      t.string :css_url
      t.string :ga_id
      t.text :css

      t.timestamps
    end
    
    add_index :sites, :domain
  end

  def self.down
    drop_table :sites
  end
end
