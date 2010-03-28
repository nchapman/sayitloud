class CreateStaticFiles < ActiveRecord::Migration
  def self.up
    create_table :static_files do |t|
      t.string :name
      t.string :file_file_name
      t.string :file_content_type
      t.string  :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :static_files
  end
end
