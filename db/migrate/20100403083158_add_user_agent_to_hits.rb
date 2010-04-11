class AddUserAgentToHits < ActiveRecord::Migration
  def self.up
    add_column :hits, :user_agent, :string
    add_column :hits, :url, :string
    add_column :hits, :host, :string
    
    add_index :hits, :host
  end

  def self.down
    remove_column :hits, :host
    remove_column :hits, :url
    remove_column :hits, :user_agent
  end
end
