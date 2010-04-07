require 'erubis'

class Site < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  has_many :subdomains, :dependent => :destroy
  has_many :hits, :dependent => :destroy
  has_many :tweets, :dependent => :destroy
  
  validates_presence_of :name, :domain, :template
  
  def top_subdomains
    Site.find_by_sql(<<-eos
      SELECT
        CONCAT(sd.name, '.', s.domain) as fqdn,
        (SELECT COUNT(DISTINCT uuid) FROM hits WHERE subdomain_id = sd.id AND created_at > (NOW() - INTERVAL 1 DAY)) AS views_today
      FROM 
        subdomains sd INNER JOIN
          sites s ON s.id = sd.site_id
      WHERE
        s.id = #{self.id}
      ORDER BY
        views_today DESC
      LIMIT 10
eos
).collect { |sd| sd.fqdn }
  end
  
  def render_message(message, subdomain)
    tweets = self.tweets.find(:all, :order => "twitter_id DESC", :limit => 5)
    subdomains = self.top_subdomains
    erubis(self.template, :name => subdomain.humanize, :message => erubis(message.body, :name => subdomain.humanize), :subdomains => subdomains, :tweets => tweets)
  end
  
  def erubis(template, values)
    Erubis::Eruby.new(template).result(values)
  end
  
  def self.top_today
    Site.find_by_sql("SELECT *, (SELECT COUNT(DISTINCT uuid) FROM hits WHERE created_at > (NOW() - INTERVAL 1 DAY) AND site_id = sites.id) AS views_today FROM sites ORDER BY views_today DESC")
  end
end
