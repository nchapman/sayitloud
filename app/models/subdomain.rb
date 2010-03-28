class Subdomain < ActiveRecord::Base
  belongs_to :site
  
  def humanize
    self.name.gsub(/[\._]/, " ").titlecase
  end
end
