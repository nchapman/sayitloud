class Subdomain < ActiveRecord::Base
  belongs_to :site
  
  @@per_page = 25
  cattr_reader :per_page
  
  def humanize
    self.name.gsub(/[\._]/, " ").titlecase
  end
end
