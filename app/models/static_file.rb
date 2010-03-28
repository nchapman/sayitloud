class StaticFile < ActiveRecord::Base
  has_attached_file :file, 
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :bucket => "s3.xloh.com",
                    :s3_host_alias => "s3.xloh.com",
                    :url => ':s3_alias_url',
                    :path => "sayitloud/:id/:basename.:extension"
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_attachment_presence :file
end
