class Subdomain < ActiveRecord::Base
  belongs_to :site
  has_many :hits, :dependent => :destroy
  
  @@per_page = 25
  cattr_reader :per_page
  
  def humanize
    self.name.gsub(/[\._]/, " ").titlecase
  end
  
  def self.top_today
    today = Date.today.to_formatted_s(:db)
    tomorrow = (Date.today + 1).to_formatted_s(:db)
    
    Site.find_by_sql(<<-eos
      SELECT
        sd.name,
        s.domain AS site_domain,
        (SELECT COUNT(DISTINCT uuid) FROM hits WHERE subdomain_id = sd.id AND created_at > (NOW() - INTERVAL 1 DAY)) AS views_today
      FROM 
        subdomains sd INNER JOIN
          sites s ON s.id = sd.site_id
      ORDER BY
        views_today DESC
      LIMIT 10
eos
)
  end
end
