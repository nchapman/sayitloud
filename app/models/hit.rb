class Hit < ActiveRecord::Base
  belongs_to :site
  belongs_to :subdomain
  
  validates_presence_of :uuid
  
  def self.find_top_by_site(site)
    find_by_sql("SELECT host, COUNT(DISTINCT(uuid)) count FROM hits WHERE site_id = #{site.id} AND host <> '#{site.domain}' GROUP BY host ORDER BY count DESC LIMIT 5;")
  end
end
