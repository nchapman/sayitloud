class AddUserAgentToHits < ActiveRecord::Migration
  def self.up
    add_column :hits, :user_agent, :string
  end

  def self.down
    remove_column :hits, :user_agent
  end
end
